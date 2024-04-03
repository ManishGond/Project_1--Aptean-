table 50100 PRTable
{
    DataClassification = ToBeClassified;
    LookupPageId = CreatePRCard;
    DataCaptionFields = DocumentNo, RequestorName;
    DrillDownPageID = CreatePRCard;

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if DocumentNo <> xRec.DocumentNo then begin
                    DocumentNo := '';
                end;
            end;
        }
        field(2; RequestorName; Text[100])
        {
            Caption = 'Requestor Name';
            DataClassification = ToBeClassified;
        }
        field(3; DocumentType; Enum DocumentType)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
        }
        field(4; DeptName; Text[100])
        {
            Caption = 'Department Name';
            DataClassification = ToBeClassified;
        }
        field(5; LocationCode; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location.Code;
            DataClassification = ToBeClassified;
        }
        field(6; "Status"; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionMembers = Open,Released,Pending;
            DataClassification = ToBeClassified;
        }
        field(7; DocumentDate; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(8; ReleasedDate; Date)
        {
            Caption = 'Released Date';
            DataClassification = ToBeClassified;
        }
        field(9; UserId; Code[50])
        {
            Editable = false;
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(10; LastModified; Date)
        {
            Caption = 'Last Modified';
            DataClassification = ToBeClassified;
        }
        field(11; RequestFor; Enum RequestFor)
        {
            DataClassification = ToBeClassified;
        }
        field(12; CreatorID; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; CreatorName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Pk; DocumentNo)
        {
            Clustered = true;
        }
    }
}