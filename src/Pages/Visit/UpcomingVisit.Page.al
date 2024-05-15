page 50119 "Upcoming Visit"
{
    PageType = Document;
    Caption = 'Upcoming Visit';
    SourceTable = "Upcoming Visit";
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
            }
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Record identifier';
                }
                field("Patient No."; Rec."Patient No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient Number';
                    ShowMandatory = true;
                }
                field("Family Center No."; Rec."Family Center No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Family Center Number';
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
                field("Medical Employee No."; Rec."Medical Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medical Employee Number';
                    ShowMandatory = true;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Visit Type';
                    ShowMandatory = true;
                }
            }
            group("Online Visit")
            {
                field("Is Online"; Rec."Is Online")
                {
                    ApplicationArea = All;
                    ToolTip = 'Is visit online';
                }
                field("Meeting Link"; Rec."Meeting Link")
                {
                    ApplicationArea = All;
                    ToolTip = 'Meeting Link';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Post")
            {
                Caption = 'Post';
                ToolTip = 'Post';
                Image = Post;
                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Visit Post UI", Rec);
                    if (Rec."Is Posted") then begin
                        CurrPage.Close();
                        Rec.Delete();
                    end;
                end;
            }
            action("Cancel Visit")
            {
                Caption = 'Cancel Visit';
                ToolTip = 'Cancel Visit';
                Image = Cancel;
                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Visit Cancel UI", Rec);
                    if (Rec."Is Posted") then begin
                        CurrPage.Close();
                        Rec.Delete();
                    end;
                end;
            }
            action("Inform Customer(Telegram)")
            {
                Caption = 'Inform Customer(Telegram)';
                ToolTip = 'Inform Customer(Telegram)';
                Image = ExportMessage;
                trigger OnAction()
                var
                    visitsSetup: Record "Visits Setup";
                    tgAssisatant: Codeunit "Telegram assistant";
                begin
                    visitsSetup.Get();
                    Rec.CalcFields("Patient Name", "Medicine Center Name", "Medical Employee Name", "Telegram Chat Id");
                    tgAssisatant.SendTelegramMessage(Rec."Telegram Chat id", visitsSetup."Telegram bot token", Rec.GetMessage());
                end;
            }
            action("Inform Customer(Email)")
            {
                Caption = 'Inform Customer(Email)';
                ToolTip = 'Inform Customer(Email)';
                Image = Email;
                trigger OnAction()
                var
                    visitsSetup: Record "Visits Setup";
                    emailAssisatant: Codeunit "Email assistant";
                begin
                    visitsSetup.Get();
                    Rec.CalcFields("Patient Name", "Medicine Center Name", "Medical Employee Name", "Patient E-Mail");
                    emailAssisatant.SendEmail('Visit info', Rec.GetMessage(), Rec."Patient E-Mail");
                end;
            }

        }
    }
}
