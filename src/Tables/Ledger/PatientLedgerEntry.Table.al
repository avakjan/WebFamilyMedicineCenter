table 50117 "Patient Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation =
                if ("Entry Type" = const("Patient Ledger Entry Type"::"Approved Medicines Request")) "Medicines Request Register"
            else if ("Entry Type" = const("Patient Ledger Entry Type"::"Declined Medicines Request")) "Medicines Request Register"
            else if ("Entry Type" = const("Patient Ledger Entry Type"::"Visit results")) "Visit Register"
            else if ("Entry Type" = const("Patient Ledger Entry Type"::"Cancelled Visit")) "Visit Register"
            else if ("Entry Type" = const("Patient Ledger Entry Type"::"Closed diagnosis")) "Diagnosis Register";
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
        field(3; "Entry Type"; Enum "Patient Ledger Entry Type")
        {
            Caption = 'Entry Type';
            DataClassification = CustomerContent;
        }
        field(4; "Posting Date"; DateTime)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.", "Entry Type")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        Rec.Validate("Patient No.");
    end;
}