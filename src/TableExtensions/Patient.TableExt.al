tableextension 50101 Patient extends Customer
{
    LookupPageId = "Patient List";
    DrillDownPageId = "Patient List";
    fields
    {
        field(50101; "First Name"; Text[49])
        {
            Caption = 'First name';
            NotBlank = true;
            trigger OnValidate()
            begin
                Rec.Name := Rec."First Name" + ' ' + Rec."Last Name";
            end;
        }
        field(50102; "Last Name"; Text[49])
        {
            Caption = 'Last name';
            NotBlank = true;
            trigger OnValidate()
            begin
                Rec.Name := Rec."First Name" + ' ' + Rec."Last Name";
            end;
        }
        field(50103; Gender; Option)
        {
            Caption = 'Gender';
            NotBlank = true;
            OptionMembers = Man,Woman;
        }
        field(50110; "Personal Code"; Code[20])
        {
            Caption = 'Personal Code';
        }
        field(50104; "Medicine Center No."; Code[20])
        {
            Caption = 'Medicine center number';
            TableRelation = "Family Medicine Center";
            NotBlank = true;
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Medicine Center No." where("No." = field("Doctor No.")));
        }
        field(50114; "Medicine Center Id"; guid)
        {
            Caption = 'Medicine Center Id';
            TableRelation = "Family Medicine Center".SystemId;
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Medicine Center Id" where("No." = field("Doctor No.")));
        }
        field(50105; "Telegram Chat Id"; Text[20])
        {
            Caption = 'Telegram Chat Id';
            NotBlank = true;
        }
        field(50106; "Doctor No."; Code[20])
        {
            Caption = 'Doctor number';
            TableRelation = "Medical Employee" where(Role = const(
                "Medical Employee Role"::"Doctor"));
            NotBlank = true;
            trigger OnValidate()
            var
                Employee: Record "Medical Employee";
            begin
                if ("Doctor No." = '') then begin
                    Clear("Doctor Id");
                    exit;
                end;
                Employee.Get("Doctor No.");
                "Doctor Id" := Employee.SystemId;
            end;
        }
        field(50111; "Doctor Id"; guid)
        {
            Caption = 'Doctor Id';
            TableRelation = "Medical Employee".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Medical Employee";
            begin
                if IsNullGuid("Doctor Id") then begin
                    "Doctor No." := '';
                    exit;
                end;
                Employee.GetBySystemId("Doctor Id");
                "Doctor No." := Employee."No.";
            end;
        }
        field(50107; "Home Location Code"; Code[20])
        {
            Caption = 'Home Location';
            TableRelation = "Home Location";
            Editable = false;
            trigger OnValidate()
            var
                Location: Record "Home Location";
            begin
                if ("Home Location Code" = '') then begin
                    Clear("Home Location Id");
                    exit;
                end;
                Location.Get("Home Location Code");
                "Home Location Id" := Location.SystemId;
            end;
        }
        field(50109; "Home Location Id"; Guid)
        {
            Caption = 'Home Location Id';
            TableRelation = "Home Location".SystemId;
            Editable = false;
            trigger OnValidate()
            var
                Location: Record "Home Location";
            begin
                if IsNullGuid("Home Location Id") then begin
                    "Home Location Id" := '';
                    exit;
                end;
                Location.GetBySystemId("Home Location Id");
                "Home Location Code" := Location.Code;
            end;
        }
        field(50100; "Client app password"; Text[30])
        {
            Caption = 'Client app password';
        }
        field(50108; "Client app username"; Text[30])
        {
            Caption = 'Client app username';
            trigger OnValidate()
            begin
                Rec.ValidateUserName();
            end;
        }
    }
    keys
    {
        key(K2; "Home Location Code")
        {
        }
        key("Application key"; "Client app username")
        {
        }
    }

    fieldgroups
    {
        addlast(DropDown; "First Name", "Last Name")
        {
        }
        addlast(Brick; "First Name", "Last Name")
        {
        }
    }

    procedure CreateHomeAddress(OldPatient: Record Customer)
    var
        Location: Record "Home Location";
    begin
        if (OldPatient."Home Location Code" = '') then begin
            Location.Init();
            Location.Code := Rec."No.";
            Location.Insert();
            Rec."Home Location Code" := Rec."No.";
            Rec."Home Location Id" := Rec.SystemId;
            Rec.Validate("Home Location Code");
        end;
    end;

    trigger OnInsert()
    begin
        if (Rec."Client app username" <> '') then begin
            Rec.ValidateUserName();
            Rec.CreateHomeAddress(Rec);
        end;
    end;

    trigger OnDelete()
    var
        Location: Record "Home Location";
    begin
        if (Location.Get(Rec."Home Location Code")) then Location.Delete();
    end;

    procedure ValidateUserName()
    var
        Patient: Record Customer;
    begin
        Patient.SetFilter("Client app username", Rec."Client app username");
        if not Patient.IsEmpty then Error('Username is already taken');
    end;

}
