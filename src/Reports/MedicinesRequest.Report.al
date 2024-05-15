report 50120 "Medicines Request"
{
    Caption = 'Medicines Request Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;
    PreviewMode = PrintLayout;
    WordMergeDataItem = MedicinesRequestHeader;

    dataset
    {
        dataitem(MedicinesRequestHeader; "Medicines Request Header")
        {
            column(No; "No.")
            {

            }
            column(Description; "Description")
            {

            }

            column(PatientNo; "Patient No.")
            {

            }
            column(NoSeries; "No. Series")
            {

            }
            column(DocumentStatus; "Document Status")
            {

            }
            column(PatientName; "Patient Name")
            {

            }
        }
        dataitem(MedicinesRequestLine; "Medicines Request Line")
        {
            column(Amount; "Amount")
            {

            }
            column(Reason; "Reason")
            {

            }
            column(MedicineName; "Medicine Name")
            {

            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'MedicinesRequest.docx';
        }
    }
}