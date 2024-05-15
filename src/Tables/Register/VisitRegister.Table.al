table 50120 "Visit Register"
{
    DataClassification = CustomerContent;
    DataCaptionFields = "Register No.", Description;
    LookupPageId = "Visit Register";
    DrillDownPageId = "Visit Register";

    fields
    {
        field(1; "Register No."; Code[20])
        {
            Caption = 'Register No.';
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Family Center No."; Code[20])
        {
            Caption = 'Family Center No.';
            NotBlank = true;
            TableRelation = "Family Medicine Center";
        }
        field(4; "Is Online"; Boolean)
        {
            Caption = 'Is Online';
        }
        field(5; "Medical Employee No."; Code[20])
        {
            Caption = 'Medical Employee No.';
            NotBlank = true;
            TableRelation = "Medical Employee";
        }
        field(7; "Date"; DateTime)
        {
            Caption = 'Date';
            NotBlank = true;
        }
        field(8; "Patient No."; Code[20])
        {
            Caption = 'Patient No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(9; "Type"; Enum "Visit Type")
        {
            Caption = 'Type';
        }
        field(10; "Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer".Name where("No." = field("Patient No.")));
        }
        field(11; "Medicine Center Name"; Text[100])
        {
            Caption = 'Medicine Center Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Family Medicine Center".Name where("No." = field("Family Center No.")));
        }
        field(12; "Medical Employee Name"; Text[110])
        {
            Caption = 'Medical Employee Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee".Name where("No." = field("Medical Employee No.")));
        }
        field(15; "Medical Employee Comment"; Text[120])
        {
            Caption = 'Medial Employee Comment';
        }
        field(16; "Patient Comment"; Text[120])
        {
            Caption = 'Patient Comment';
        }
        field(17; "Is Cancelled"; Boolean)
        {
            Caption = 'Is Cancelled';
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