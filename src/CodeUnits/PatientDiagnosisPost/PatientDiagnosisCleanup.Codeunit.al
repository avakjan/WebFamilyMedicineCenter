codeunit 50115 "Patient Diagnosis Cleanup"
{
    TableNo = "Patient Diagnosis";
    trigger OnRun()
    begin
        ClearAll();
        DeleteLines(Rec);
    end;

    local procedure DeleteLines(Diagnosis: Record "Patient Diagnosis")
    var
        MedJournalLine: Record "Diagnosis History Message";
    begin
        MedJournalLine.SetRange("Document No.", Diagnosis."Document No.");
        if MedJournalLine.FindSet() then
            repeat
                MedJournalLine.Delete();
            until MedJournalLine.Next() = 0;
    end;
}