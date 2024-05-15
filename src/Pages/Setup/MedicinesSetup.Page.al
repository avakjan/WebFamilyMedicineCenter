page 50114 "Medicines Setup"
{
    PageType = Card;
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Medicines Setup";
    Caption = 'Medicines Setup';
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Medicine Nos."; Rec."Medicine Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to medicines';
                }
                field("Medicine Request Nos."; Rec."Medicine Request Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to medicines requests';
                }
            }
        }
    }
    //TODO Find out how this works
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}