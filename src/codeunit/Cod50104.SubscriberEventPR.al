codeunit 50104 SubscriberEventPR
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublisherEventPR_2, 'SentApproval', '', false, false)]
    local procedure SubscriberPrFunc()
    begin
        Message('Sent for Approval');
    end;
}

codeunit 50105 SubscriberEventPR_2
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublisherEventPR, 'StatusChange', '', false, false)]

    local procedure StatusChangeFunc(var ApprovalEntry: Record "Approval Entry")
    begin
        ApprovalEntry.SetRange("Document No.");
        ApprovalEntry.FindSet();
        PRTable.Status := PRTable.Status::Released;
        Message('Approved!');


    end;

    var
        PRTable: Record PRTable;
}