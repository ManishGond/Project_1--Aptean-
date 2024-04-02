//This is for GA Dept.

page 50100 GAPurchaseRequisitionList
{
    Caption = 'GA Purchase Requisition List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = PRTable;
    CardPageId = CreatePRCard;

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
                field(RequestorName; Rec.RequestorName)
                {
                    ApplicationArea = All;
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;
                }
                field(DeptName; Rec.DeptName)
                {
                    ApplicationArea = All;
                }
                field(LocationCode; Rec.LocationCode)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(DocumentDate; Rec.DocumentDate)
                {
                    ApplicationArea = All;
                }
                field(ReleasedDate; Rec.ReleasedDate)
                {
                    ApplicationArea = All;
                }
                field(UserId; Rec.UserId)
                {
                    ApplicationArea = All;
                }
                field(LastModified; Rec.LastModified)
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

    var
        myInt: Integer;
}