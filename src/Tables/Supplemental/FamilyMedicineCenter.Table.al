table 50101 "Family Medicine Center"
{
    DataClassification = CustomerContent;
    Caption = 'Rental Asset';
    DataCaptionFields = "No.", Description;
    LookupPageId = "Family Medicine Centers";
    DrillDownPageId = "Family Medicine Centers";
    fields
    {
        field(1; "No."; Code[20])
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
        field(4; "Medicine Center Location Code"; Code[20])
        {
            TableRelation = "Medicine Center Location";
            Editable = false;
            trigger OnValidate()
            var
                Location: Record "Medicine Center Location";
            begin
                if ("Medicine Center Location Code" = '') then begin
                    Clear("Medicine Center Location Id");
                    exit;
                end;
                Location.Get("Medicine Center Location Code");
                "Medicine Center Location Id" := Location.SystemId;
            end;
        }
        field(114; "Medicine Center Location Id"; guid)
        {
            Caption = 'Medical Employee Id';
            Editable = false;
            TableRelation = "Medicine Center Location".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Medicine Center Location";
            begin
                if IsNullGuid("Medicine Center Location Id") then begin
                    "Medicine Center Location Code" := '';
                    exit;
                end;
                Employee.GetBySystemId("Medicine Center Location Id");
                "Medicine Center Location Code" := Employee."Code";
            end;
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6; Image; BLOB)
        {
            Caption = 'Image';
            Subtype = Bitmap;
        }
        field(7; "Contact phone"; Text[20])
        {
            Caption = 'Contact phone';
        }
        field(8; "Contact email"; Text[20])
        {
            Caption = 'Contact email';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(K2; "Medicine Center Location Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name)
        {
        }
        fieldgroup(Brick; "No.", Name, Description)
        {
        }
        fieldgroup(List; "No.", Name)
        {
        }
    }
    var
        EmployeesSetup: Record "Medical Employees Setup";
        MedicineCenter: Record "Family Medicine Center";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure ApplyNos(OldRecord: Record "Family Medicine Center") Result: Boolean
    begin
        MedicineCenter := Rec;
        EmployeesSetup.Get();
        EmployeesSetup.TestField("Family Medicine Center Nos.");
        if NoSeriesMgt.SelectSeries(EmployeesSetup."Family Medicine Center Nos.", OldRecord."No. Series",
         MedicineCenter."No. Series") then begin
            NoSeriesMgt.SetSeries(MedicineCenter."No.");
            Rec := MedicineCenter;
            exit(true);
        end;
    end;

    trigger OnInsert()
    var
        location: Record "Medicine Center Location";
    begin
        ApplyNos(Rec);
        location.Init();
        location.Code := rec."No.";
        location."Family Medicine Center Id" := Rec.SystemId;
        location.Insert();
        Rec."Medicine Center Location Code" := Rec."No.";
        Rec.Validate("Medicine Center Location Code");
    end;

    trigger OnDelete()
    var
        Location: Record "Medicine Center Location";
    begin
        if (Location.Get(Rec."Medicine Center Location Code")) then Location.Delete();
    end;
}


