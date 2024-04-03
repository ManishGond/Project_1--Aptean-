report 50109 ReportGeneration
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'PurchaseRequisitionReport.rdlc';


    dataset
    {
        dataitem(Header; PRTable)
        {
            RequestFilterFields = DocumentNo;
            dataitem("PR Subform Table"; PRSubformTable)
            {
                DataItemLink = DocumentNo = field(DocumentNo);

                column(Type; Type)
                {

                }
                column(Line_No_; LineNo)
                {

                }
                column(Item_No; ItemNo)
                {

                }
                column(Unit_Of_Measure_Code; UnitOfMeasure)
                {

                }
                column(Item_Description; Description)
                {

                }
                column(Date_Needed; DateNeeded)
                {

                }
                column(Document_No_; DocumentNo)
                {

                }

                column(DeptCode; DeptCode)
                {

                }
                column(Purpose; Purpose)
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
                    field(Item_No; "PR Subform Table".ItemNo)
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