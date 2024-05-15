page 50141 "Medical Employees Setups API"
{
    PageType = API;
    Caption = 'Medical Employees Setups';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicalEmployeesSetup';
    EntitySetName = 'medicalEmployeesSetups';
    SourceTable = "Medical Employees Setup";
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
                field("medicalEmployeeNos"; Rec."Medical Employee Nos.")
                {
                    Caption = 'Medical Employee Nos.';
                    TableRelation = "No. Series";
                }
                field("familyMedicineCenterNos"; Rec."Family Medicine Center Nos."){
                    Caption = 'Family Medicine Center Nos.';
                    TableRelation = "No. Series";
                }
            }
        }
    }
}