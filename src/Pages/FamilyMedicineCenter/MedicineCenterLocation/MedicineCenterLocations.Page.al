page 50125 "Medicine Center Locations"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Medicine Center Location";
    Caption = 'Medicine Center Locations';
    Editable = true;
    CardPageId = "Medicine Center Location Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowCaption = false;
                field(Code; Rec.Code)
                {
                    ToolTip = 'Code';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Name';
                }
            }
        }
    }
}