report 50100 ReportGenerationPO
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'PurchaseRequisitionReportPO.rdlc';


    dataset
    {
        dataitem(Header; "Purchase Header")
        {
            RequestFilterFields = "No.";
            dataitem(PurchaseLine; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(Type; Type)
                {

                }
                column(Line_No_; "Line No.")
                {

                }
                column(No_; "No.")
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Item_Description; Description)
                {

                }
                column(Reserved_Quantity; "Reserved Quantity")
                {

                }

                column(UserId; UserId)
                {

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(DocumentNo; PurchaseLine."Document No.")
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}