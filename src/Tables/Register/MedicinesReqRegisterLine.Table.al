table 50119 "Medicines Req. Register Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Medicines Req. Register No."; Code[20])
        {
            Caption = 'Medicines Req. Register No.';
            TableRelation = "Medicines Request Register";
            NotBlank = true;
            trigger OnValidate()
            var
                "Medicines Request Register": Record "Medicines Request Register";
            begin
                if ("Medicines Req. Register No." = '') then begin
                    Clear("Medicines Register Id");
                    exit;
                end;
                "Medicines Request Register".Get("Medicines Req. Register No.");
                "Medicines Register Id" := "Medicines Request Register".SystemId;

            end;
        }
        field(113; "Medicines Register Id"; guid)
        {
            Caption = 'Medicines Register Id';
            TableRelation = "Medicines Request Register".SystemId;
            trigger OnValidate()
            var
                "Medicines Request Register": Record "Medicines Request Register";
            begin
                if IsNullGuid("Medicines Register Id") then begin
                    "Medicines Req. Register No." := '';
                    exit;
                end;
                "Medicines Request Register".GetBySystemId("Medicines Register Id");
                "Medicines Req. Register No." := "Medicines Request Register"."Register No.";
            end;
        }
        field(3; Amount; Text[50])
        {
            Caption = 'Amount';
            NotBlank = true;
        }
        field(4; Reason; Text[200])
        {
            Caption = 'Reason';
        }
        field(5; "Medicine No."; Code[20])
        {
            Caption = 'Medicine No.';
            NotBlank = true;
            TableRelation = Medicine;
            trigger OnValidate()
            var
                Medicine: Record "Medicine";
            begin
                if ("Medicine No." = '') then begin
                    Clear("Medicine Id");
                    exit;
                end;
                Medicine.Get("Medicine No.");
                "Medicine Id" := Medicine.SystemId;
            end;
        }
        field(115; "Medicine Id"; guid)
        {
            Caption = 'Medicine Id';
            TableRelation = Medicine.SystemId;
            trigger OnValidate()
            var
                Medicine: Record "Medicine";
            begin
                if IsNullGuid("Medicine Id") then begin
                    "Medicine No." := '';
                    exit;
                end;
                Medicine.GetBySystemId("Medicine Id");
                "Medicine No." := Medicine.Code;
            end;
        }
        field(6; "Medicine name"; Text[50])
        {
            Caption = 'Medicine name';
            FieldClass = FlowField;
            CalcFormula = lookup("Medicine".Name where(Code = field("Medicine No.")));
        }
    }

    keys
    {
        key(PK; "Medicines Req. Register No.", "Medicine No.")
        {
            Clustered = true;
        }
    }
}