page 50104 "HR Setup"
{
    Caption = 'HR Setup';
    PageType = Card;
    SourceTable = "HR Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';

                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for employees.';
                }

                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series for leave applications.';
                }
            }

            group(General)
            {
                Caption = 'General';

                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default annual leave days.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}