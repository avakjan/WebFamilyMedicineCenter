page 50131 "Patients API"
{
    PageType = API;
    Caption = 'Patients';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'patient';
    EntitySetName = 'patients';
    SourceTable = "Customer";
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
                field("no"; Rec."No.")
                {
                }
                field("doctorNo"; Rec."Doctor No.")
                {
                }
                field("doctorId"; Rec."Doctor Id")
                {
                }
                field("medicineCenterNo"; Rec."Medicine Center No.")
                {
                }
                field("medicineCenterId"; Rec."Medicine Center Id")
                {
                }
                field("locationCode"; Rec."Home Location Code")
                {
                }
                field("locationId"; Rec."Home Location Id")
                {
                }
                field("email"; Rec."E-Mail")
                {
                }
                field("firstname"; Rec."First name")
                {
                }
                field("lastname"; Rec."Last name")
                {
                }
                field("phoneNumber"; Rec."Phone No.")
                {
                }
                field("password"; Rec."Client app password")
                {
                }
                field("username"; Rec."Client app username")
                {
                }
                field("personalCode"; Rec."Personal Code")
                {
                }

                part(picture; "APIV2 - Pictures")
                {
                    Caption = 'Picture';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'picture';
                    EntitySetName = 'pictures';
                    SubPageLink = Id = field(SystemId), "Parent Type" = const(Customer);
                }
                part(homeLocation; "Home Locations API")
                {
                    Caption = 'Home location';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'homeLocation';
                    EntitySetName = 'homeLocations';
                    SubPageLink = SystemId = field("Home Location Id");
                }
            }
        }
    }
}