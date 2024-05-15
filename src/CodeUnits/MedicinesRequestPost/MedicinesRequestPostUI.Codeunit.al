codeunit 50103 "Medicines Request Post UI"
{
    TableNo = "Medicines Request Header";
    trigger OnRun()
    begin
        MedicinesRequest.Copy(Rec);
        Code();
        Rec := MedicinesRequest;
    end;


    var
        MedicinesRequest: Record "Medicines Request Header";
        Text000: Label 'Do you want to post this medicines request (No: %1)?';
        Text001: Label 'The request was posted!';

    local procedure Code()
    begin
        if not Confirm(Text000, false, MedicinesRequest."No.") then
            exit;
        if Codeunit.Run(Codeunit::"Medicines request Post", MedicinesRequest) then
            Message(Text001);
    end;
}