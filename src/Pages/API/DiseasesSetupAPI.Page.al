page 50144 "Diseases Setup API"
{
    PageType = API;
    Caption = 'Diseases Setups';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'diseasesSetup';
    EntitySetName = 'diseasesSetups';
    SourceTable = "Diseases Setup";
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
                field("diseaseNos"; Rec."Disease Nos.")
                {
                    Caption = 'Disease Nos.';
                    TableRelation = "No. Series";
                }
                field("patientDiagnosisNos"; Rec."Patient Diagnosis Nos.")
                {
                    Caption = 'Patient Diagnosis Nos.';
                    TableRelation = "No. Series";
                }
            }
        }
    }
}