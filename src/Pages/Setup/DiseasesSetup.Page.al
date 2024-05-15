page 50112 "Diseases Setup"
{
    PageType = Card;
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Diseases Setup";
    Caption = 'Diseases Setup';
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Disease Nos."; Rec."Disease Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to diseases';
                }
                field("Patient Diagnosis Nos."; Rec."Patient Diagnosis Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to patient diagnoses';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}