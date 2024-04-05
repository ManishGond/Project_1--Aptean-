pageextension 50100 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        addafter("P&osting")
        {

            action("Get Pr lines")
            {
                ApplicationArea = All;
                Caption = 'Get PR Lines';
                Enabled = true;

                trigger OnAction()
                var
                    PRSubformTable: Record PRSubformTable;
                    test: Boolean;
                    ReleasePurchaseReq: Page ReleasedPurchaseRequisition;
                    PurchaseLines: Record "Purchase Line";
                begin

                    PRSubformTable.SetRange(Status, PRSubformTable.Status::Released);
                    ReleasePurchaseReq.LookupMode(true);
                    if ReleasePurchaseReq.RunModal() = Action::LookupOK then begin
                        // rec.SetFilter("Document No.", PRSubformTable.DocumentNo);
                        // rec."Document Type" := PRSubformTable.Type;
                        // rec."Posting Description" := PRSubformTable.Description;
                        // rec."No." := PRSubformTable.ItemNo;
                        // rec.Modify(true);


                        CurrPage.SetSelectionFilter(PurchaseLines);
                        //CurrPage.PurchLines.PAGE.LookupMode(PurchaseLines);
                    end;

                    PRSubformTable.FindSet(test);

                end;

            }

        }
    }

    var
        myInt: Integer;
}