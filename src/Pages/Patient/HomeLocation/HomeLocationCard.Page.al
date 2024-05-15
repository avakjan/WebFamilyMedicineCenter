page 50136 "Home Location Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Home Location";
    Caption = 'Home Location Card';
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
                    ToolTip = 'Specifies a location code';
                }
                field("Closest Family Center"; Rec."Closest Family Center No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Closest Family Center';
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