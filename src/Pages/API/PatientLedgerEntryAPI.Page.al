page 50150 "Patient Ledger Entry API"
{
    PageType = API;
    Caption = 'Patient Ledger Entries';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'patientLedgerEntries';
    EntitySetName = 'patientLedgerEntries';
    SourceTable = "Patient Ledger Entry";
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
                field("no"; Rec."No.")
                {
                    Caption = 'No.';
                }
                field("patientNo"; Rec."Patient No.")
                {
                    Caption = 'Patient No.';
                    NotBlank = true;
                    TableRelation = Customer;
                }
                field("patientId"; Rec."Patient Id")
                {
                    Caption = 'Patient Id';
                }
                field("entryType"; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                }
                field("postingDate"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
            }
        }
    }
}