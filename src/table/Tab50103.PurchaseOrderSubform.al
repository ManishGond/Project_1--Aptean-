table 50103 PurchaseOrderSubform
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Type; Enum Type)
        {
            DataClassification = ToBeClassified;
        }
        field(2; LineNo; Code[50])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; DocumentNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; PrNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; UnitOfMeasure; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(5; VATProd; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; WHTBusiness; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; WHTAbsorbBase; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(pk; Type, LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}