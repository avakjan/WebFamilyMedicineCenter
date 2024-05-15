page 50145 "Medicines Setup API"
{
    PageType = API;
    Caption = 'Medicines Setups';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicinesSetup';
    EntitySetName = 'medicinesSetups';
    SourceTable = "Medicines Setup";
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
                field("medicineNos"; Rec."Medicine Nos.")
                {
                    Caption = 'Medicine Nos.';
                    TableRelation = "No. Series";
                }
                field("medicineRequestNos"; Rec."Medicine Request Nos.")
                {
                    Caption = 'Medicine Request Nos.';
                    TableRelation = "No. Series";
                }
            }
        }
    }
}