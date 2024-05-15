page 50126 "Medicines Req. Jrnl. Lines"
{
    Caption = 'Medicines Request Journal Lines';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    Editable = false;
    SourceTable = "Medicines Req. Journal Line";

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

    actions
    {
        area(Processing)
        {
        }
    }
}