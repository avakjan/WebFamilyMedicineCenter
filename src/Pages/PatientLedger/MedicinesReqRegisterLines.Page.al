page 50129 "Medicines Req. Register Lines"
{
    Caption = 'Medicines Request Register Lines';
    PageType = ListPart;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = None;
    AutoSplitKey = true;
    SourceTable = "Medicines Req. Register Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Medicine No."; Rec."Medicine No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine No.';
                }
                field("Medicine Name"; Rec."Medicine Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine Name';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Reason';
                }
            }
        }
    }
}