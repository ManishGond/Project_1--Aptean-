tableextension 50100 "Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(50; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}