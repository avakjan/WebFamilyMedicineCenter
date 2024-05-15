table 50123 "Home Location"
{
    LookupPageId = "Home Location Card";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = Customer."Home Location Code";
            Editable = false;
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
        field(8; "Closest Family Center No."; Code[20])
        {
            Caption = 'Closest Family Center No.';
            TableRelation = "Family Medicine Center";
            Editable = false;
        }
        field(9; "Closest Family Center Name"; Text[50])
        {
            Caption = 'Closest Family Center Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Family Medicine Center".Name where("No." = field("Closest Family Center No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    var
        MapsResponse: Record "Maps Response" temporary;
        DistanceAssistant: Codeunit "Distance Assistant";
        LocationsAssistant: CodeUnit "Locations assistant";
    begin
        if ((Rec.Latitude <> '') and (Rec.Longitude <> '')) then begin
            Rec."Closest Family Center No." := DistanceAssistant.GetClosestLocationNo(Rec);
            exit;
        end;
        if ((Rec."Country Region" <> '') and (Rec."Admin District" <> '') and (Rec."Address" <> '')) then begin
            MapsResponse := LocationsAssistant.RequestCoordinates(Rec."Country Region", Rec."Admin District", Rec.Address);
            Rec."Latitude" := MapsResponse."Coordinates Latitude";
            Rec."Longitude" := MapsResponse."Coordinates Longitude";
            Rec."Closest Family Center No." := DistanceAssistant.GetClosestLocationNo(Rec);
        end;
    end;

    procedure FindDistance(CenterLocation: Record "Medicine Center Location"): Decimal
    var
        HLongitude: Decimal;
        HLatitude: Decimal;
        CLongitude: Decimal;
        CLatitude: Decimal;
    begin

        Evaluate(HLongitude, rec."Longitude");
        Evaluate(HLatitude, rec."Latitude");
        Evaluate(CLongitude, CenterLocation.Longitude);
        Evaluate(CLatitude, CenterLocation.Latitude);

        exit(61.26 * Power(Power((HLongitude - CLongitude), 2) + Power((HLatitude - CLatitude), 2), 0.5));
    end;
}