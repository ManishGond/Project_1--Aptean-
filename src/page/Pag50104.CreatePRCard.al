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
                    trigger OnAssistEdit()
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
            part(OpenPurchaseReqLine; CreatePRSubformCard)
            {
                ApplicationArea = All;
                SubPageLink = DocumentNo = field(DocumentNo);
                SubPageView = order(ascending);
            }

        }

    }


    actions
    {
        area(Processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = Alerts;
                action(SendApprovalRequest)
                {
                    ApplicationArea = All;
                    Caption = 'Send A&pproval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        RequestToApprove: Page "Requests to Approve Card";
                        RequestToApproveTable: Record "Approval Entry";
                        ApprovalRequestPublisher: Codeunit PublisherEventPR_2;
                        PRSubformTable: Record PRSubformTable;


                    begin
                        //Request to approval card
                        RequestToApproveTable."Document No." := Rec.DocumentNo;
                        RequestToApproveTable."Sender ID" := UserId;
                        RequestToApproveTable."Approver ID" := UserId;

                        RequestToApproveTable.Status := RequestToApproveTable.Status::Open;
                        RequestToApproveTable.Insert(true);

                        Rec.Find();
                        //Updating the card 
                        Rec.Status := Rec.Status::Pending;

                        // //and subformlink card
                        // PRSubformTable.Status := PRSubformTable.Status::Pending;

                        //Calling the subscriber
                        ApprovalRequestPublisher.SentApproval();
                        Rec.Modify();

                    end;


                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel Send Approval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    ToolTip = 'Cancel Request approval of the document.';
                }

            }
        }
    }

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(OldPR: Record PRTable): Boolean

    begin
        if NoSeriesMgt.SelectSeries('GA-DE-PR', OldPR.DocumentNo, Rec.DocumentNo) then begin
            NoSeriesMgt.SetSeries(Rec.DocumentNo);
            exit(true);
        end;
    end;

    var
        StatusStyleTxt: Text;
        PRTable: Record PRTable;

    trigger OnAfterGetRecord()
    begin

        StatusStyleTxt := GetStatusStyleText();
        Rec.Find();
        Rec.CreatorID := UserId;
        Rec.CreatorName := CompanyName;
        Rec.DocumentDate := DT2Date(CurrentDateTime);
        Rec.Modify();
    end;

    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        if Rec.Status = Rec.Status::Open then
            StatusStyleText := 'Favorable'
        else if Rec.Status = Rec.Status::Pending then
            StatusStyleText := 'Ambiguous'
        else
            StatusStyleText := 'Strong';

        OnAfterGetStatusStyleText(Rec, StatusStyleText);
    end;


    [IntegrationEvent(false, false)]
    local procedure OnAfterGetStatusStyleText(PRTable: Record PRTable; var StatusStyleText: Text)
    begin
    end;
}