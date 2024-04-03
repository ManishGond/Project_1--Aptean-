// Three standard purchase orders
// 1.	Inventory Asset Purchase Order List 
// 2.	Direct Expense Purchase Order List 
// 3.	Fixed Asset Purchase Order List 


page 50106 InventoryAssetPurchaseOrder
{
    Caption = 'Inventory Asset Purchase Order';
    PageType = List;
    ApplicationArea = All;
    CardPageId = CreatePOCard;
    UsageCategory = Lists;
    SourceTable = PurchaseOrder;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GAGroup)
            {
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;

                }
                field("Buy-from Vendor-No"; Rec."Buy-from Vendor-No")
                {
                    ApplicationArea = All;
                }
                field(OrderType; Rec.OrderType)
                {
                    ApplicationArea = All;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(OrderDate; Rec.OrderDate)
                {
                    ApplicationArea = All;
                }
                field(PostingDate; Rec.PostingDate)
                {
                    ApplicationArea = All;
                }
                field(DueDate; Rec.DueDate)
                {
                    ApplicationArea = All;
                }
                field(LocationCode; Rec.LocationCode)
                {
                    ApplicationArea = All;
                }
                field(DeptCode; Rec.DeptCode)
                {
                    ApplicationArea = All;
                }
                field(CurrencyCode; Rec.CurrencyCode)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(DeptType; Rec.DeptType)
                {
                    ApplicationArea = All;
                }
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}