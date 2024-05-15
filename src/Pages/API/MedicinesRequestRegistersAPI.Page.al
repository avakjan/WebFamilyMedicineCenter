//NAZVANIE STRANICQ BOLWE CHEM 30 SIMVOLOV, POETOMU SOEDINIL "REQUEST" I "REGISTERS"
page 50143 "Medicines RequestRegisters API"
{
    PageType = API;
    Caption = 'Medicines Request Registers';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicinesRequestRegister';
    EntitySetName = 'medicinesRequestRegisters';
    SourceTable = "Medicines Request Register";
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
                field("registerNo"; Rec."Register No.")
                {
                    Caption = 'Register No.';
                    TableRelation = "Medicines Request Header";
                }
                field("description"; Rec."Description")
                {
                    Caption = 'Description';
                }
                field("patientName"; Rec."Patient name")
                {
                    Caption = 'Patient name';
                }
                field("status"; Rec."Status")
                {
                    Caption = 'Status';
                }
                field("postingDate"; Rec."Date of creation")
                {
                    Caption = 'Date of creation';
                }
                field("reviewerNo"; Rec."Reviewer No.")
                {
                    Caption = 'Reviewer No.';
                    TableRelation = "Medical Employee";
                }
                field("doctorComment"; Rec."Doctor Comment")
                {
                    Caption = 'Doctor Comment';
                }
            }
        }
    }
}