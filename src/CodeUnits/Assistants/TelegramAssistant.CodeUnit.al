codeunit 50101 "Telegram assistant"
{
    procedure SendTelegramMessage(ChatId: Text; BotToken: Text; MessageText: Text)
    var
        Client: HttpClient;
        Content: HttpContent;
        ResponseMessage: HttpResponseMessage;
        UriFormat: Label 'https://api.telegram.org/bot%1/sendMessage?chat_id=%2&text=%3';
        Uri: Text;
    begin
        Uri := StrSubstNo(UriFormat, BotToken, ChatId, MessageText);
        if not Client.Post(Uri, Content, ResponseMessage) then
            Error('Could not deliver message: %1', ResponseMessage.ReasonPhrase());
        if not ResponseMessage.IsSuccessStatusCode() then
            Error('Error sending message')
        else
            Message('Success!');
    end;

    procedure NotifyUserAboutMedicineRequestDecision(ChatId: Text; BotToken: Text; DocumentNo: Text; PatientName: Text; Decision: Text; OptionalComment: Text)
    var
        MedicinesReqJrnlLines: Record "Medicines Req. Journal Line";
        MessageText: Text;
        MedicineListText: Text;
        IsFirst: Boolean;
    begin
        IsFirst := true;
        MedicinesReqJrnlLines.SetRange("Journal Batch No.", DocumentNo);
        if MedicinesReqJrnlLines.FindSet then
            repeat
                if not IsFirst then
                    MedicineListText += ', ';
                MedicinesReqJrnlLines.CalcFields("Medicine name");
                MedicineListText += MedicinesReqJrnlLines."Medicine Name";
                IsFirst := false;
            until MedicinesReqJrnlLines.Next() = 0;

        if Decision = 'Approved' then
            MessageText := StrSubstNo('Medicine request %1 for patient: %2 has been approved. Medicines:  %3', DocumentNo, PatientName, MedicineListText)
        else if Decision = 'Declined' then
            MessageText := StrSubstNo('Medicine request %1 for patient: %2 has been declined.Comment: %3 Medicines:  %4', DocumentNo, PatientName, OptionalComment, MedicineListText);

        SendTelegramMessage(ChatId, BotToken, MessageText);
    end;


}