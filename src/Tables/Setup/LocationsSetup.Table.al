table 50121 "Locations Setup"
{
    Caption = 'Locations Setup';

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Bing Maps Locations API URL"; Text[250])
        {
            Caption = 'Bing Maps Locations API URL';
        }
        field(3; "Bing Maps API Key"; Text[100])
        {
            Caption = 'Bing Maps API Key';
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