page 50109 CreatePOCard
{
    Caption = 'Create Purchase Requisition';
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = PurchaseOrder;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
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
                field("Buy-from Vendor-No"; Rec."Buy-from Vendor-No")
                {
                    ApplicationArea = All;
                }
                field(Vendor; Rec.Vendor)
                {
                    ApplicationArea = All;
                }
                field(LocationCode; Rec.LocationCode)
                {
                    Caption = 'Location Code';
                    ApplicationArea = All;

                }
                field(DeptType; Rec.DeptType)
                {
                    Caption = 'Dept Type';
                    ApplicationArea = All;
                }
                field(RequireAdvancePayment; Rec.RequireAdvancePayment)
                {
                    ApplicationArea = All;
                }
                field(AdvancePaymentAmount; Rec.AdvancePaymentAmount)
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
            }
            part(InvtPurchaseOrderSubform; CreatePOCardSubForm)
            {
                Caption = 'Invt. Purchase Order Subform';
                ApplicationArea = All;
                SubPageLink = PrNo = field(No);
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
                        // Request to approval card
                        RequestToApproveTable."Document No." := Rec.No;
                        RequestToApproveTable."Sender ID" := UserId;
                        RequestToApproveTable."Approver ID" := UserId;
                        RequestToApproveTable.Status := RequestToApproveTable.Status::Open;
                        RequestToApproveTable.Insert(true);
                        Commit();

                        Rec.Find();
                        // Updating the card 
                        Rec.Status := Rec.Status::Pending;
                        // Rec.RequestorName := UserId;
                        Commit();

                        // and SubFormLink Card
                        // PRSubformTable.Status := PRSubformTable.Status::Pending;

                        //Calling the subscriber
                        ApprovalRequestPublisher.SentApproval();
                        Rec.Modify();

                        Commit();

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

            group(Report)
            {
                Image = Report2;
                action(GenerateReport)
                {
                    Caption = 'Generate Report';
                    Image = Report;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        PurchaseOrder: Record PurchaseOrder;
                    begin
                        PurchaseOrder.SetFilter(No, Rec.No);
                        Commit();
                        Report.Run(Report::ReportGeneration, true, true, PRTable);
                        Commit();
                    end;
                }
            }
        }
    }

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(OldPR: Record PurchaseOrder): Boolean

    begin
        if NoSeriesMgt.SelectSeries('PR-PO', OldPR.No, Rec.No) then begin
            NoSeriesMgt.SetSeries(Rec.No);
            exit(true);
        end;
    end;

    var
        StatusStyleTxt: Text;
        PRTable: Record PRTable;
        PRSubForTable: Record PRSubformTable;

    trigger OnAfterGetRecord()
    begin

        StatusStyleTxt := GetStatusStyleText();
        // Rec.Find();
        // Rec.CreatorID := UserId;
        // Rec.CreatorName := CompanyName;
        // Rec.DocumentDate := DT2Date(CurrentDateTime);

        Rec.Modify();
        Commit();
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
    local procedure OnAfterGetStatusStyleText(PurchaseOrder: Record PurchaseOrder; var StatusStyleText: Text)
    begin
    end;
}