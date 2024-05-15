page 50108 "Medicines Req. Lines Subpage"
{
    Caption = 'Medicines Request Lines';
    PageType = ListPart;
    Editable = true;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Medicines Request Line";

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