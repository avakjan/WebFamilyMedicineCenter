table 50115 "Medicines Req. Journal Batch"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Medicines Request Header";
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; "Patient No."; Code[20])
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
        field(113; "Patient Id"; guid)
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
        field(5; "Patient name"; Text[50])
        {
            Caption = 'Patient name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."First Name" where("No." = field("Patient No.")));
        }
        field(6; "Status"; Enum "Medicines Req. Jrnl. Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(8; "Reviewer No."; Code[20])
        {
            Caption = 'Reviewer No.';
            TableRelation = "Medical Employee" where(Role = const(
                "Medical Employee Role"::"Doctor"));
        }
        field(9; "Doctor Comment"; Text[200])
        {
            Caption = 'Doctor Comment';
        }
        field(10; "Telegram Chat Id"; Text[50])
        {
            Caption = 'Telegram Chat Id';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Telegram Chat Id" where("No." = field("Patient No.")));
        }
    }

    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
    procedure TestReviewerData()
    begin
        Rec.TestField("Doctor Comment");
        Rec.TestField("Reviewer No.");
    end;
}