page 50121 "Patient Subpage"
{
    Caption = 'Parient subpage';
    PageType = ListPart;
    Editable = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Customer;
    CardPageId = "Patient Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Record identifier';
                }
                field("Firstname"; Rec."First name")
                {
                    ApplicationArea = All;
                    ToolTip = 'First Name';
                }
                field("Lastname"; Rec."Last name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Name';
                }
                field("Email"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Email';
                }

                field("Phone Number"; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount';
                }
            }
        }
    }
}