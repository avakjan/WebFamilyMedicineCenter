codeunit 50104 "Medicines Request Post"
{
    TableNo = "Medicines Request Header";
    trigger OnRun()
    var
        MedicinesRequest: Record "Medicines Request Header";
    begin
        ClearAll();
        MedicinesRequest := Rec;
        InitPost(MedicinesRequest);
        Post(MedicinesRequest);
        PostLines(Rec);
        FinalizePost(Rec);
        Rec := MedicinesRequest;

    end;

    local procedure InitPost(var MedicinesRequest: Record "Medicines Request Header")
    begin
        MedicinesRequest.TestField("No.");
        MedicinesRequest.TestField(Description);
        MedicinesRequest.TestField("Patient No.");
        MedicinesRequest.TestField("Document Status", "Medicines Request Status"::Draft);
    end;

    local procedure Post(var MedicinesRequest: Record "Medicines Request Header")
    var
        JournalBatch: Record "Medicines Req. Journal Batch";
    begin
        JournalBatch.Init();
        JournalBatch."Document No." := MedicinesRequest."No.";
        JournalBatch."Posting Date" := Today;
        JournalBatch."Patient No." := MedicinesRequest."Patient No.";
        JournalBatch.Status := "Medicines Req. Jrnl. Status"::Pending;
        JournalBatch.Description := MedicinesRequest.Description;
        JournalBatch.Insert(true);
    end;

    local procedure FinalizePost(var MedicinesRequest: Record "Medicines Request Header")
    begin
        MedicinesRequest.Validate("Document Status", "Medicines Request Status"::Open);
        MedicinesRequest.Modify(true);
    end;

    local procedure PostLines(MedicinesRequest: Record "Medicines Request Header")
    var
        MedReqLine: Record "Medicines Request Line";
    begin
        MedReqLine.SetRange("Document No.", MedicinesRequest."No.");
        if MedReqLine.FindSet() then
            repeat
                TestLine(MedReqLine, MedicinesRequest."No.");
                PostLine(MedReqLine);
            until MedReqLine.Next() = 0;
    end;

    local procedure TestLine(Line: Record "Medicines Request Line"; "Document Nr": Code[20])
    begin
        Line.TestField("Medicine No.");
        Line.TestField(Amount);
        Line.TestField(Reason);
        Line.TestField("Document No.", "Document Nr");
    end;

    local procedure PostLine(Line: Record "Medicines Request Line")
    var
        MedReqLine: Record "Medicines Req. Journal Line";
    begin
        MedReqLine.Init();
        MedReqLine."Journal Batch No." := Line."Document No.";
        MedReqLine.Amount := Line.Amount;
        MedReqLine.Reason := Line.Reason;
        MedReqLine."Medicine No." := Line."Medicine No.";
        MedReqLine.Insert(false);
    end;
}