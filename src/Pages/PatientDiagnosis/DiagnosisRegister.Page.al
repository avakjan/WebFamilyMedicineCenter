page 50155 "Diagnosis Register"
{
    PageType = Document;
    Caption = 'Diagnosis Register';
    SourceTable = "Diagnosis Register";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Register No."; Rec."Register No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Register Number';
                }
                field("Patient No."; Rec."Patient No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient Number';
                }
                field("Disease No."; Rec."Disease No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Disease Number';
                }
                field("Patient First Name"; Rec."Patient First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient First Name';
                }
                field("Patient Last Name"; Rec."Patient Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient Last Name';
                }
                field("Disease Name"; Rec."Disease Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Disease Name';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Creation date';
                }
                field("Doctor No."; Rec."Doctor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Doctor No.';
                }
                field("Family Center name"; Rec."Medicine Center Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Family Center name';
                }

            }
            group("History Messages")
            {
                part("Messages"; "Diagnosis Register Lines")
                {
                    ApplicationArea = All;
                    Caption = 'History Messages';
                    SubPageLink = "Diagnosis Register No." = field("Register No.");
                }
            }
        }
    }
}