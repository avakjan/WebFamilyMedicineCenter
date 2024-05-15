page 50120 "Visit Register"
{
    PageType = Document;
    Caption = 'Visit Register';
    SourceTable = "Visit Register";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group("Visit Results")
            {
                field("Medical Employee Comment"; Rec."Medical Employee Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medical Employee Comment';
                    ShowMandatory = true;
                }
                field("Patient Comment"; Rec."Patient Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient Comment';
                    ShowMandatory = true;
                }
                field("Is Online"; Rec."Is Online")
                {
                    ApplicationArea = All;
                    ToolTip = 'Is visit online';
                }
                field("Is Cancelled"; Rec."Is Cancelled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Is visit online';
                }
            }
            group(General)
            {
                field("No."; Rec."Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Record identifier';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date';
                    ShowMandatory = true;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field("Family Center No."; Rec."Family Center No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Family Center Number';
                    ShowMandatory = true;
                }
                field("Medical Employee No."; Rec."Medical Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medical Employee Number';
                    ShowMandatory = true;
                }
                field("Patient No."; Rec."Patient No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient Number';
                    ShowMandatory = true;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Visit Type';
                    ShowMandatory = true;
                }
            }
        }
    }
}

