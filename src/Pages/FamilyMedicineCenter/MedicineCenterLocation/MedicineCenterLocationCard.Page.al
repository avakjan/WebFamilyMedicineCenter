page 50137 "Medicine Center Location Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Medicine Center Location";
    Caption = 'Medicine Center Location Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Code';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
                field("Owner"; Rec."Owner")
                {
                    ApplicationArea = All;
                    ToolTip = 'Owner';
                }
            }
            group(Maps)
            {
                Caption = 'Maps';
                field("Country Region"; Rec."Country Region")
                {
                    ToolTip = 'Maps Country Region';
                }
                field("Admin District"; Rec."Admin District")
                {
                    ToolTip = 'Maps Admin District';
                }
                field("Address"; Rec.Address)
                {
                    ToolTip = 'Maps Address';
                }
                field("Coordinates Latitude"; Rec."Latitude")
                {
                    ToolTip = 'Maps Coordinates Latitude';
                }
                field("Coordinates Longitude"; Rec."Longitude")
                {
                    ToolTip = 'Maps Coordinates Longitude';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(RequestCoordinates)
            {
                ToolTip = 'Request Coordinates';
                Caption = 'Request Coordinates';
                Image = ImportCodes;
                trigger OnAction()
                var
                    MapsResponse: Record "Maps Response" temporary;
                    LocationsAssistant: CodeUnit "Locations assistant";

                begin
                    MapsResponse := LocationsAssistant.RequestCoordinates(Rec."Country Region", Rec."Admin District", Rec.Address);
                    Rec."Latitude" := MapsResponse."Coordinates Latitude";
                    Rec."Longitude" := MapsResponse."Coordinates Longitude";
                end;
            }
        }
    }
}