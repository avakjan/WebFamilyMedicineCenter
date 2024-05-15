table 50116 "Medicines Req. Journal Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Journal Batch No."; Code[20])
        {
            Caption = 'Journal Batch No.';
            TableRelation = "Medicines Req. Journal Batch";
            trigger OnValidate()
            var
                JournalBatch: Record "Medicines Req. Journal Batch";
            begin
                if ("Journal Batch No." = '') then begin
                    Clear("Journal Batch Id");
                    exit;
                end;
                JournalBatch.Get("Journal Batch No.");
                "Journal Batch Id" := JournalBatch.SystemId;
            end;
        }
        field(11; "Journal Batch Id"; Guid)
        {
            Caption = 'Journal Batch Id';
            TableRelation = "Medicines Req. Journal Batch".SystemId;
            trigger OnValidate()
            var
                BatchId: Record "Medicines Req. Journal Batch";
            begin
                if IsNullGuid("Journal Batch Id") then begin
                    "Journal Batch No." := '';
                    exit;
                end;
                BatchId.GetBySystemId("Journal Batch Id");
                "Journal Batch No." := BatchId."Document No.";
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
        key(Key1; "Journal Batch No.", "Medicine No.")
        {
            Clustered = true;
        }
    }
}