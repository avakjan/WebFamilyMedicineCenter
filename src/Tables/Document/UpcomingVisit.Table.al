table 50111 "Upcoming Visit"
{
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Family Center No."; Code[20])
        {
            Caption = 'Family Center No.';
            NotBlank = true;
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee"."Medicine Center No." where("No." = field("Medical Employee No.")));
            TableRelation = "Family Medicine Center";
        }
        field(113; "Family Center Id"; guid)
        {
            Caption = 'Family Center Id';
            TableRelation = "Family Medicine Center".SystemId;
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee".SystemId where("No." = field("Medical Employee No.")));
        }
        field(4; "Is Online"; Boolean)
        {
            Caption = 'IsOnline';
        }
        field(5; "Medical Employee No."; Code[20])
        {
            Caption = 'Medical Employee No.';
            NotBlank = true;
            TableRelation = "Medical Employee";
            trigger OnValidate()
            var
                Employee: Record "Medical Employee";
            begin
                if ("Medical Employee No." = '') then begin
                    Clear("Medical Employee Id");
                    exit;
                end;
                Employee.Get("Medical Employee No.");
                "Medical Employee Id" := Employee.SystemId;
            end;
        }
        field(115; "Medical Employee Id"; guid)
        {
            Caption = 'Medical Employee Id';
            TableRelation = "Medical Employee".SystemId;
            trigger OnValidate()
            var
                Employee: Record "Medical Employee";
            begin
                if IsNullGuid("Medical Employee Id") then begin
                    "Medical Employee No." := '';
                    exit;
                end;
                Employee.GetBySystemId("Medical Employee Id");
                "Medical Employee No." := Employee."No.";
            end;
        }
        field(6; "Meeting Link"; Text[50])
        {
            Caption = 'Meeting Link.';
        }
        field(7; "Date"; DateTime)
        {
            Caption = 'Date';
            NotBlank = true;
        }
        field(8; "Patient No."; Code[20])
        {
            Caption = 'Patient No.';
            NotBlank = true;
            TableRelation = Customer;
            Editable = false;
            trigger OnValidate()
            var
                Patient: Record "Customer";
            begin
                if ("Patient No." = '') then begin
                    Clear("Patient Id");
                    exit;
                end;
                Patient.Get("Patient No.");
                "Patient Id" := Patient.SystemId;
            end;
        }
        field(118; "Patient Id"; guid)
        {
            Caption = 'Patient Id';
            TableRelation = Customer.SystemId;
            Editable = false;
            trigger OnValidate()
            var
                Patient: Record "Customer";
            begin
                if IsNullGuid("Patient Id") then begin
                    "Patient No." := '';
                    exit;
                end;
                Patient.GetBySystemId("Patient Id");
                "Patient No." := Patient."No.";
            end;
        }
        field(9; "Type"; Enum "Visit Type")
        {
            Caption = 'Type';
        }
        field(10; "Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer".Name where("No." = field("Patient No.")));
        }
        field(11; "Medicine Center Name"; Text[100])
        {
            Caption = 'Medicine Center Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Family Medicine Center".Name where("No." = field("Family Center No.")));
        }
        field(12; "Medical Employee Name"; Text[110])
        {
            Caption = 'Medical Employee Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medical Employee".Name where("No." = field("Medical Employee No.")));
        }
        field(13; "Telegram Chat Id"; Text[110])
        {
            Caption = 'Telegram Chat Id';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Telegram Chat Id" where("No." = field("Patient No.")));
        }
        field(14; "Patient E-Mail"; Text[110])
        {
            Caption = 'Patient E-Mail';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."E-Mail" where("No." = field("Patient No.")));
        }
        field(15; "Medical Employee Comment"; Text[120])
        {
            Caption = 'Medial Employee Comment';
        }
        field(16; "Patient Comment"; Text[120])
        {
            Caption = 'Patient Comment';
        }
        field(17; "Is Cancelled"; Boolean)
        {
            Caption = 'Is Cancelled';
        }
        field(18; "Is Posted"; Boolean)
        {
            Caption = 'Is Posted';
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
        fieldgroup(DropDown; "No.", "Description")
        {
        }
        fieldgroup(Brick; "No.", "Description")
        {
        }
        fieldgroup(List; "No.", "Description")
        {
        }
    }

    var
        VisitsSetup: Record "Visits Setup";
        Visit: Record "Upcoming Visit";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure ApplyNumberSeries(OldRecord: Record "Upcoming Visit") Result: Boolean
    begin
        Visit := Rec;
        VisitsSetup.Get();
        VisitsSetup.TestField("Visit Nos.");
        if NoSeriesMgt.SelectSeries(VisitsSetup."Visit Nos.", OldRecord."No.",
         Visit."No.") then begin
            NoSeriesMgt.SetSeries(Visit."No.");
            Rec := Visit;
            Rec.Validate("Patient No.");
            exit(true);
        end;
    end;

    procedure GetMessage() Result: Text
    var
        DateTimeFormat: Text;
    begin
        DateTimeFormat := Format(Rec.Date, 0, '<Day,2>.<Month,2>.<Year4> <Hours24>:<Minutes,2>');
        Result += 'Dear ' + Rec."Patient Name" + ', ';
        Result += 'you have booked yourself a visit at ' + Rec."Medicine Center Name";
        Result += ' on ' + DateTimeFormat + ' ';
        Result += 'with ' + Rec."Medical Employee Name";
    end;


}