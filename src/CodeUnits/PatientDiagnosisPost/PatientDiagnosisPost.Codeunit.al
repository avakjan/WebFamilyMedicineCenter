codeunit 50114 "Patient Diagnosis Post"
{
    TableNo = "Patient Diagnosis";
    trigger OnRun()
    begin
        ClearAll();
        InitPost(Rec);
        Post(Rec);
        PostLines(Rec);
        Rec."Is Posted" := true;
    end;

    local procedure InitPost(var MedicinesRequest: Record "Patient Diagnosis")
    begin
        MedicinesRequest.TestField("Document No.");
        MedicinesRequest.TestField("Patient No.");
        MedicinesRequest.TestField("Disease No.");
        MedicinesRequest.TestField("Doctor No.");
        MedicinesRequest.TestField("Date");
    end;

    local procedure Post(var Diagnosis: Record "Patient Diagnosis")
    var
        DiagnosisRegister: Record "Diagnosis Register";
        LedgerEntry: Record "Patient Ledger Entry";
    begin
        DiagnosisRegister.Init();
        DiagnosisRegister."Register No." := Diagnosis."Document No.";
        DiagnosisRegister."Patient No." := Diagnosis."Patient No.";
        DiagnosisRegister."Disease No." := Diagnosis."Disease No.";
        DiagnosisRegister."Doctor No." := Diagnosis."Doctor No.";
        DiagnosisRegister."Creation Date" := Diagnosis.Date;
        DiagnosisRegister.Insert(true);

        LedgerEntry."Patient No." := Diagnosis."Patient No.";
        LedgerEntry."Entry Type" := "Patient Ledger Entry Type"::"Closed diagnosis";
        LedgerEntry."No." := Diagnosis."Document No.";
        LedgerEntry."Posting Date" := CurrentDateTime();
        LedgerEntry.Insert(true);
    end;

    local procedure TestLine(Line: Record "Diagnosis History Message"; "Document No": Code[20])
    begin
        Line.TestField("Document No.", "Document No");
        Line.TestField("Medical Employee No.");
        Line.TestField(Message);
        Line.TestField(Date);
    end;

    local procedure PostLine(Message: Record "Diagnosis History Message")
    var
        RegisterLine: Record "Diagnosis Register Line";
    begin
        RegisterLine.Init();
        RegisterLine."Diagnosis Register No." := Message."Document No.";
        RegisterLine."Medical Employee No." := Message."Medical Employee No.";
        RegisterLine."Medical Employee Id" := Message."Medical Employee Id";
        RegisterLine.Message := Message.Message;
        RegisterLine.Date := Message.Date;
        RegisterLine.Insert(false);
    end;

    local procedure PostLines(Diagnosis: Record "Patient Diagnosis")
    var
        HistoryMessage: Record "Diagnosis History Message";
    begin
        HistoryMessage.SetRange("Document No.", Diagnosis."Document No.");
        if HistoryMessage.FindSet() then
            repeat
                TestLine(HistoryMessage, Diagnosis."Document No.");
                PostLine(HistoryMessage);
            until HistoryMessage.Next() = 0;
    end;
}