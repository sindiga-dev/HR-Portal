page 50107 "HR Leave Type List"
{
    Caption = 'HR Leave Types';
    PageType = List;
    SourceTable = "HR Leave Type";
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
                    ToolTip = 'Specifies the leave type code.';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the leave type description.';
                }

                field("Max Days Per Year"; Rec."Max Days Per Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum days per year.';
                }

                field("Paid Leave"; Rec."Paid Leave")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if this is paid leave.';
                }

                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the leave type is blocked.';
                }
            }
        }
    }
}