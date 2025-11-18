page 50102 "HR Department List"
{
    Caption = 'HR Departments';
    PageType = List;
    SourceTable = "HR Department";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department code.';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department description.';
                }

                field("Manager Employee No."; Rec."Manager Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the manager employee number.';
                }

                field("Cost Center"; Rec."Cost Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the cost center.';
                }

                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the department is blocked.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Employees)
            {
                ApplicationArea = All;
                Caption = 'Employees';
                Image = Employee;
                RunObject = page "HR Employee List";
                RunPageLink = "Department Code" = field("Code");
                ToolTip = 'View employees in this department.';
            }
        }
    }
}