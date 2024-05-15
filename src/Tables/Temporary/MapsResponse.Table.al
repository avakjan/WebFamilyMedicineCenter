table 50122 "Maps Response"
{
    Caption = 'Maps Response Buffer';
    TableType = Temporary;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Name; Text[400])
        {
            Caption = 'Name';
        }
        field(3; "Confidence"; Text[400])
        {
            Caption = 'Confidence';
        }
        field(4; "Entity Type"; Text[400])
        {
            Caption = 'Entity Type';
        }
        field(10; "Country Region"; Text[400])
        {
            Caption = 'Country Region';
        }
        field(11; "Admin District"; Text[400])
        {
            Caption = 'Admin District';
        }
        field(12; "Locality"; Text[400])
        {
            Caption = 'Locality';
        }
        field(20; "Coordinates Latitude"; Code[30])
        {
            Caption = 'Coordinates Latitude';
        }
        field(21; "Coordinates Longitude"; Code[30])
        {
            Caption = 'Coordinates Longitude';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}