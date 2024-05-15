page 50132 "Medical Employees API"
{
    PageType = API;
    Caption = 'Medical Employees';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicalEmployee';
    EntitySetName = 'medicalEmployees';
    SourceTable = "Medical Employee";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System Id', Locked = true;
                }
                field("no"; Rec."No.")
                {
                }
                field("firstName"; Rec."First Name")
                {
                }
                field("lastName"; Rec."Last Name")
                {
                }
                field(role; Rec.Role)
                {
                }
                field(room; Rec.Room)
                {
                }
                field("familyMedicineCenterNo"; Rec."Medicine Center No.")
                {
                }
                field("familyMedicineCenterId"; Rec."Medicine Center Id")
                {
                }
                field(description; Rec.Description)
                {
                }
                field(email; Rec.Email)
                {
                }
                field(phoneNumber; Rec."Phone Number")
                {
                }
                field("personalCode"; Rec."Personal Code")
                {
                }
            }
            part(patients; "Patients API")
            {
                Caption = 'Patients';
                EntityName = 'patient';
                EntitySetName = 'patients';
                SubPageLink = "Doctor No." = field("No.");
            }
        }
    }
}