codeunit 50113 "Distance Assistant"
{
    TableNo = "Home Location";
    trigger OnRun()
    begin
        ClearAll();
        FindClosestLocation(Rec);
        MessageClosestCenter();
    end;

    procedure FindClosestLocation(Home: Record "Home Location")
    var
        CenterLocation: Record "Medicine Center Location";
        CurrentDistance: Decimal;
    begin
        MinDistance := 99999999;
        if CenterLocation.FindSet() then
            repeat
                if ((CenterLocation.Latitude <> '') and (CenterLocation.Longitude <> '')) then begin
                    CurrentDistance := Home.FindDistance(CenterLocation);
                    if CurrentDistance < MinDistance then begin
                        MinDistance := CurrentDistance;
                        ClosestLocationNo := CenterLocation.Code;
                    end
                end;
            until CenterLocation.Next() = 0;
    end;

    procedure FindClosestCenter(): Code[20]
    var
        Center: Record "Family Medicine Center";
    begin
        Center.SetFilter("Medicine Center Location Code", ClosestLocationNo);
        Center.FindFirst();
        exit(Center."No.");
    end;

    procedure MessageClosestCenter()
    var
        Center: Record "Family Medicine Center";
        CenterInfo: Text[250];
        Distance: Text[20];
    begin
        Center.SetFilter("Medicine Center Location Code", ClosestLocationNo);
        Center.FindFirst();
        Distance := Format(MinDistance, 5);
        CenterInfo := 'Name: ' + Center.Name + '\'
                    + 'Code: ' + Center."No." + '\'
                    + 'Distance: ' + Distance + 'km';
        Message(CenterInfo);
    end;

    procedure GetClosestLocationNo(Home: Record "Home Location"): Code[20]
    begin
        ClearAll();
        FindClosestLocation(Home);
        exit(FindClosestCenter());
    end;

    var
        ClosestLocationNo: Code[20];
        MinDistance: Decimal;
}
