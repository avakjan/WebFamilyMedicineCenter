codeunit 50102 "Email assistant"
{
    procedure SendEmail(Subject: Text; Body: Text; Recipient: Text)
    var
        Message: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        Message.Create(Recipient, Subject, Body);
        Email.OpenInEditor(Message);
    end;
}