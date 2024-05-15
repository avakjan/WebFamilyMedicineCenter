page 50154 "Home Locations API"
{
    PageType = API;
    Caption = 'Home Locations';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'homeLocation';
    EntitySetName = 'homeLocations';
    SourceTable = "Home Location";
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
                    Caption = 'System Id',
                    Locked = true;
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field("closestFamilyCenterNo"; Rec."Closest Family Center No.")
                {
                    Caption = 'Closest Family Center No.';
                }
                field("closestFamilyCenterName"; Rec."Closest Family Center Name")
                {
                    Caption = 'Closest Family Center Name';
                }
                field("countryRegion"; Rec."Country Region")
                {
                    Caption = 'Country Region';
                }
                field("adminDistrict"; Rec."Admin District")
                {
                    Caption = 'Admin District';
                }
                field("address"; Rec."Address")
                {
                    Caption = 'Address';
                }
                field("latitude"; Rec."Latitude")
                {
                    Caption = 'Latitude';
                }
                field("longitude"; Rec."Longitude")
                {
                    Caption = 'Longitude';
                }
            }
        }
    }
}