codeunit 50107 "Medicines Req. Jrnl. Post"
{
    TableNo = "Medicines Req. Journal Batch";
    trigger OnRun()
    begin
        ClearAll();
        InitPost(Rec);
        Post(Rec);
        PostLines(Rec);
    end;

    local procedure InitPost(var MedicinesRequest: Record "Medicines Req. Journal Batch")
    begin
        MedicinesRequest.TestField("Document No.");
        MedicinesRequest.TestField(Description);
        MedicinesRequest.TestField("Patient No.");
    end;

    local procedure Post(var MedicinesRequest: Record "Medicines Req. Journal Batch")
    var
        RequestRegister: Record "Medicines Request Register";
        LedgerEntry: Record "Patient Ledger Entry";
    begin
        RequestRegister.Init();
        RequestRegister."Register No." := MedicinesRequest."Document No.";
        RequestRegister."Date of creation" := CurrentDateTime();
        RequestRegister."Patient No." := MedicinesRequest."Patient No.";
        RequestRegister.Status := MedicinesRequest.Status;
        RequestRegister.Description := MedicinesRequest.Description;
        RequestRegister."Reviewer No." := MedicinesRequest."Reviewer No.";
        RequestRegister."Doctor Comment" := MedicinesRequest."Doctor Comment";
        RequestRegister.Insert(true);
        LedgerEntry."Patient No." := MedicinesRequest."Patient No.";
        if (MedicinesRequest.Status = "Medicines Req. Jrnl. Status"::Approved) then
            LedgerEntry."Entry Type" := "Patient Ledger Entry Type"::"Approved Medicines Request"
        else
            LedgerEntry."Entry Type" := "Patient Ledger Entry Type"::"Declined Medicines Request";
        LedgerEntry."No." := MedicinesRequest."Document No.";
        LedgerEntry."Posting Date" := CurrentDateTime();
        LedgerEntry.Insert(true);
    end;

    local procedure TestLine(Line: Record "Medicines Req. Journal Line"; "Document Nr": Code[20])
    begin
        Line.TestField("Medicine No.");
        Line.TestField(Amount);
        Line.TestField(Reason);
        Line.TestField("Journal Batch No.", "Document Nr");
    end;

    local procedure PostLine(Line: Record "Medicines Req. Journal Line")
    var
        MedReqLine: Record "Medicines Req. Register Line";
    begin
        MedReqLine.Init();
        MedReqLine."Medicines Req. Register No." := Line."Journal Batch No.";
        MedReqLine.Amount := Line.Amount;
        MedReqLine.Reason := Line.Reason;
        MedReqLine."Medicine No." := Line."Medicine No.";
        MedReqLine.Insert(false);
    end;

    local procedure PostLines(MedicinesRequest: Record "Medicines Req. Journal Batch")
    var
        MedJournalLine: Record "Medicines Req. Journal Line";
    begin
        MedJournalLine.SetRange("Journal Batch No.", MedicinesRequest."Document No.");
        if MedJournalLine.FindSet() then
            repeat
                TestLine(MedJournalLine, MedicinesRequest."Document No.");
                PostLine(MedJournalLine);
            until MedJournalLine.Next() = 0;
    end;
}