page 50151 "Patient Diagnosis API"
{
    PageType = API;
    Caption = 'Patient Diagnosis';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'patientDiagnosis';
    EntitySetName = 'patientDiagnosis';
    SourceTable = "Patient Diagnosis";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("documentNo"; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field("systemId"; Rec."SystemId")
                {
                    Caption = 'System Id', Locked = true;
                }
                field("patientNo"; Rec."Patient No.")
                {
                    Caption = 'Patient No.';
                    NotBlank = true;
                    TableRelation = "Customer";
                }
                field("patientId"; Rec."Patient Id")
                {
                    Caption = 'Family Center No.';
                }
                field("diseaseNo"; Rec."Disease No.")
                {
                    Caption = 'Disease No.';
                    NotBlank = true;
                    TableRelation = "Disease";
                }
                field("diseaseId"; Rec."Disease Id")
                {
                    Caption = 'Disease Id';

                }
                field("doctorNo"; Rec."Doctor No.")
                {
                    Caption = 'Doctor No.';
                    NotBlank = true;
                    TableRelation = "Medical Employee";
                }
                field("doctorId"; Rec."Doctor Id")
                {
                    Caption = 'Doctor Id';

                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                }
                field("patientFirstName"; Rec."Patient First Name")
                {
                    Caption = 'Patient First Name';
                }
                field("patientLastName"; Rec."Patient Last Name")
                {
                    Caption = 'Patient Last Name';
                }
                field("diseaseName"; Rec."Disease Name")
                {
                    Caption = 'Disease Name';
                }
                field("medicineCenterNo"; Rec."Medicine Center No.")
                {
                    Caption = 'Medicine Center No.';
                    NotBlank = true;
                    TableRelation = "Family Medicine Center";
                }
                field("medicineCenterName"; Rec."Medicine Center Name")
                {
                    Caption = 'Medicine Center Name';
                }
                field("medicalEmployeeFirstName"; Rec."Medical Employee First Name")
                {
                    Caption = 'Medical Employee First Name';
                }
                field("medicalEmployeeLastName"; Rec."Medical Employee Last Name")
                {
                    Caption = 'Medical Employee Last Name';
                }
                field("medicalEmployeeName"; Rec."Medical Employee Name")
                {
                    Caption = 'Medical Employee Name';
                }
            }
        }
    }
}