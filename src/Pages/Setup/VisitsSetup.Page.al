page 50122 "Visits Setup"
{
    PageType = Card;
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Visits Setup";
    Caption = 'Visits Setup';
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Visit Nos."; Rec."Visit Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to visits';
                }
                field("Telegram bot token"; Rec."Telegram bot token")
                {
                    ApplicationArea = All;
                    ToolTip = 'Telegram bot token for informing customers';
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