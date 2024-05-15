table 50100 Medicine
{
    DataClassification = CustomerContent;
    Caption = 'Medicine';
    DataCaptionFields = Code, Name;
    LookupPageId = "Medicines";
    DrillDownPageId = "Medicines";
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(4; Type; Enum "Medicine Type")
        {
            Caption = 'Medicine type';
            NotBlank = true;
        }
        field(5; "No. Series"; Code[20])
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
        fieldgroup(DropDown; Code, Name)
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
        MedicinesSetup: Record "Medicines Setup";
        Medicine: Record Medicine;
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(OldRecord: Record Medicine) Result: Boolean
    begin
        Medicine := Rec;
        MedicinesSetup.Get();
        MedicinesSetup.TestField("Medicine Nos.");
        if NoSeriesMgt.SelectSeries(MedicinesSetup."Medicine Nos.", OldRecord."No. Series",
         Medicine."No. Series") then begin
            NoSeriesMgt.SetSeries(Medicine.Code);
            Rec := Medicine;
            exit(true);
        end;
    end;

}