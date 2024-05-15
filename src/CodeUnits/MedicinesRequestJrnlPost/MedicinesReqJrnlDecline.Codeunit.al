codeunit 50106 "Medicines Req. Jrnl. Decline"
{
    TableNo = "Medicines Req. Journal Batch";
    trigger OnRun()
    begin
        JournalBatch.Copy(Rec);
        Code();
        Rec := JournalBatch;
    end;

    var
        JournalBatch: Record "Medicines Req. Journal Batch";
        Text000: Label 'Do you want to decline this request (No: %1)?';
        Text001: Label 'The request was declined!';

    local procedure Code()
    begin
        if not Confirm(Text000, false, JournalBatch."Document No.") then
            exit;
        JournalBatch.Status := "Medicines Req. Jrnl. Status"::Declined;
        if Codeunit.Run(Codeunit::"Medicines Req. Jrnl. Post", JournalBatch) then
            Message(Text001);
    end;
}