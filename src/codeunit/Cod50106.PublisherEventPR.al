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

codeunit 50103 PublisherEventPR_3
{
    [IntegrationEvent(false, false)]
    procedure SentApproval2()
    begin
    end;
}

codeunit 50107 PublisherEventPR4
{
    [IntegrationEvent(false, false)]
    procedure StatusChange2(var ApprovalEntry: Record "Approval Entry")
    begin

    end;
}