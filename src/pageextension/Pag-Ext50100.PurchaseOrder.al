pageextension 50100 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Buy-from Vendor Name")
        {

        }
    }

    actions
    {
        addafter("P&osting")
        {

            action("Get Pr lines")
            {
                ApplicationArea = All;
                Caption = 'Select PR Items';
                Ellipsis = true;
                Image = NewItem;

                trigger OnAction()
                var
                    PRSubformTable: Record PRSubformTable;
                    ReleasePurchaseReq: Page ReleasedPurchaseRequisition;
                    PurchLine: Record "Purchase Line";

                    SelectionFilter: Text;
                begin

                    PRSubformTable.SetRange(Status, PRSubformTable.Status::Released);
                    PRSubformTable.FindSet();
                    ReleasePurchaseReq.LookupMode(true);
                    if ReleasePurchaseReq.RunModal() = Action::LookupOK then begin
                        PurchLine.SetRange("Document Type", Rec."Document Type"::Order);
                        PurchLine.SetRange("Document No.", Rec."No.");
                        if not PurchLine.FindSet() then begin
                            PurchLine.Init();
                            PurchLine."Line No." += 10000;
                            PurchLine."Document Type" := Rec."Document Type";
                            PurchLine."Document No." := Rec."No.";
                            PurchLine.Type := PRSubformTable.Type;
                            PurchLine."No." := PRSubformTable.ItemNo;
                            PurchLine.Description := PRSubformTable.Description;
                            PurchLine.Insert(true);
                        end
                        else
                            if Confirm('Record already exists. Do you want to Modify the existing Record?', true) then BEGIN
                                PurchLine.Type := PRSubformTable.Type;
                                PurchLine."No." := PRSubformTable.ItemNo;
                                PurchLine.Description := PRSubformTable.Description;
                                PurchLine.Modify(true);
                            end;
                    end;
                end;

            }

        }
    }








}