table 50124 "Diagnosis Register"
{
    DataClassification = CustomerContent;
    Caption = 'Diagnosis Register';
    DataCaptionFields = "Patient First Name", "Patient Last Name", "Disease Name";
    LookupPageId = "Diagnosis Register";
    DrillDownPageId = "Diagnosis Register";
    fields
    {
        field(1; "Register No."; Code[20])
        {
            Caption = 'Register No.';
        }
        field(2; "Patient No."; Code[20])
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
        field(112; "Patient Id"; guid)
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
        field(3; "Disease No."; Code[20])
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
        field(113; "Disease Id"; guid)
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
        field(4; "Doctor No."; Code[20])
        {
            Caption = 'Doctor No.';
            NotBlank = true;
            TableRelation = "Medical Employee";
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
        field(114; "Doctor Id"; guid)
        {
            Caption = 'Doctor Id';
            TableRelation = "Medical Employee".SystemId;
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
        field(5; "Creation Date"; DateTime)
        {
            Caption = 'Creation Date';
            NotBlank = true;
        }
        field(7; "Patient First Name"; Text[100])
        {
            Caption = 'Patient First Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."First Name" where("No." = field("Patient No.")));
        }
        field(8; "Patient Last Name"; Text[100])
        {
            Caption = 'Patient Last Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Last Name" where("No." = field("Patient No.")));
        }
        field(9; "Disease Name"; Text[100])
        {
            Caption = 'Disease Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Disease".Name where(Code = field("Disease No.")));
        }
        field(10; "Medicine Center No."; Code[20])
        {
            Caption = 'Medicine Center No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Medicine Center No." where("No." = field("Doctor No.")));
            TableRelation = "Family Medicine Center";
        }
        field(11; "Medicine Center Name"; Text[100])
        {
            Caption = 'Medicine Center Name';
            FieldClass = FlowField;
            NotBlank = true;
            CalcFormula = lookup("Family Medicine Center".Name where("No." = field("Medicine Center No.")));
        }
        field(12; "Medical Employee First Name"; Text[110])
        {
            Caption = 'Medical Employee First Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."First Name" where("No." = field("Doctor No.")));
        }
        field(13; "Medical Employee Last Name"; Text[110])
        {
            Caption = 'Medical Employee Last Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Last Name" where("No." = field("Doctor No.")));
        }
    }
    keys
    {
        key(PK; "Register No.")
        {
            Clustered = true;
        }
    }
}