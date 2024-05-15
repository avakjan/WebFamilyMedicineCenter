table 50105 Disease
{
    DataClassification = CustomerContent;
    Caption = 'Rental Asset';
    DataCaptionFields = Code, Name, Description;
    LookupPageId = "Diseases";
    DrillDownPageId = "Diseases";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; text[200])
        {
            Caption = 'Description';

        }
        field(3; Name; text[100])
        {
            Caption = 'Name';
            NotBlank = true;

        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Name, Description)
        {
        }
        fieldgroup(Brick; Code, Name, Description)
        {
        }
        fieldgroup(List; Code, Name)
        {
        }
    }
    var
        DiseasesSetup: Record "Diseases Setup";
        Disease: Record Disease;
        NoSeriesMgt: Codeunit NoSeriesManagement;



    procedure AssistEdit(OldRecord: Record Disease) Result: Boolean
    begin
        Disease := Rec;
        DiseasesSetup.Get();
        DiseasesSetup.TestField("Disease Nos.");
        if NoSeriesMgt.SelectSeries(DiseasesSetup."Disease Nos.", OldRecord."No. Series", Disease."No. Series") then begin
            NoSeriesMgt.SetSeries(Disease.Code);
            Rec := Disease;
            exit(true);
        end;
    end;
}