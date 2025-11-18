page 50109 "HR Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "HR Cue";

    layout
    {
        area(content)
        {
            cuegroup(Employees)
            {
                Caption = 'Employees';

                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "HR Employee List";
                    ToolTip = 'Number of active employees.';
                }

                field("Employees On Leave"; Rec."Employees On Leave")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "HR Employee List";
                    ToolTip = 'Number of employees on leave.';
                }

                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "HR Employee List";
                    ToolTip = 'Number of inactive employees.';
                }
            }

            cuegroup("Leave Applications")
            {
                Caption = 'Leave Applications';

                field("Pending Leave Applications"; Rec."Pending Leave Applications")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "HR Leave Application List";
                    ToolTip = 'Number of pending leave applications.';
                    StyleExpr = 'Attention';
                }

                field("Approved Leave Applications"; Rec."Approved Leave Applications")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "HR Leave Application List";
                    ToolTip = 'Number of approved leave applications.';
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
        Rec.CalcFields(
            "Active Employees",
            "Employees On Leave",
            "Inactive Employees",
            "Pending Leave Applications",
            "Approved Leave Applications"
        );
    end;
}
