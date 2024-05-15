table 50108 "Medical Employees Setup"
{
    Caption = 'Medical Employees Setup';

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Medical Employee Nos."; Code[20])
        {
            Caption = 'Medical Employee Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Family Medicine Center Nos."; Code[20])
        {
            Caption = 'Family Medicine Center Nos.';
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