page 50133 "Family Centers API"
{
    PageType = API;
    Caption = 'Family Centers';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'familyCenter';
    EntitySetName = 'familyCenters';
    SourceTable = "Family Medicine Center";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System Id', Locked = true;
                }
                field(no; Rec."No.")
                {
                }
                field(name; Rec.Name)
                {
                }
                field(description; Rec.Description)
                {
                }
                field("medicineCenterLocationCode"; Rec."Medicine Center Location Code")
                {
                }
                field("image"; Rec.Image)
                {
                }
                field("contactPhone"; Rec."Contact phone")
                {
                }
                field("contactEmail"; Rec."Contact email")
                {
                }
                part(medicineCenterLocation; "Medicine Center Locations API")
                {
                    Caption = 'Home location';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'medicineCenterLocation';
                    EntitySetName = 'medicineCenterLocations';
                    SubPageLink = SystemId = field("Medicine Center Location Id");
                }
            }
        }
    }
}