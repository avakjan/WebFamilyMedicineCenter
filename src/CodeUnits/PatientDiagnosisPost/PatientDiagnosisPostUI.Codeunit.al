codeunit 50116 "Patient Diagnosis Post UI"
{
    TableNo = "Patient Diagnosis";
    trigger OnRun()
    begin
        Diagnosis.Copy(Rec);
        Code();
        Rec := Diagnosis;
    end;

    var
        Diagnosis: Record "Patient Diagnosis";
        Text000: Label 'Do you want to close this diagnosis (No: %1)?';
        Text001: Label 'The request was posted!';

    local procedure Code()
    begin
        if not Confirm(Text000, false, Diagnosis."Document No.") then
            exit;
        if Codeunit.Run(Codeunit::"Patient Diagnosis Post", Diagnosis) then begin
            Codeunit.Run(Codeunit::"Patient Diagnosis Cleanup", Diagnosis);
            Message(Text001);
        end;
    end;
}