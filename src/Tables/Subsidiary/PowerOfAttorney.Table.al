table 50110 "Power of Attorney"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Attorney No."; Code[20])
        {
            Caption = 'Attorney No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(2; "Ward No."; Code[20])
        {
            Caption = 'Ward No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(3; "Valid From"; DateTime)
        {
            Caption = 'Valid From';
            NotBlank = true;
        }
        field(4; "Valid To"; DateTime)
        {
            Caption = 'Valid To';
            NotBlank = true;
        }
        field(5; "Attorney Name"; Text[100])
        {
            Caption = 'From';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Name" where("No." = field("Attorney No.")));
        }
        field(6; "Ward Name"; Text[100])
        {
            Caption = 'To';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."First Name" where("No." = field("Ward No.")));
        }
    }

    keys
    {
        key(PK; "Attorney No.", "Ward No.")
        {
            Clustered = true;
        }
    }

    var
        PowerofAttorneysSetup: Record "Power of Attorney";
        PowerofAttorney: Record "Power of Attorney";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(OldRecord: Record "Power of Attorney") Result: Boolean
    begin
        PowerofAttorney := Rec;
        PowerofAttorneysSetup.Get();
        PowerofAttorneysSetup.TestField("Attorney No.");
        if NoSeriesMgt.SelectSeries(PowerofAttorneysSetup."Attorney No.", OldRecord."Ward No.",
         PowerofAttorney."Ward No.") then begin
            NoSeriesMgt.SetSeries(PowerofAttorney."Attorney No.");
            Rec := PowerofAttorney;
            exit(true);
        end;
    end;

    trigger OnInsert()
    begin
        Rec."Valid From" := CurrentDateTime();
    end;

}