table 50109 "Visits Setup"
{
    Caption = 'Visits Setup';

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Visit Nos."; Code[20])
        {
            Caption = 'Visit Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Telegram bot token"; Text[600])
        {
            Caption = 'Telegram bot token';
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