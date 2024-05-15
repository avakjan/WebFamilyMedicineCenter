page 50110 "Patient Diagnosis"
{
    PageType = Document;
    Caption = 'Patient Diagnosis';
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Patient Diagnosis";
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document No.';
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
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Creation date';
                }
                field("Doctor No."; Rec."Doctor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Doctor No.';
                }
                field("Doctor name"; Rec."Medical Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Doctor Name';
                }
                field("Family Center name"; Rec."Medicine Center Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Family Center name';
                }

            }
            group("History Messages")
            {
                part("Messages"; "Diagnosis History Msg. Subpage")
                {
                    ApplicationArea = All;
                    Caption = 'History Messages';
                    SubPageLink = "Document No." = field("Document No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Close Diagnosis")
            {
                Caption = 'Close Diagnosis';
                ToolTip = 'Close Diagnosis';
                Image = Post;
                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Patient Diagnosis Post UI", Rec);
                    if (Rec."Is Posted") then begin
                        CurrPage.Close();
                        Rec.Delete();
                    end;
                end;
            }
            action("Get Diagnosis File")
            {
                ApplicationArea = All;
                ToolTip = 'Diagnosis Word File';
                Image = Word;
                trigger OnAction();
                begin
                    Rec.PrintOrder();
                end;
            }
        }
    }
}