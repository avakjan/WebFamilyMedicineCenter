page 50138 "Medicines Request Journal API"
{
    PageType = API;
    Caption = 'MedicineRequestJournals';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicineRequestJournal';
    EntitySetName = 'medicineRequestJournals';
    SourceTable = "Medicines Req. Journal Batch";
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
                field("documentNo"; Rec."Document No.")
                {
                    ToolTip = 'Document No.';
                }
                field("patientNo"; Rec."Patient No.")
                {
                    ToolTip = 'Patient No.';
                }
                field("patientName"; Rec."Patient Name")
                {
                    ToolTip = 'Patient Name';
                }
                field("postingDate"; Rec."Posting Date")
                {
                    ToolTip = 'Posting Date';
                }
            }
        }
    }
}