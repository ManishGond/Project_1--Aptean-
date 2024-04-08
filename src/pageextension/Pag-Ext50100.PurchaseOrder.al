pageextension 50100 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Buy-from Vendor Name")
        {

        }
    }

    actions
    {
        addafter("P&osting")
        {

            action("Get Pr lines")
            {
                ApplicationArea = All;
                Caption = 'Select PR Items';
                Ellipsis = true;
                Image = NewItem;

                trigger OnAction()
                var
                    PRSubformTable: Record PRSubformTable;
                    ReleasePurchaseReq: Page ReleasedPurchaseRequisition;
                    PurchLine: Record "Purchase Line";
                    SelectionFilter: Text;
                begin

                    PRSubformTable.SetRange(Status, PRSubformTable.Status::Released);
                    ReleasePurchaseReq.LookupMode(true);
                    if ReleasePurchaseReq.RunModal() = Action::LookupOK then begin
                        PurchLine.SetRange("Document Type", Rec."Document Type"::Order);
                        PurchLine.SetRange("Document No.", Rec."No.");
                        if not PurchLine.FindLast() then begin
                            PurchLine."Line No." := 10000;
                        end
                        else begin
                            PurchLine."Line No." := PurchLine."Line No." + 10000;

                        end;
                        PurchLine."Document Type" := Rec."Document Type";
                        PurchLine."Document No." := Rec."No.";
                        ReleasePurchaseReq.GetRecord(PRSubformTable);
                        PurchLine.Type := PRSubformTable.Type;
                        PurchLine."No." := PRSubformTable.ItemNo;
                        PurchLine.Quantity := PRSubformTable.RequestorQuantity;
                        PurchLine.Description := PRSubformTable.Description;
                        PurchLine.Insert(true);
                    end;
                end;


            }

            //rEQUEST TO APPROVE

            group("Request Approval PO")
            {
                Caption = 'Request Approval';
                Image = Alerts;
                action(POSendApprovalRequest)
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
                        ApprovalRequestPublisher: Codeunit PublisherEventPR_3;


                    begin
                        // Request to approval card
                        RequestToApproveTable."Document No." := Rec."No.";
                        RequestToApproveTable."Sender ID" := UserId;
                        RequestToApproveTable."Approver ID" := UserId;
                        RequestToApproveTable.Status := RequestToApproveTable.Status::Open;
                        RequestToApproveTable.Insert(true);
                        Commit();

                        Rec.Find();
                        // Updating the card 
                        Rec.Status := Rec.Status::"Pending Approval";
                        Commit();

                        //Calling the subscriber
                        ApprovalRequestPublisher.SentApproval2();
                        Rec.Modify();

                        Commit();

                    end;


                }
                action(CancelApprovalRequestPO)
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
                        PHTable: Record "Purchase Header";
                    begin
                        PHTable.SetFilter("No.", PHTable."No.");
                        Report.Run(Report::ReportGenerationPO, true, true, PHTable);
                        Commit();
                    end;
                }
            }
        }




    }
}



