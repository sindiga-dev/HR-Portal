page 50101 "HR Employee List"
{
    Caption = 'HR Employees';
    PageType = List;
    SourceTable = "HR Employee";
    CardPageId = "HR Employee Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee number.';
                }

                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the full name.';
                }

                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the email address.';
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the phone number.';
                }

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department.';
                }

                field("Position Code"; Rec."Position Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the position.';
                }

                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employment date.';
                }

                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status.';
                }
            }
        }

        area(factboxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Statistics)
            {
                ApplicationArea = All;
                Caption = 'Statistics';
                Image = Statistics;
                ToolTip = 'View statistical information for the employee.';

                trigger OnAction()
                begin
                    Message('Employee statistics would be displayed here.');
                end;
            }
        }
    }
}