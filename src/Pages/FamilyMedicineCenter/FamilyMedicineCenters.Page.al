page 50102 "Family Medicine Centers"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = "Family Medicine Center";
    CardPageId = "Family Medicine Center Card";
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
                field("Medicine Center Location Code"; Rec."Medicine Center Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine Center Location Code';
                }
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                    ToolTip = 'Image';
                }
            }
        }
    }
}