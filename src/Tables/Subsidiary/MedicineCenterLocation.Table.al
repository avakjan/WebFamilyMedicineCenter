table 50113 "Medicine Center Location"
{
    LookupPageId = "Medicine Center Location Card";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Family Medicine Center"."Medicine Center Location Code";
            Editable = false;
            trigger OnValidate()
            var
                Center: Record "Family Medicine Center";
            begin
                if (Code = '') then begin
                    Clear(Code);
                    exit;
                end;
                Center.SetFilter("Medicine Center Location Code", Code);
                Center.FindFirst();
                "Family Medicine Center Id" := Center.SystemId;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Country Region"; Text[50])
        {
            Caption = 'Country Region';
        }
        field(4; "Admin District"; Text[50])
        {
            Caption = 'Admin District';
        }
        field(5; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(6; "Latitude"; Code[30])
        {
            Caption = 'Latitude';
            Editable = false;
        }
        field(7; "Longitude"; Code[30])
        {
            Caption = 'Longitude';
            Editable = false;
        }
        field(8; "Owner"; Text[50])
        {
            Caption = 'Owner';
        }
        field(9; "Family Medicine Center Id"; guid)
        {
            Caption = 'Family Medicine Center Id';
            TableRelation = "Family Medicine Center".SystemId;
            Editable = false;
            trigger OnValidate()
            var
                Center: Record "Family Medicine Center";
            begin
                if IsNullGuid("Family Medicine Center Id") then begin
                    Code := '';
                    exit;
                end;
                Center.GetBySystemId("Family Medicine Center Id");
                Code := Center."No.";
            end;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}