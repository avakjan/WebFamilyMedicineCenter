page 50105 "Medicines Request"
{
    PageType = Document;
    Caption = 'Medicines Request';
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Medicines Request Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document Status';
                }

            }
            group(Patient)
            {
                Caption = 'Patient';
                field("Patient No."; Rec."Patient No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Patient No.';
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Patient Name';
                }
            }
            group(Medicines)
            {
                Caption = 'Medicines';
                part("Request Lines"; "Medicines Req. Lines Subpage")
                {
                    ApplicationArea = All;
                    Caption = 'Request Lines';
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Tooltip = 'Post';
                Image = Post;
                trigger OnAction()
                begin
                    if (Rec."Document Status" = "Medicines Request Status"::Draft) then begin
                        Codeunit.Run(Codeunit::"Medicines Request Post UI", Rec);
                        CurrPage.Close();
                    end
                    else
                        Message('This request was already sent!');
                end;
            }
            action("Generate Medicines Request Report")
            {
                ApplicationArea = All;
                Caption = 'Generate Word Report';
                ToolTip = 'Generate Word Report';
                Image = Word;
                trigger OnAction();
                begin
                    Rec.PrintOrder();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if (Rec."No." = '') then
            if (Rec.ApplyNumberSeries(xRec)) then
                Rec.Insert(false);
        if (not (Rec."Document Status" = "Medicines Request Status"::Draft)) then
            CurrPage.Editable := false;
    end;
}