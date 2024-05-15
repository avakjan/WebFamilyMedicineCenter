page 50101 "Diagnosis History Msg. Subpage"
{
    Caption = 'Diagnosis History Messages';
    PageType = ListPart;
    Editable = true;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Diagnosis History Message";

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