page 50103 "HR Position List"
{
    Caption = 'HR Positions';
    PageType = List;
    SourceTable = "HR Position";
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
                    ToolTip = 'Specifies the position code.';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the position description.';
                }

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department code.';
                }

                field("Min Salary"; Rec."Min Salary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the minimum salary.';
                }

                field("Max Salary"; Rec."Max Salary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum salary.';
                }

                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the position is blocked.';
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
                RunPageLink = "Position Code" = field("Code");
                ToolTip = 'View employees in this position.';
            }
        }
    }
}