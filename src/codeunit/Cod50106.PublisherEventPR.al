codeunit 50100 PublisherEventPR
{
    [IntegrationEvent(false, false)]
    procedure StatusChange(var ApprovalEntry: Record "Approval Entry")
    begin

    end;
}

codeunit 50101 PublisherEventPR_2
{
    [IntegrationEvent(false, false)]
    procedure SentApproval()
    begin
    end;
}