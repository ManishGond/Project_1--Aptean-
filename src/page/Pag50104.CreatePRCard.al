page 50104 CreatePRCard
{
    Caption = 'Create Purchase Requisition';
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = PRTable;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(DocumentNo; Rec.DocumentNo)
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                    NotBlank = true;
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        NoSeries: Record "No. Series";
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(RequestFor; Rec.RequestFor)
                {
                    ApplicationArea = All;
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;
                }
                field(CreatorID; Rec.CreatorID)
                {
                    Caption = 'Creator ID';
                    ApplicationArea = All;

                }
                field(CreatorName; Rec.CreatorName)
                {
                    Caption = 'Creator Name';
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
                    Importance = Promoted;
                    QuickEntry = false;
                    StyleExpr = StatusStyleTxt;
                }
                field(DocumentDate; Rec.DocumentDate)
                {
                    ApplicationArea = All;
                }
                field(ReleasedDate; Rec.ReleasedDate)
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
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

    procedure AssistEdit(OldPR: Record PRTable): Boolean
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if NoSeriesMgt.SelectSeries('GA-DE-PR', OldPR.DocumentNo, Rec.DocumentNo) then begin
            NoSeriesMgt.SetSeries(Rec.DocumentNo);
            exit(true);
        end;
    end;

    var
        StatusStyleTxt: Text;
        PRTable: Record PRTable;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Rec.FindSet();
        Rec.CreatorID := UserId;
        Rec.CreatorName := CompanyName;
        Rec.Modify();
    end;

    trigger OnAfterGetCurrRecord()
    begin

        StatusStyleTxt := GetStatusStyleText();
    end;

    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        if Rec.Status = Rec.Status::Open then
            StatusStyleText := 'Favorable'
        else
            StatusStyleText := 'Strong';

        OnAfterGetStatusStyleText(Rec, StatusStyleText);
    end;


    [IntegrationEvent(false, false)]
    local procedure OnAfterGetStatusStyleText(PRTable: Record PRTable; var StatusStyleText: Text)
    begin
    end;
}