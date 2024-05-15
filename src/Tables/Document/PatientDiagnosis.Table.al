table 50104 "Patient Diagnosis"
{
    DataClassification = CustomerContent;
    Caption = 'Patient Diagnosis';
    DataCaptionFields = "Patient First Name", "Patient Last Name";
    LookupPageId = "Patient Diagnosis Subpage";
    DrillDownPageId = "Patient Diagnosis Subpage";
    fields
    {
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(1; "Patient No."; Code[20])
        {
            Caption = 'Patient No.';
            NotBlank = true;
            TableRelation = Customer;
            trigger OnValidate()
            var
                Patient: Record "Customer";
            begin
                if ("Patient No." = '') then begin
                    Clear("Patient Id");
                    exit;
                end;
                Patient.Get("Patient No.");
                "Patient Id" := Patient.SystemId;
            end;
        }
        field(111; "Patient Id"; guid)
        {
            Caption = 'Patient Id';
            TableRelation = Customer.SystemId;
            trigger OnValidate()
            var
                Patient: Record "Customer";
            begin
                if IsNullGuid("Patient Id") then begin
                    "Patient No." := '';
                    exit;
                end;
                Patient.GetBySystemId("Patient Id");
                "Patient No." := Patient."No.";
            end;
        }
        field(2; "Disease No."; Code[20])
        {
            Caption = 'Disease No.';
            NotBlank = true;
            TableRelation = Disease;
            trigger OnValidate()
            var
                Disease: Record "Disease";
            begin
                if ("Disease No." = '') then begin
                    Clear("Disease Id");
                    exit;
                end;
                Disease.Get("Disease No.");
                "Disease Id" := Disease.SystemId;
            end;
        }
        field(112; "Disease Id"; guid)
        {
            Caption = 'Disease Id';
            TableRelation = Disease.SystemId;
            trigger OnValidate()
            var
                Disease: Record "Disease";
            begin
                if IsNullGuid("Disease Id") then begin
                    "Disease No." := '';
                    exit;
                end;
                Disease.GetBySystemId("Disease Id");
                "Disease No." := Disease.Code;
            end;
        }
        field(3; "Doctor No."; Code[20])
        {
            Caption = 'Doctor No.';
            NotBlank = true;
            TableRelation = "Medical Employee" where(Role = const("Medical Employee Role"::Doctor));
            trigger OnValidate()
            var
                "Medical Employee": Record "Medical Employee";
            begin
                if ("Doctor No." = '') then begin
                    Clear("Doctor Id");
                    exit;
                end;
                "Medical Employee".Get("Doctor No.");
                "Doctor Id" := "Medical Employee".SystemId;
            end;
        }
        field(113; "Doctor Id"; guid)
        {
            Caption = 'Doctor Id';
            TableRelation = "Medical Employee".SystemId where(Role = const("Medical Employee Role"::Doctor));
            trigger OnValidate()
            var
                "Medical Employee": Record "Medical Employee";
            begin
                if IsNullGuid("Doctor Id") then begin
                    "Doctor No." := '';
                    exit;
                end;
                "Medical Employee".GetBySystemId("Doctor Id");
                "Doctor No." := "Medical Employee"."No.";
            end;
        }
        field(5; "Date"; DateTime)
        {
            Caption = 'Date';
            Editable = false;
            NotBlank = true;
        }
        field(6; "Patient First Name"; Text[100])
        {
            Caption = 'Patient First Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."First Name" where("No." = field("Patient No.")));
        }
        field(7; "Patient Last Name"; Text[100])
        {
            Caption = 'Patient Last Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Last Name" where("No." = field("Patient No.")));
        }
        field(8; "Disease Name"; Text[100])
        {
            Caption = 'Disease Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Disease".Name where(Code = field("Disease No.")));
        }
        field(9; "Medicine Center No."; Code[20])
        {
            Caption = 'Medicine Center No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Medicine Center No." where("No." = field("Doctor No.")));
            TableRelation = "Family Medicine Center";
        }
        field(10; "Medicine Center Name"; Text[100])
        {
            Caption = 'Medicine Center Name';
            FieldClass = FlowField;
            NotBlank = true;
            CalcFormula = lookup("Family Medicine Center".Name where("No." = field("Medicine Center No.")));
        }
        field(11; "Medical Employee First Name"; Text[110])
        {
            Caption = 'Medical Employee First Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."First Name" where("No." = field("Doctor No.")));
        }
        field(12; "Medical Employee Last Name"; Text[110])
        {
            Caption = 'Medical Employee Last Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Last Name" where("No." = field("Doctor No.")));
        }
        field(13; "Medical Employee Name"; Text[110])
        {
            Caption = 'Medical Employee Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee".Name where("No." = field("Doctor No.")));
        }
        field(14; "Is Posted"; Boolean)
        {
            Caption = 'Is Posted';
        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
        key(AK; "Patient No.", "Disease No.")
        { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Patient First Name", "Patient Last Name", "Disease Name", Date)
        {
        }
        fieldgroup(Brick; "Patient First Name", "Patient Last Name", "Disease Name", Date)
        {
        }
        fieldgroup(List; "Patient First Name", "Patient Last Name", "Disease Name", Date)
        {
        }
    }

    var
        DiseasesSetup: Record "Diseases Setup";
        Diagnosis: Record "Patient Diagnosis";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure PrintOrder()
    var
        _repPatientDiagnosis: Report "Patient Diagnosis";
    begin
        Rec.CalcFields("Medical Employee First Name", "Medical Employee Last Name", "Medicine Center Name");
        _repPatientDiagnosis.SetTableView(Rec);
        _repPatientDiagnosis.Run();
    end;

    procedure ApplyNumberSeries(OldRecord: Record "Patient Diagnosis") Result: Boolean
    begin
        Diagnosis := Rec;
        DiseasesSetup.Get();
        DiseasesSetup.TestField("Patient Diagnosis Nos.");
        if NoSeriesMgt.SelectSeries(DiseasesSetup."Patient Diagnosis Nos.", OldRecord."Document No.", Diagnosis."Document No.") then begin
            NoSeriesMgt.SetSeries(Diagnosis."Document No.");
            Rec := Diagnosis;
            exit(true);
        end;
    end;

    trigger OnInsert()
    begin
        Rec.Date := CurrentDateTime();
    end;
}