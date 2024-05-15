page 50111 "Patient Diagnosis Subpage"
{
    PageType = ListPart;
    Editable = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Patient Diagnosis";
    CardPageId = "Patient Diagnosis";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Disease Name"; Rec."Disease Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Disease Name';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Date of creation';
                }
                field("Medical Employee"; Rec."Medical Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medical Employee';
                }
            }
        }
    }
}