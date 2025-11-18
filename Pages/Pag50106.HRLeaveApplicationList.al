page 50106 "HR Leave Application List"
{
    Caption = 'HR Leave Applications';
    PageType = List;
    SourceTable = "HR Leave Application";
    CardPageId = "HR Leave Application Card";
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
                    ToolTip = 'Specifies the leave application number.';
                }

                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee number.';
                }

                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee name.';
                }

                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the leave type.';
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the start date.';
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the end date.';
                }

                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of days.';
                }

                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status.';
                    StyleExpr = StatusStyle;
                }

                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the application date.';
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

    trigger OnAfterGetRecord()
    begin
        SetStatusStyle();
    end;

    var
        StatusStyle: Text;

    local procedure SetStatusStyle()
    begin
        case Rec.Status of
            Rec.Status::Open:
                StatusStyle := 'Standard';
            Rec.Status::Pending:
                StatusStyle := 'Attention';
            Rec.Status::Approved:
                StatusStyle := 'Favorable';
            Rec.Status::Rejected:
                StatusStyle := 'Unfavorable';
            Rec.Status::Posted:
                StatusStyle := 'Strong';
        end;
    end;
}