page 50100 "HR Employee Card"
{
    Caption = 'HR Employee Card';
    PageType = Card;
    SourceTable = "HR Employee";
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee number.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first name of the employee.';
                }

                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last name of the employee.';
                }

                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the full name of the employee.';
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

                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of birth.';
                }

                field("Gender"; Rec."Gender")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the gender.';
                }

                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employment status.';
                }
            }

            group(Employment)
            {
                Caption = 'Employment Information';

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department code.';
                }

                field("Position Code"; Rec."Position Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the position code.';
                }

                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employment start date.';
                }

                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the termination date.';
                }

                field("Salary"; Rec."Salary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the salary amount.';
                }

                field("Manager Employee No."; Rec."Manager Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the manager employee number.';
                }
            }

            group(Address)
            {
                Caption = 'Address';

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the address.';
                }

                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies additional address information.';
                }

                field("City"; Rec."City")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the city.';
                }

                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the postal code.';
                }

                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the country/region code.';
                }
            }

            group("Emergency Contact")
            {
                Caption = 'Emergency Contact';

                field("Emergency Contact Name"; Rec."Emergency Contact Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the emergency contact name.';
                }

                field("Emergency Contact Phone"; Rec."Emergency Contact Phone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the emergency contact phone number.';
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
        area(navigation)
        {
            action(LeaveApplications)
            {
                ApplicationArea = All;
                Caption = 'Leave Applications';
                Image = Absence;
                RunObject = page "HR Leave Application List";
                RunPageLink = "Employee No." = field("No.");
                ToolTip = 'View leave applications for this employee.';
            }
        }

        area(processing)
        {
            action(NewLeaveApplication)
            {
                ApplicationArea = All;
                Caption = 'New Leave Application';
                Image = NewDocument;
                ToolTip = 'Create a new leave application for this employee.';

                trigger OnAction()
                var
                    LeaveApp: Record "HR Leave Application";
                    LeaveAppCard: Page "HR Leave Application Card";
                begin
                    LeaveApp.Init();
                    LeaveApp."Employee No." := Rec."No.";
                    LeaveApp.Validate("Employee No.");
                    LeaveApp.Insert(true);
                    LeaveAppCard.SetRecord(LeaveApp);
                    LeaveAppCard.RunModal();
                end;
            }
        }

        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(NewLeaveApplication_Promoted; NewLeaveApplication)
                {
                }
            }
        }
    }
}
