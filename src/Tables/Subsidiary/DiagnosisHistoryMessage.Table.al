table 50114 "Diagnosis History Message"
{
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Patient Diagnosis";
        }
        field(2; "Medical Employee No."; Code[20])
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
        field(112; "Medical Employee Id"; guid)
        {
            TableRelation = "Medical Employee".SystemId;
            Caption = 'Medical Employee Id';
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
        field(3; "Message"; Text[150])
        {
            Caption = 'Message';
        }

        field(6; Date; DateTime)
        {
            Caption = 'Date';
            Editable = false;
        }

    }
    keys
    {
        key(PK; "Document No.", Date)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        rec.Date := CurrentDateTime();
    end;

}