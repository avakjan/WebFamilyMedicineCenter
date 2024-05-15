page 50116 "Patient List"
{
    PageType = List;
    SourceTable = "Customer";
    CardPageId = "Patient Card";
    ApplicationArea = All;
    UsageCategory = Lists;
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
                field("Doctor No."; Rec."Doctor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Doctor identifier';
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
                field("Personal Code"; Rec."Personal Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Personal Code';
                }
                field("Client app username"; Rec."Client app username")
                {
                    ApplicationArea = All;
                    ToolTip = 'Client app username';
                }

            }
        }
    }
}