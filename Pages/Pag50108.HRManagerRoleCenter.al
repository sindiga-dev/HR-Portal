page 50108 "HR Manager Role Center"
{
    Caption = 'HR Manager';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)  // Fixed: Capitalized 'RoleCenter'
        {
            group(Control1)
            {
                part(Headline; "Headline RC Order Processor")
                {
                    ApplicationArea = All;
                }
            }

            group(Control2)
            {
                part(Activities; "HR Manager Activities")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(sections)
        {
            group(Employees)
            {
                Caption = 'Employees';
                Image = HumanResources;

                action(EmployeeList)
                {
                    ApplicationArea = All;
                    Caption = 'Employees';
                    RunObject = page "HR Employee List";
                    ToolTip = 'View and manage employees.';
                }

                action(Departments)
                {
                    ApplicationArea = All;
                    Caption = 'Departments';
                    RunObject = page "HR Department List";
                    ToolTip = 'View and manage departments.';
                }

                action(Positions)
                {
                    ApplicationArea = All;
                    Caption = 'Positions';
                    RunObject = page "HR Position List";
                    ToolTip = 'View and manage positions.';
                }
            }

            group(Leave)
            {
                Caption = 'Leave Management';
                Image = Absence;

                action(LeaveApplications)
                {
                    ApplicationArea = All;
                    Caption = 'Leave Applications';
                    RunObject = page "HR Leave Application List";
                    ToolTip = 'View and manage leave applications.';
                }

                action(LeaveTypes)
                {
                    ApplicationArea = All;
                    Caption = 'Leave Types';
                    RunObject = page "HR Leave Type List";
                    ToolTip = 'View and manage leave types.';
                }
            }

            group(Setup)
            {
                Caption = 'Setup';
                Image = Setup;

                action(HRSetup)
                {
                    ApplicationArea = All;
                    Caption = 'HR Setup';
                    RunObject = page "HR Setup";
                    ToolTip = 'Configure HR module settings.';
                }
            }
        }

        area(embedding)
        {
            action(Employees2)
            {
                ApplicationArea = All;
                Caption = 'Employees';
                RunObject = page "HR Employee List";
                ToolTip = 'View employees.';
            }

            action(LeaveApplications2)
            {
                ApplicationArea = All;
                Caption = 'Leave Applications';
                RunObject = page "HR Leave Application List";
                ToolTip = 'View leave applications.';
            }
        }

        area(creation)
        {
            action(NewEmployee)
            {
                ApplicationArea = All;
                Caption = 'Employee';
                Image = Employee;
                RunObject = page "HR Employee Card";
                RunPageMode = Create;
                ToolTip = 'Create a new employee.';
            }

            action(NewLeaveApplication)
            {
                ApplicationArea = All;
                Caption = 'Leave Application';
                Image = Absence;
                RunObject = page "HR Leave Application Card";
                RunPageMode = Create;
                ToolTip = 'Create a new leave application.';
            }
        }

        area(reporting)
        {
            action(EmployeeReport)
            {
                ApplicationArea = All;
                Caption = 'Employee List';
                Image = Report;
                ToolTip = 'Print employee list report.';
                // REMOVED TRIGGER - Role Center cannot have triggers
            }

            action(LeaveReport)
            {
                ApplicationArea = All;
                Caption = 'Leave Summary';
                Image = Report;
                ToolTip = 'Print leave summary report.';
                // REMOVED TRIGGER - Role Center cannot have triggers
            }
        }
    }
}