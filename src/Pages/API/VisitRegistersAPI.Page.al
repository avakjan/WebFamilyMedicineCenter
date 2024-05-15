page 50140 "Visit Registers API"
{
    PageType = API;
    Caption = 'Visit Registers';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'visitRegister';
    EntitySetName = 'visitRegisters';
    SourceTable = "Visit Register";
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
                field("description"; Rec. "Description")
                {
                    Caption = 'Description';
                }
                field("familyCenterNo"; Rec. "Family Center No.")
                {
                    Caption = 'Family Center No.';
                    NotBlank = true;
                    TableRelation = "Family Medicine Center";
                }
                field("isOnline"; Rec. "Is Online")
                {
                    Caption = 'Is Online';
                }
                field("medicalEmployeeNo"; Rec. "Medical Employee No.")
                {
                    Caption = 'Medical Employee No.';
                    NotBlank = true;
                    TableRelation = "Medical Employee";
                }
                field("date"; Rec. "Date")
                {
                    Caption = 'Date';
                    NotBlank = true;
                }
                field("patientNo"; Rec. "Patient No.")
                {
                    Caption = 'Patient No.';
                    NotBlank = true;
                    TableRelation = Customer;
                }
                field("type"; Rec. "Type")
                {
                    Caption = 'Type';
                }
                field("patientName"; Rec. "Patient Name")
                {
                    Caption = 'Patient Name';
                }
                field("medicineCenterName"; Rec. "Medicine Center Name")
                {
                    Caption = 'Medicine Center Name';
                }
                field("medicalEmployeeName"; Rec. "Medical Employee Name")
                {
                    Caption = 'Medical Employee Name';
                }
                field("medicalEmployeeComment"; Rec. "Medical Employee Comment")
                {
                    Caption = 'Medial Employee Comment';
                }
                field("patientComment"; Rec. "Patient Comment")
                {
                    Caption = 'Patient Comment';
                }
                field("isCancelled"; Rec. "Is Cancelled")
                {
                    Caption = 'Is Cancelled';
                }
            }
        }
    }
}