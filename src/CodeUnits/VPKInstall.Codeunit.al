codeunit 50100 "VPK Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    begin
        InitDiseasesSetup();
        InitMedicinesSetup();
        InitMedicalEmployeesSetup();
        InitVisitsSetup();
        InitLocationsSetup();
    end;

    local procedure InitDiseasesSetup()
    var
        DiseasesSetup: Record "Diseases Setup";
    begin
        if not DiseasesSetup.FindFirst() then begin
            DiseasesSetup.Init();
            DiseasesSetup."Disease Nos." := 'BANK';
            DiseasesSetup."Patient Diagnosis Nos." := 'BANK';
            DiseasesSetup.Insert();
        end;
    end;

    local procedure InitMedicinesSetup()
    var
        MedicinesSetup: Record "Medicines Setup";
    begin
        if not MedicinesSetup.FindFirst() then begin
            MedicinesSetup.Init();
            MedicinesSetup."Medicine Nos." := 'BANK';
            MedicinesSetup."Medicine Request Nos." := 'BANK';
            MedicinesSetup.Insert();
        end;
    end;

    local procedure InitMedicalEmployeesSetup()
    var
        EmployeesSetup: Record "Medical Employees Setup";
    begin
        if not EmployeesSetup.FindFirst() then begin
            EmployeesSetup.Init();
            EmployeesSetup."Medical Employee Nos." := 'BANK';
            EmployeesSetup."Family Medicine Center Nos." := 'BANK';
            EmployeesSetup.Insert();
        end;
    end;

    local procedure InitVisitsSetup()
    var
        VisitsSetup: Record "Visits Setup";
    begin
        if not VisitsSetup.FindFirst() then begin
            VisitsSetup.Init();
            VisitsSetup."Visit Nos." := 'BANK';
            VisitsSetup."Telegram bot token" := '7067360112:AAEMbia5tUgfHIy-SRYe9JxISeihWvzctbs';
            VisitsSetup.Insert();
        end;
    end;

    local procedure InitLocationsSetup()
    var
        LocationsSetup: Record "Locations Setup";
    begin
        if not LocationsSetup.FindFirst() then begin
            LocationsSetup.Init();
            LocationsSetup."Bing Maps Locations API URL" := 'https://dev.virtualearth.net/REST/v1/Locations?countryRegion=%1&adminDistrict=%2&addressLine=%3&maxResults=10&strictMatch=1&key=%4';
            LocationsSetup."Bing Maps API Key" := 'AjJya60X3MHXLoUwUUkwEHwie_yeX1qe56o9B1ccGJw55CuI-Yftllcvy1AfgyJA';
            LocationsSetup.Insert();
        end;
    end;
}
