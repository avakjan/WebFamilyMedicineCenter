codeunit 50108 "Medicines Req. Jrnl. Cleanup"
{
    TableNo = "Medicines Req. Journal Batch";
    trigger OnRun()
    begin
        ClearAll();
        DeleteLines(Rec);
        DeleteRequestLines(Rec);
        DeleteRequest(Rec);
        Rec.Delete();
    end;

    local procedure DeleteLines(MedicinesRequest: Record "Medicines Req. Journal Batch")
    var
        MedJournalLine: Record "Medicines Req. Journal Line";
    begin
        MedJournalLine.SetRange("Journal Batch No.", MedicinesRequest."Document No.");
        if MedJournalLine.FindSet() then
            repeat
                MedJournalLine.Delete();
            until MedJournalLine.Next() = 0;
    end;

    local procedure DeleteRequest(MedicinesRequest: Record "Medicines Req. Journal Batch")
    var
        RequestHeader: Record "Medicines Request Header";
    begin
        RequestHeader.SetRange("No.", MedicinesRequest."Document No.");
        if RequestHeader.FindSet() then
            repeat
                RequestHeader.Delete();
            until RequestHeader.Next() = 0;
    end;

    local procedure DeleteRequestLines(MedicinesRequest: Record "Medicines Req. Journal Batch")
    var
        MedJournalLine: Record "Medicines Request Line";
    begin
        MedJournalLine.SetRange("Document No.", MedicinesRequest."Document No.");
        if MedJournalLine.FindSet() then
            repeat
                MedJournalLine.Delete();
            until MedJournalLine.Next() = 0;
    end;
}