page 50113 "Medical Employees Setup"
{
    PageType = Card;
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Medical Employees Setup";
    Caption = 'Medical Employees Setup';
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Medical Employee Nos."; Rec."Medical Employee Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to medical employees';
                }
                field("Family Medicine Center Nos."; Rec."Family Medicine Center Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to family medicine centers';
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