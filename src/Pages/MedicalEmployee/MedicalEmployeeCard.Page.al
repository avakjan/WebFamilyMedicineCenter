page 50106 "Medical Employee Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Medical Employee";
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
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First Name';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Name';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = All;
                    ToolTip = 'Role';
                }
                field(Room; Rec.Room)
                {
                    ApplicationArea = All;
                    ToolTip = 'Room';
                }
                field("Family Medicine Center No."; Rec."Medicine Center No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Family Medicine Center No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Email';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Phone Number';
                }
                field("Personal Code"; Rec."Personal Code")
                {
                    ToolTip = 'Personal Code';
                }
                field("Default meeting link"; Rec."Default meeting link")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default meeting link';
                }
            }
            part(Patients; "Patient Subpage")
            {
                ApplicationArea = All;
                Caption = 'Patients';
                SubPageLink = "Doctor No." = field("No.");
            }
            part("Upcoming Visits"; "Upcoming Visits")
            {
                ApplicationArea = All;
                Caption = 'Upcoming visits';
                Editable = false;
                SubPageLink = "Medical Employee No." = field("No."), "Is Posted" = const(false);
            }
        }
    }
}