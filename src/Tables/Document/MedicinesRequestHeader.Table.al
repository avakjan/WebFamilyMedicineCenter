table 50102 "Medicines Request Header"
{
    DataClassification = CustomerContent;
    Caption = 'Medicines Request Header';
    DataCaptionFields = "No.", "Patient name", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; "Patient No."; Code[20])
        {
            Caption = 'Patient No.';
            TableRelation = Customer;
            NotBlank = true;

            trigger OnValidate()
            var
                Employee: Record "Customer";
            begin
                if ("Patient No." = '') then begin
                    Clear("Patient Id");
                    exit;
                end;
                Employee.Get("Patient No.");
                "Patient Id" := Employee.SystemId;
            end;
        }
        field(113; "Patient Id"; guid)
        {
            Caption = 'Patient Id';
            TableRelation = "Customer".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Customer";
            begin
                if IsNullGuid("Patient Id") then begin
                    "Patient No." := '';
                    exit;
                end;
                Employee.GetBySystemId("Patient Id");
                "Patient No." := Employee."No.";
            end;
        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(5; "Patient name"; Text[50])
        {
            Caption = 'Patient name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."First Name" where("No." = field("Patient No.")));
        }
        field(6; "Document Status"; Enum "Medicines Request Status")
        {
            Caption = 'Document status';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        MedicinesSetup: Record "Medicines Setup";
        MedicineRequest: Record "Medicines Request Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        Rec."Document Status" := "Document Status"::Draft;
    end;

    procedure ApplyNumberSeries(OldRecord: Record "Medicines Request Header") Result: Boolean
    begin
        MedicineRequest := Rec;
        MedicinesSetup.Get();
        MedicinesSetup.TestField("Medicine Nos.");
        if NoSeriesMgt.SelectSeries(MedicinesSetup."Medicine Nos.", OldRecord."No. Series",
         MedicineRequest."No. Series") then begin
            NoSeriesMgt.SetSeries(MedicineRequest."No.");
            Rec := MedicineRequest;
            exit(true);
        end;
    end;

    procedure PrintOrder()
    var
        _repMedicinesRequestReport: Report "Medicines Request";
    begin
        Rec.CalcFields("Patient Name");
        _repMedicinesRequestReport.SetTableView(Rec);
        _repMedicinesRequestReport.Run();
    end;

}