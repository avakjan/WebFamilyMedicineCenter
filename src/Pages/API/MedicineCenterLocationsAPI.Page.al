page 50149 "Medicine Center Locations API"
{
    PageType = API;
    Caption = 'Medicine Center Locations';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicineCenterLocation';
    EntitySetName = 'medicineCenterLocations';
    SourceTable = "Medicine Center Location";
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
                field("name"; Rec."Name")
                {
                    Caption = 'Name';
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
                field("ownerName"; Rec."Owner")
                {
                    Caption = 'Owner name';
                }
                field("familyMedicineCenterId"; Rec."Family Medicine Center Id")
                {
                    Caption = 'Family Medicine Center Id';
                }
            }
        }
    }
}