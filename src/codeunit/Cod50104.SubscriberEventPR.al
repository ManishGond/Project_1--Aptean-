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
        SubformTable: Record PRSubformTable;
}


codeunit 50102 SubscriberEventPR_3
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublisherEventPR_3, 'SentApproval2', '', false, false)]
    local procedure SubscriberPrFunc()
    begin
        Message('Sent for Approval');
    end;
}

codeunit 50106 SubscriberEventPR_4
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublisherEventPR4, 'StatusChange2', '', false, false)]

    local procedure StatusChangeFunc(var ApprovalEntry: Record "Approval Entry")
    begin
        ApprovalEntry.SetRange("Document No.");
        ApprovalEntry.FindSet();
        POTable.Status := POTable.Status::Released;
        POTable."Assigned User ID" := UserId;
        Message('Approved!');


    end;

    var
        POTable: Record "Purchase Header";
}
