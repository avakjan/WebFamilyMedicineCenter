page 50152 "Locations Setup API"
{
    PageType = API;
    Caption = 'Locations Setup';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'locationsSetup';
    EntitySetName = 'locationsSetup';
    SourceTable = "Locations Setup";
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
                field("primaryKey"; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                }
                field("bingMapsLocationsAPIURL"; Rec."Bing Maps Locations API URL")
                {
                    Caption = 'Bing Maps Locations API URL';
                }
                field("bingMapsAPIKey"; Rec."Bing Maps API Key")
                {
                    Caption = 'Bing Maps API Key';
                }
            }
        }
    }
}