table 50101 PRSubformTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Type; Enum Type)
        {
            DataClassification = ToBeClassified;
        }
        field(2; LineNo; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
        }
        field(3; ItemNo; Code[50])
        {
            Caption = 'Item No';
            DataClassification = ToBeClassified;
        }
        field(4; DocumentNo; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; UnitOfMeasure; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(6; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; RequestorQuantity; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Requestor Quantity';
        }
        field(8; UserId; Code[50])
        {
            Caption = 'Requestor User Id';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; RequestorName; Text[100])
        {
            Caption = 'Requestor User Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; DeptCode; Code[50])
        {
            Caption = 'Dept. Code';
            DataClassification = ToBeClassified;
        }
        field(11; SubAccountCode; Code[10])
        {
            Caption = 'Sub Account code';
            DataClassification = ToBeClassified;
        }
        field(12; DateNeeded; Date)
        {
            Caption = 'Date Needed';
            DataClassification = ToBeClassified;
        }
        field(13; Purpose; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Test,Live;
        }
        field(16; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Pending,Released;
            Editable = false;
        }
    }

    keys
    {
        key(Pk; DocumentNo, LineNo)
        {
            Clustered = true;
        }
    }
}