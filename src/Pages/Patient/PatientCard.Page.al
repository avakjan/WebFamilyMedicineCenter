page 50115 "Patient Card"
{
    PageType = Card;
    SourceTable = "Customer";
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Record identifier';
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit(xRec);
                        Rec.CreateHomeAddress(xRec);
                        CurrPage.Update();
                    end;
                }
                field("Doctor No."; Rec."Doctor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Doctor';
                }
                field("Medicine Center"; Rec."Medicine Center No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine Center';
                }
                field("Email"; Rec."E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Email';
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Firstname"; Rec."First name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First Name';
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Lastname"; Rec."Last name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Name';
                    NotBlank = true;
                    ShowMandatory = true;

                }
                field("Phone Number"; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Phone Number';
                    ShowMandatory = true;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Gender';
                }
                field("Home Location"; Rec."Home Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Home Location';
                }
                field("Personal Code"; Rec."Personal Code")
                {
                    ToolTip = 'Personal Code';
                }
            }
            group(Application)
            {
                field("Application login"; Rec."Client app username")
                {
                    ApplicationArea = All;
                    ToolTip = 'Client application login';
                }
                field("Application password"; Rec."Client app password")
                {
                    ApplicationArea = All;
                    ToolTip = 'Client application password';
                    HideValue = true;
                    ExtendedDatatype = Masked;
                }
            }
            group("Telegram notifications")
            {
                field("Telegram Chat Id"; Rec."Telegram Chat Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Telegram Chat Id';
                }
                label(Instructions)
                {
                    ApplicationArea = All;
                    Caption = 'To get access to telegram notifications about related events, please find VeebiArstiKeskus bot in telegram and write /start to him. After that you will recieve your chat id that you need to enter in this page to activate telegram notifications feature in our application.';
                }
            }
            group("Ledger Entries")
            {
                part("Patient Ledger Entries"; "Patient Ledger Entries Subpage")
                {
                    ApplicationArea = All;
                    Caption = 'Patient Ledger Entries';
                    SubPageLink = "Patient No." = field("No.");
                }
            }
            group("Upcoming visits")
            {
                part(Visits; "Upcoming Visits")
                {
                    ApplicationArea = All;
                    Caption = 'Upcoming visits';
                    Editable = false;
                    SubPageLink = "Patient No." = field("No."), "Is Posted" = const(false);
                }
            }
            group("Medicines Requests")
            {
                part("Requests"; "Medicines Requests Subpage")
                {
                    ApplicationArea = All;
                    Caption = 'Medicines Requests';
                    Editable = false;
                    SubPageLink = "Patient No." = field("No.");
                }
            }
            group("Diagnoses")
            {
                part("Patient Diagnoses"; "Patient Diagnosis Subpage")
                {
                    ApplicationArea = All;
                    Caption = 'History Messages';
                    SubPageLink = "Patient No." = field("No."), "Is Posted" = const(false);
                }
            }

            group("Power of attorney")
            {
                part("Powers of attorney"; "Power of Attorney Subpage")
                {
                    ApplicationArea = All;
                    Caption = 'Powers of attorney';
                    SubPageLink = "Ward No." = field("No.");
                }
            }
        }
        area(factboxes)
        {
            part(Control149; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(FindClosestCenter)
            {
                ToolTip = 'Find Closest Family Center';
                Caption = 'Find Closest Family Center';
                Image = MapSetup;
                trigger OnAction()
                var
                    HomeLocation: Record "Home Location";
                begin
                    HomeLocation.Get(Rec."Home Location Code");
                    Codeunit.Run(Codeunit::"Distance Assistant", HomeLocation);
                    CurrPage.Update();
                end;
            }
        }
        area(Creation)
        {
            action(CreateUpcomingVisit)
            {
                ToolTip = 'Create Upcoming Visit';
                Caption = 'Create Upcoming Visit';
                Image = DueDate;
                trigger OnAction()
                var
                    Visit: Record "Upcoming Visit";
                begin
                    Visit.Init();
                    Visit."Patient No." := Rec."No.";
                    Visit.ApplyNumberSeries(Visit);
                    Visit.Validate("Patient No.");
                    Visit.Insert();
                    Page.Run(Page::"Upcoming Visit", Visit);
                    CurrPage.Update();
                end;
            }
            action(CreateMedicinesRequest)
            {
                ToolTip = 'Create Medicines Request';
                Caption = 'Create Medicines Request';
                Image = DueDate;
                trigger OnAction()
                var
                    Request: Record "Medicines Request Header";
                begin
                    Request.Init();
                    Request."Patient No." := Rec."No.";
                    Request.ApplyNumberSeries(Request);
                    Request.Validate("Patient No.");
                    Request.Insert();
                    Page.Run(Page::"Medicines Request", Request);
                end;
            }
            action(CreateDiagnosis)
            {
                ToolTip = 'Create Diagnosis';
                Caption = 'Create Diagnosis';
                Image = DueDate;
                trigger OnAction()
                var
                    Diagnosis: Record "Patient Diagnosis";
                begin
                    Diagnosis.Init();
                    Diagnosis."Patient No." := Rec."No.";
                    Diagnosis.ApplyNumberSeries(Diagnosis);
                    Diagnosis.Validate("Patient No.");
                    Diagnosis.Date := CurrentDateTime();
                    Diagnosis.Insert();
                    Page.Run(Page::"Patient Diagnosis", Diagnosis);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.Validate("Home Location Code");
    end;
}
