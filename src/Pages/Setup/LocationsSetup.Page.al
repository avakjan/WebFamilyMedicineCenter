page 50134 "Locations Setup"
{
    PageType = Card;
    Editable = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Locations Setup";
    Caption = 'Locations Setup';

    layout
    {
        area(Content)
        {
            group(Connector)
            {
                Caption = 'Connector';
                group(MapsAPI)
                {
                    Caption = 'Maps API';
                    field("Bing Maps Locations API URL"; Rec."Bing Maps Locations API URL")
                    {
                        ToolTip = 'Bing Maps Locations API URL';
                    }
                    field("Bing Maps API Key"; Rec."Bing Maps API Key")
                    {
                        ToolTip = 'Bing Maps API Key';
                    }
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}