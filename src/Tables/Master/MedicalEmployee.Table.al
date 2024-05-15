table 50103 "Medical Employee"
{
    DataClassification = CustomerContent;
    LookupPageId = "Medical Employee List";
    DrillDownPageId = "Medical Employee List";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; "First Name"; Text[50])
        {
            Caption = 'First Name';
            NotBlank = true;
            trigger OnValidate()
            begin
                Rec.Name := Rec."First Name" + ' ' + Rec."Last Name";
            end;
        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            NotBlank = true;
            trigger OnValidate()
            begin
                Rec.Name := Rec."First Name" + ' ' + Rec."Last Name";
            end;
        }
        field(5; Role; Enum "Medical Employee Role")
        {
            Caption = 'Role';
            NotBlank = true;
        }
        field(6; Room; Text[100])
        {
            Caption = 'Room';
        }
        field(7; "Medicine Center No."; Code[20])
        {
            Caption = 'Medicine Center No.';
            TableRelation = "Family Medicine Center";
            NotBlank = true;
            trigger OnValidate()
            var
                Employee: Record "Family Medicine Center";
            begin
                if ("Medicine Center No." = '') then begin
                    Clear("Medicine Center Id");
                    exit;
                end;
                Employee.Get("Medicine Center No.");
                "Medicine Center Id" := Employee.SystemId;
            end;
        }
        field(117; "Medicine Center Id"; guid)
        {
            Caption = 'Medicine Center Id';
            TableRelation = "Family Medicine Center".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Family Medicine Center";
            begin
                if IsNullGuid("Medicine Center Id") then begin
                    "Medicine Center No." := '';
                    exit;
                end;
                Employee.GetBySystemId("Medicine Center Id");
                "Medicine Center No." := Employee."No.";
            end;
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9; Name; Text[110])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(10; "Email"; Text[50])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(11; "Phone Number"; Text[20])
        {
            Caption = 'Phone Number';
        }
        field(12; "Default meeting link"; Text[100])
        {
            Caption = 'Default meeting link';
        }
        field(13; "Personal Code"; Code[20])
        {
            Caption = 'Personal Code';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "First Name", "Last Name")
        {
        }
        fieldgroup(Brick; "No.", "First Name", "Last Name", "Medicine Center No.", Role)
        {
        }
        fieldgroup(List; "No.", "First Name", "Last Name", Role)
        {
        }
    }

    var
        EmployeesSetup: Record "Medical Employees Setup";
        Employee: Record "Medical Employee";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(OldRecord: Record "Medical Employee") Result: Boolean
    begin
        Employee := Rec;
        EmployeesSetup.Get();
        EmployeesSetup.TestField("Family Medicine Center Nos.");
        if NoSeriesMgt.SelectSeries(EmployeesSetup."Family Medicine Center Nos.", OldRecord."No. Series",
         Employee."No. Series") then begin
            NoSeriesMgt.SetSeries(Employee."No.");
            Rec := Employee;
            exit(true);
        end;
    end;

}