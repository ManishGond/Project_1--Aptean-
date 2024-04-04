//This is for GA Dept.
page 50111 ReleasedPurchaseRequisition
{
    Caption = 'Released Purchase Requisition List';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = PRSubformTable;
    SourceTableView = where(Status = filter(Released));
    layout
    {
        area(Content)
        {
            repeater(GAGroup)
            {
                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;

                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;

                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(RequestorQuantity; Rec.RequestorQuantity)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetFilter(Status, 'Released');
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        PurchLine: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
    begin
        if CloseAction = Action::OK then begin
            PurchLine.SetRange(Type, rec.Type);
            PurchLine.FindSet();
            PurchLine."Document No." := rec.DocumentNo;
            PurchHeader.Insert(true);

        end
        else begin
            Message('Exited!');
            exit(true);
        end;
    end;
}