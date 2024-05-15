page 50109 "Diseases"
{
    PageType = List;
    Editable = true;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Disease;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
            }
        }
    }
}