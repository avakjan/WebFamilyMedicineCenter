page 50153 "Medicines Req Reg. Line API"
{
    PageType = API;
    Caption = 'Medicines Req. Register Line';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicinesReqRegisterLine';
    EntitySetName = 'medicinesReqRegisterLine';
    SourceTable = "Medicines Req. Register Line";
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
                field("medicinesRegisterNo"; Rec."Medicines Req. Register No.")
                {
                    Caption = 'Medicines Req. Register No.';
                    NotBlank = true;
                    TableRelation = "Medicines Request Register";
                }
                field("medicinesRegisterId"; Rec."Medicines Register Id")
                {
                    Caption = 'Medicines Register Id';
                }
                field("amount"; Rec."Amount")
                {
                    Caption = 'Amount';

                }
                field("reason"; Rec."Reason")
                {
                    Caption = 'Reason';

                }
                field("medicineNo"; Rec."Medicine No.")
                {
                    Caption = 'Medicine No.';
                    NotBlank = true;
                    TableRelation = Medicine;
                }
                field("medicineId"; Rec."Medicine Id")
                {
                    Caption = 'Medicine Id';
                }
                field("medicineName"; Rec."Medicine name")
                {
                    Caption = 'Medicine name';
                }
            }
        }
    }
}