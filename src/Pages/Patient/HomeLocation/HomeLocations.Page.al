page 50135 "Home Locations"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Home Location";
    Caption = 'Home Locations';
    Editable = false;
    CardPageId = "Home Location Card";
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
            }
        }
    }
}