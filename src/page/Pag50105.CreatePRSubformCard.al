page 50105 CreatePRSubformCard
{
    PageType = ListPart;
    Caption = 'Open Purchase Req Line';
    SourceTable = PRSubformTable;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true; //VERY IMPORTANT
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field("Line No."; Rec.LineNo)
                {
                    ApplicationArea = Suite;

                }
                field("Document No."; Rec.DocumentNo)
                {
                    Visible = true;
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Item No"; Rec.ItemNo)
                {
                    ApplicationArea = All;
                }
                field("Unit Of Measure Code"; Rec.UnitOfMeasure)
                {
                    ApplicationArea = All;
                    TableRelation = "Unit of Measure";

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field("Reserved Quantity"; Rec.RequestorQuantity)
                {
                    ApplicationArea = All;

                }
                field("Requestor User Id"; Rec.UserId)
                {
                    ApplicationArea = All;

                }
                field("Requestor User Name"; Rec.RequestorName)
                {
                    ApplicationArea = All;

                }
                field("Deptt Code"; Rec.DeptCode)
                {
                    ApplicationArea = All;

                }
                field("Sub Account Code"; Rec.SubAccountCode)
                {
                    ApplicationArea = All;

                }
                field("Date Needed"; Rec.DateNeeded)
                {
                    ApplicationArea = All;

                }
                field(Purpose; Rec.Purpose)
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
            action(SelectMultiItems)
            {
                ApplicationArea = All;
                Caption = 'Select items';
                trigger OnAction()
                begin

                end;
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;

                    action("event")
                    {
                        ApplicationArea = All;
                        Caption = 'Event';
                        Image = "Event";

                        trigger OnAction()
                        begin

                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = Planning;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        trigger onAction()
                        begin

                        end;
                    }
                    action(Location)
                    {
                        ApplicationArea = Location;
                        Caption = 'Location';
                        Image = Warehouse;
                        trigger onAction()
                        begin

                        end;
                    }
                    action(Lot)
                    {
                        ApplicationArea = Itemtracking;
                        Caption = 'Lot';
                        Image = LotInfo;
                        trigger onAction()
                        begin

                        end;
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Assembly';
                        Image = BOMLevel;
                        trigger onAction()
                        begin

                        end;
                    }
                }
                action("Reservation Entries")
                {
                    ApplicationArea = Reservation;
                    Caption = 'Reservation Entries';
                    Image = ReservationLedger;

                    trigger onaction()
                    begin

                    end;
                }
                action("Item trackng Lines")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Lines';
                    image = ItemTrackingLines;
                    trigger OnAction()
                    begin

                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Dimensions';
                    image = Dimensions;
                    trigger OnAction()
                    begin

                    end;
                }
            }
            group("&Functions")
            {
                action("Explode BOM")
                {
                    ApplicationArea = Assembly;
                    Caption = 'Explore BOM';
                    Image = ExplodeBOM;
                    trigger OnAction()
                    begin

                    end;
                }
                action("Insert Ext. Text")
                {
                    ApplicationArea = Suite;
                    Caption = 'Insert Ext. Text';
                    Image = Text;
                    trigger OnAction()
                    begin

                    end;
                }


            }
        }
    }

    trigger OnAfterGetRecord()
    var
        PRTable: Record PRTable;
    begin
        PRTable.FindSet();
        Rec.UserId := PRTable.CreatorID;
        Rec.RequestorName := PRTable.CreatorName;
        Rec.Modify();
    end;
}