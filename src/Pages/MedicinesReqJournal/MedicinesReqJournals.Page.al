page 50117 "Medicines Req. Journals"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    InsertAllowed = false;
    SourceTable = "Medicines Req. Journal Batch";
    CardPageId = "Medicines Req. Journal";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Document No.';
                }
                field("Patient No."; Rec."Patient No.")
                {
                    ToolTip = 'Patient No.';
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ToolTip = 'Patient Name';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Posting Date';
                }
            }
        }
    }
}