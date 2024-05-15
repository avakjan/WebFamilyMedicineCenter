page 50118 "Medicines Req. Journal"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Medicines Req. Journal Batch";

    layout
    {
        area(Content)
        {
            group(Response)
            {
                field("Reviewer No."; Rec."Reviewer No.")
                {
                    ToolTip = 'Reviewer No.';
                }
                field("Doctor Comment"; Rec."Doctor Comment")
                {
                    ToolTip = 'Doctor Comment';
                }
                field("Notify user"; "Notify User")
                {
                    ToolTip = 'Notify user';
                    Caption = 'Notify user';
                }
            }
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Document No.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                    Editable = false;
                }
                field("Patient No."; Rec."Patient No.")
                {
                    ToolTip = 'Patient No.';
                    Editable = false;
                }
                field("Status"; Rec.Status)
                {
                    ToolTip = 'Status';
                    Editable = false;
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ToolTip = 'Patient Name';
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Posting Date';
                    Editable = false;
                }
            }
            group(Medicines)
            {
                part("Requested medicines"; "Medicines Req. Jrnl. Lines")
                {
                    SubPageLink = "Journal Batch No." = field("Document No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approve)
            {
                Image = Approval;
                ToolTip = 'Approve the request.';

                trigger OnAction()
                var
                    visitsSetup: Record "Visits Setup";
                    tgAssistyant: Codeunit "Telegram assistant";
                begin
                    visitsSetup.Get();
                    if (Rec.Status = "Medicines Req. Jrnl. Status"::Pending) then begin
                        Rec.CalcFields("Telegram Chat Id");
                        Codeunit.Run(Codeunit::"Medicines Req. Jrnl. Approve", Rec);
                        if ("Notify User" and (Rec."Telegram Chat Id" <> '')) then
                            tgAssistyant.NotifyUserAboutMedicineRequestDecision(Rec."Telegram Chat Id", visitsSetup."Telegram bot token", Rec."Document No.", Rec."Patient Name", 'Approved', '');
                        Codeunit.Run(Codeunit::"Medicines Req. Jrnl. Cleanup", Rec);
                        CurrPage.Close();
                    end
                    else
                        Message(Text001);
                end;
            }
            action(Decline)
            {
                Image = Cancel;
                ToolTip = 'Decline the request.';
                trigger OnAction()
                var
                    visitsSetup: Record "Visits Setup";
                    tgAssistyant: Codeunit "Telegram assistant";
                begin
                    visitsSetup.Get();
                    if (Rec.Status = "Medicines Req. Jrnl. Status"::Pending) then begin
                        Rec.CalcFields("Telegram Chat Id");
                        Codeunit.Run(Codeunit::"Medicines Req. Jrnl. Decline", Rec);
                        if "Notify User" then
                            tgAssistyant.NotifyUserAboutMedicineRequestDecision(Rec."Telegram Chat Id", visitsSetup."Telegram bot token", Rec."Document No.", Rec."Patient Name", 'Declined', Rec."Doctor Comment");
                        Codeunit.Run(Codeunit::"Medicines Req. Jrnl. Cleanup", Rec);
                        CurrPage.Close();
                    end
                    else
                        Message(Text001);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if (Rec.Status <> "Medicines Req. Jrnl. Status"::Pending) then
            CurrPage.Editable := false;
        "Notify User" := true;
    end;

    var
        "Notify User": Boolean;
        Text001: Label 'The decision is already made!';
}