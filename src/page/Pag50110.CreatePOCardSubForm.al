page 50110 CreatePOCardSubForm
{
    PageType = ListPart;
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
                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;

                }
                field(PrNo; Rec.PrNo)
                {
                    Visible = true;
                    ApplicationArea = All;
                    Editable = false;

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

        }
    }


}