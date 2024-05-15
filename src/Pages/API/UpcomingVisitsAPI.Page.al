page 50124 "Upcoming Visits API"
{
    PageType = API;
    Caption = 'Visits';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'upcomingVisit';
    EntitySetName = 'upcomingVisits';
    SourceTable = "Upcoming Visit";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System Id', Locked = true;
                }
                field("no"; Rec."No.")
                { }
                field(description; Rec.Description)
                { }
                field("familyCenterNo"; Rec."Family Center No.")
                { }
                field("familyCenterId"; Rec."Family Center Id")
                { }
                field("familyCenterName"; Rec."Medicine Center Name")
                { }
                field("isOnline"; Rec."Is Online")
                { }
                field("medicalEmployeeNo"; Rec."Medical Employee No.")
                { }
                field("medicalEmployeeName"; Rec."Medical Employee Name")
                { }
                field("medicalEmployeeId"; Rec."Medical Employee Id")
                { }
                field(meetingLink; Rec."Meeting Link")
                { }
                field("date"; Rec."Date")
                { }
                field("patientNo"; Rec."Patient No.")
                { }
                field("patientId"; Rec."Patient Id")
                { }
                field("type"; Rec."Type")
                { }
                field("telegramChatId"; Rec."Telegram Chat Id")
                { }
            }
            part(patient; "Patients API")
            {
                Caption = 'Patient';
                EntityName = 'patient';
                EntitySetName = 'patients';
                SubPageLink = SystemId = field("Patient Id");
            }
            part(medicalEmployee; "Medical Employees API")
            {
                Caption = 'Medical Employee';
                EntityName = 'medicalEmployee';
                EntitySetName = 'medicalEmployees';
                SubPageLink = SystemId = field("Medical Employee Id");
            }
            part(familyCenter; "Family Centers API")
            {
                Caption = 'Family Center';
                EntityName = 'familyCenter';
                EntitySetName = 'familyCenters';
                SubPageLink = SystemId = field("Family Center Id");
            }
        }
    }
}
