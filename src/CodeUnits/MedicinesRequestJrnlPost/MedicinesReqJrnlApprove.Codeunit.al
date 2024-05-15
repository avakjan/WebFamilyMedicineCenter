codeunit 50105 "Medicines Req. Jrnl. Approve"
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
        Text000: Label 'Do you want to approve this request (No: %1)?';
        Text001: Label 'The request was approved!';

    local procedure Code()
    begin
        if not Confirm(Text000, false, JournalBatch."Document No.") then
            exit;
        JournalBatch.Status := "Medicines Req. Jrnl. Status"::Approved;
        if Codeunit.Run(Codeunit::"Medicines Req. Jrnl. Post", JournalBatch) then
            Message(Text001); 
    end;
}