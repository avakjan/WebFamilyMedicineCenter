table 50112 "Medicines Request Line"
{
    DataClassification = CustomerContent;
    Caption = 'Medicines Request Line';
    DataCaptionFields = "Medicine name", "Document No.";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Medicines Request Header";
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
            TableRelation = Medicine;
            NotBlank = true;
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
        key(PK; "Document No.", "Medicine No.")
        {
            Clustered = true;
        }
    }

}