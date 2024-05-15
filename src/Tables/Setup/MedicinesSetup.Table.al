table 50106 "Medicines Setup"
{
    Caption = 'Medicine Setup';


    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Medicine Nos."; Code[20])
        {
            Caption = 'Medicine Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Medicine Request Nos."; Code[20])
        {
            Caption = 'Medicine Request Nos.';
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