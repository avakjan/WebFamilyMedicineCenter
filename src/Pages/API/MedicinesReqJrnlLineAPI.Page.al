page 50139 "Medicines Req. Jrnl Line API"
{
    PageType = API;
    Caption = 'MedicineRequestJournalLines';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicineRequestJournalLine';
    EntitySetName = 'medicineRequestJournalLines';
    SourceTable = "Medicines Req. Journal Line";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System Id', Locked = true;
                }
                field("medicineNo"; Rec."Medicine No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine No.';
                }
                field("medicineName"; Rec."Medicine Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Medicine Name';
                }
                field(amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount';
                }
                field(reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Reason';
                }
            }
        }
    }
}