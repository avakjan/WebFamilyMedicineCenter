page 50107 "Medical Employee List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Medical Employee";
    CardPageId = "Medical Employee Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First Name';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Name';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = All;
                    ToolTip = 'Role';
                }
                field("Family Medicine Center No."; Rec."Medicine Center No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Family Medicine Center No.';
                }
            }
        }
    }
}