codeunit 50111 "Visit Post"
{
    TableNo = "Upcoming Visit";
    trigger OnRun()
    var
        MedicinesRequest: Record "Upcoming Visit";
    begin
        ClearAll();
        MedicinesRequest := Rec;
        InitPost(MedicinesRequest);
        Post(MedicinesRequest);
        Rec := MedicinesRequest;
        Rec."Is Posted" := true;
    end;

    local procedure InitPost(var MedicinesRequest: Record "Upcoming Visit")
    begin
        MedicinesRequest.TestField("No.");
        MedicinesRequest.TestField(Description);
        MedicinesRequest.TestField("Patient No.");
        MedicinesRequest.TestField("Medical Employee No.");
        MedicinesRequest.TestField(Date);
        MedicinesRequest.TestField("Medical Employee Comment");
        MedicinesRequest.TestField("Patient Comment");
    end;

    local procedure Post(var UpcomingVisit: Record "Upcoming Visit")
    var
        Register: Record "Visit Register";
        LedgerEntry: Record "Patient Ledger Entry";
    begin
        UpcomingVisit.CalcFields("Family Center No.");
        Register.Init();

        Register."Register No." := UpcomingVisit."No.";
        Register.Description := UpcomingVisit.Description;
        Register."Family Center No." := UpcomingVisit."Family Center No.";
        Register."Is Online" := UpcomingVisit."Is Online";
        Register."Medical Employee No." := UpcomingVisit."Medical Employee No.";
        Register.Date := UpcomingVisit.Date;
        Register."Patient No." := UpcomingVisit."Patient No.";
        Register.Type := UpcomingVisit.Type;
        Register."Medical Employee Comment" := UpcomingVisit."Medical Employee Comment";
        Register."Patient Comment" := UpcomingVisit."Patient Comment";
        Register."Is Cancelled" := UpcomingVisit."Is Cancelled";

        Register.Insert(true);

        LedgerEntry."Patient No." := UpcomingVisit."Patient No.";
        LedgerEntry."No." := UpcomingVisit."No.";

        if (UpcomingVisit."Is Cancelled") then
            LedgerEntry."Entry Type" := "Patient Ledger Entry Type"::"Cancelled Visit"
        else
            LedgerEntry."Entry Type" := "Patient Ledger Entry Type"::"Visit results";

        LedgerEntry."Posting Date" := CurrentDateTime();
        LedgerEntry.Insert(true);
    end;
}