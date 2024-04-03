table 50102 PurchaseOrder
{
    DataClassification = ToBeClassified;
    Caption = 'Purchase Order';
    LookupPageId = CreatePOCard;
    DataCaptionFields = No, DocumentType, Vendor;
    DrillDownPageID = CreatePOCard;
    fields
    {
        field(1; DocumentType; Enum DocumentTypePO)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Buy-from Vendor-No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; OrderType; Enum DocumentType)
        {
            DataClassification = ToBeClassified;
        }
        field(4; No; Code[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    No := '';
                end;
            end;
        }
        field(5; OrderDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; PostingDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; DueDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; LocationCode; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(9; DeptCode; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = PRSubformTable.DeptCode;
        }
        field(10; CurrencyCode; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(11; Status; Enum Status)
        {
            DataClassification = ToBeClassified;
        }
        field(12; DeptType; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = PRTable.DeptName;
        }
        field(13; UserID; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Vendor; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; RequireAdvancePayment; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Require Advance Payment';
        }
        field(16; AdvancePaymentAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Advance Payment Amount';
        }
        field(17; DocumentDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(pK; No, DocumentType)
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