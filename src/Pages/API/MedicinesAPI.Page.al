page 50146 "Medicines API"
{
    PageType = API;
    Caption = 'Medicines';
    APIPublisher = 'student';
    APIGroup = 'veebiarstikeskus';
    APIVersion = 'v2.0';
    EntityName = 'medicines';
    EntitySetName = 'medicines';
    SourceTable = "Medicine";
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
                field("code"; Rec."Code")
                {
                    Caption = 'No.';
                }
                field("description"; Rec."Description")
                {
                    Caption = 'Additional information';
                }
                field("name"; Rec."Name")
                {
                    Caption = 'Name';
                    NotBlank = true;
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Meicine type';
                    NotBlank = true;
                }
                field("noSeries"; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    Editable = false;
                    TableRelation = "No. Series";
                }
            }
        }
    }
}