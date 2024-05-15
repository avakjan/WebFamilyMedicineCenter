table 50125 "Diagnosis Register Line"
{
    fields
    {
        field(1; "Diagnosis Register No."; Code[20])
        {
            Caption = 'Diagnosis Register No.';
        }
        field(2; Message; text[200])
        {
            Caption = 'Message';
        }
        field(3; "Medical Employee No."; Code[20])
        {
            Caption = 'Medical Employee No.';
            NotBlank = true;
            TableRelation = "Medical Employee";
            trigger OnValidate()
            var
                "Medical Employee": Record "Medical Employee";
            begin
                if ("Medical Employee No." = '') then begin
                    Clear("Medical Employee Id");
                    exit;
                end;
                "Medical Employee".Get("Medical Employee No.");
                "Medical Employee Id" := "Medical Employee".SystemId;
            end;
        }
        field(113; "Medical Employee Id"; guid)
        {
            Caption = 'Medical Employee Id';
            TableRelation = "Medical Employee".SystemId;
            trigger OnValidate()
            var
                "Medical Employee": Record "Medical Employee";
            begin
                if IsNullGuid("Medical Employee Id") then begin
                    "Medical Employee No." := '';
                    exit;
                end;
                "Medical Employee".GetBySystemId("Medical Employee Id");
                "Medical Employee No." := "Medical Employee"."No.";
            end;
        }
        field(4; Date; DateTime)
        {
            Caption = 'Date';
        }
    }
    keys
    {
        key(PK; Date, "Diagnosis Register No.")
        {
            Clustered = true;
        }
    }

}