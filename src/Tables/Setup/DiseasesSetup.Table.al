table 50107 "Diseases Setup"
{
    Caption = 'Disease Setup';


    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Disease Nos."; Code[20])
        {
            Caption = 'Disease Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Patient Diagnosis Nos."; Code[20])
        {
            Caption = 'Patient Diagnosis Nos.';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}