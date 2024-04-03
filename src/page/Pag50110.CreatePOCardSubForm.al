page 50110 CreatePOCardSubForm
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PurchaseOrderSubform;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true; //VERY IMPORTANT
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;

                }
                field(PrNo; Rec.PrNo)
                {
                    ApplicationArea = All;

                }
                field(UnitOfMeasure; Rec.UnitOfMeasure)
                {
                    ApplicationArea = All;

                }
                field(VATProd; Rec.VATProd)
                {
                    ApplicationArea = All;

                }
                field(WHTBusiness; Rec.WHTBusiness)
                {
                    ApplicationArea = All;

                }
                field(WHTAbsorbBase; Rec.WHTAbsorbBase)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
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
    var
        PurchaseOrder: Record PurchaseOrder;
    begin
        // PurchaseOrder.FindSet();
        // Rec.PrNo := PurchaseOrder.No;
        // PurchaseOrder.Modify();
    end;

}