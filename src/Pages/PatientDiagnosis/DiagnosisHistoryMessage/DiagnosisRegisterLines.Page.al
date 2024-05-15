page 50156 "Diagnosis Register Lines"
{
    Caption = 'Diagnosis Register Lines';
    PageType = ListPart;
    Editable = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Diagnosis Register Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Message; Rec.Message)
                {
                    ApplicationArea = All;
                    ToolTip = 'Message';
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Medical Employee No."; Rec."Medical Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medical Employee No.';
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Date';
                    NotBlank = true;
                    ShowMandatory = true;
                }
            }
        }
    }
}