page 50103 "Power of Attorney Subpage"
{
    Caption = 'Power of Attorney Subpage';
    PageType = ListPart;
    Editable = true;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Power of Attorney";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attorney No."; Rec."Attorney No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Attorney No.';
                }
                field("Attorney Name"; Rec."Attorney Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Attorney Name';
                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Valid From';
                }
                field("Valid To"; Rec."Valid To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Valid To';
                }
            }
        }
    }
}