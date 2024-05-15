table 50118 "Medicines Request Register"
{
    DataClassification = CustomerContent;
    LookupPageId = "Medicines Request Register";
    DrillDownPageId = "Medicines Request Register";
    fields
    {
        field(1; "Register No."; Code[20])
        {
            Caption = 'Register No.';
            TableRelation = "Medicines Request Header";
            trigger OnValidate()
            var
                Employee: Record "Medicines Request Header";
            begin
                if ("Register No." = '') then begin
                    Clear("Register Id");
                    exit;
                end;
                Employee.Get("Register No.");
                "Register Id" := Employee.SystemId;
            end;
        }
        field(111; "Register Id"; guid)
        {
            Caption = 'Register Id';
            TableRelation = "Medicines Request Header".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Medicines Request Header";
            begin
                if IsNullGuid("Register Id") then begin
                    "Register No." := '';
                    exit;
                end;
                Employee.GetBySystemId("Register Id");
                "Register No." := Employee."No.";
            end;
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
        field(5; "Patient name"; Text[50])
        {
            Caption = 'Patient name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."First Name" where("No." = field("Patient No.")));
        }
        field(6; "Status"; Enum "Medicines Req. Jrnl. Status")
        {
            Caption = 'Status';
        }
        field(7; "Date of creation"; DateTime)
        {
            Caption = 'Date of creation';
        }
        field(8; "Reviewer No."; Code[20])
        {
            Caption = 'Reviewer No.';
            TableRelation = "Medical Employee";
            trigger OnValidate()
            var
                Employee: Record "Medical Employee";
            begin
                if ("Reviewer No." = '') then begin
                    Clear("Reviewer Id");
                    exit;
                end;
                Employee.Get("Reviewer No.");
                "Reviewer Id" := Employee.SystemId;
            end;
        }
        field(118; "Reviewer Id"; guid)
        {
            Caption = 'Reviewer Id';
            TableRelation = "Medical Employee".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Medical Employee";
            begin
                if IsNullGuid("Reviewer Id") then begin
                    "Reviewer No." := '';
                    exit;
                end;
                Employee.GetBySystemId("Reviewer Id");
                "Reviewer No." := Employee."No.";
            end;
        }
        field(9; "Doctor Comment"; Text[200])
        {
            Caption = 'Doctor Comment';
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