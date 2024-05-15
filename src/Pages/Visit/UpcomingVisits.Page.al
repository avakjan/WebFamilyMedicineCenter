page 50123 "Upcoming Visits"
{
    Caption = 'Upcoming Visits';
    PageType = ListPart;
    Editable = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Upcoming Visit";
    CardPageId = "Upcoming Visit";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Record identifier';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Date';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Type';
                }
            }
        }
    }
}