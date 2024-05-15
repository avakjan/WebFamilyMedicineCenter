page 50142 "Visits Setup API"
{
    PageType = API;
    Caption = 'Visits Setups';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'visitsSetup';
    EntitySetName = 'visitsSetups';
    SourceTable = "Visits Setup";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("systemId"; Rec."SystemId")
                {
                    Caption = 'System Id', Locked = true;
                }
                field("visitNos"; Rec."Visit Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for number series that will be used to assign number to visits';
                }
                field("telegramBotToken"; Rec."Telegram bot token")
                {
                    ApplicationArea = All;
                    ToolTip = 'Telegram bot token for informing customers';
                }
            }
        }
    }
}