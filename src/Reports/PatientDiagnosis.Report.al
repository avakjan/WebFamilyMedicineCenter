report 50100 "Patient Diagnosis"
{
    Caption = 'Patient Diagnosis';
    UsageCategory = None;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;
    PreviewMode = PrintLayout;
    WordMergeDataItem = PatientDiagnosis;

    dataset
    {
        dataitem(PatientDiagnosis; "Patient Diagnosis")
        {
            DataItemTableView = sorting("Patient No.", "Disease No.");
            column(DoctorNo; "Doctor No.")
            {

            }
            column(PatientNo; "Patient No.")
            {

            }
            column(Date; "Date")
            {

            }
            column(PatientFirstName; "Patient First Name")
            {

            }
            column(PatientLastName; "Patient Last Name")
            {

            }
            column(DiseaseName; "Disease Name")
            {

            }
            column(MedicalEmployeeFirstName; "Medical Employee First Name")
            {

            }
            column(MedicalEmployeeLastName; "Medical Employee Last Name")
            {

            }
            column(MedicineCenterName; "Medicine Center Name")
            {

            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'Diagnosis.docx';
        }
    }
}