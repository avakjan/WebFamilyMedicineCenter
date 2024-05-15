page 50104 "Medicines Requests Subpage"
{
    Caption = 'Medicine Requests';
    PageType = ListPart;
    Editable = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Medicines Request Header";
    CardPageId = "Medicines Request";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'No.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                }
                field("Status"; Rec."Document Status")
                {
                    ToolTip = 'Status';
                }
            }
        }
    }
}