page 50128 "Medicines Request Register"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    Editable = false;
    SourceTable = "Medicines Request Register";
    layout
    {
        area(Content)
        {
            group(Response)
            {
                field("Reviewer No."; Rec."Reviewer No.")
                {
                    ToolTip = 'Reviewer No.';
                }
                field("Doctor Comment"; Rec."Doctor Comment")
                {
                    ToolTip = 'Doctor Comment';
                }
                field("Status"; Rec.Status)
                {
                    ToolTip = 'Status';
                    Editable = false;
                }

            }
            group(General)
            {
                field("Document No."; Rec."Register No.")
                {
                    ToolTip = 'Document No.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                    Editable = false;
                }
                field("Patient No."; Rec."Patient No.")
                {
                    ToolTip = 'Patient No.';
                    Editable = false;
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ToolTip = 'Patient Name';
                    Editable = false;
                }
                field("Date of creation"; Rec."Date of creation")
                {
                    ToolTip = 'Posting Date';
                    Editable = false;
                }
            }
            group(Medicines)
            {
                part("Requested medicines"; "Medicines Req. Register Lines")
                {
                    SubPageLink = "Medicines Req. Register No." = field("Register No.");
                }
            }

        }
    }
}