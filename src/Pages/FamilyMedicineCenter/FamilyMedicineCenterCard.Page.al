page 50147 "Family Medicine Center Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Family Medicine Center";
    layout
    {
        area(Content)
        {
            group(General)
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field("Medicine Center Location Code"; Rec."Medicine Center Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine Center Location Code';
                }
                field("Contact Phone"; Rec."Contact phone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contact Phone';
                }
                field("Contact Email"; Rec."Contact email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contact Email';
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