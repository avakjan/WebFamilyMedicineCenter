codeunit 50109 "Visit Post UI"
{
    TableNo = "Upcoming Visit";
    trigger OnRun()
    begin
        Visit.Copy(Rec);
        Code();
        Rec := Visit;
    end;

    var
        Visit: Record "Upcoming Visit";
        Text000: Label 'Do you want to post this visit (No: %1)?';
        Text001: Label 'The visit was posted!';

    local procedure Code()
    begin
        if not Confirm(Text000, false, Visit."No.") then
            exit;
        Visit."Is Cancelled" := false;
        if Codeunit.Run(Codeunit::"Visit Post", Visit) then
            Message(Text001);
    end;
}