page 50105 "HR Leave Application Card"
{
    Caption = 'HR Leave Application';
    PageType = Document;
    SourceTable = "HR Leave Application";
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
                    ToolTip = 'Specifies the leave application number.';
                    Editable = false;
                }

                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee number.';
                    Editable = false;
                }

                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee name.';
                }

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department code.';
                }

                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the application date.';
                }

                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the application status.';
                    Style = Strong;
                    StyleExpr = StatusIsPending;
                }
            }

            group("Leave Details")
            {
                Caption = 'Leave Details';

                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the leave type.';
                    Editable = IsEditable;
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the start date.';
                    Editable = IsEditable;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the end date.';
                    Editable = IsEditable;
                }

                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of days.';
                }

                field("Reason"; Rec."Reason")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason for leave.';
                    MultiLine = true;
                    Editable = IsEditable;
                }
            }

            group(Approval)
            {
                Caption = 'Approval';
                Visible = not IsEditable;

                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who approved the application.';
                }

                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the approval date.';
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
            action(Submit)
            {
                ApplicationArea = All;
                Caption = 'Submit';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Submit the leave application for approval.';
                Enabled = IsEditable;

                trigger OnAction()
                begin
                    Rec.Submit();
                    CurrPage.Update(false);
                end;
            }

            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Approve the leave application.';
                Enabled = IsPending;

                trigger OnAction()
                begin
                    if Confirm('Do you want to approve this leave application?') then begin
                        Rec.Approve();
                        CurrPage.Update(false);
                        Message('Leave application approved successfully.');
                    end;
                end;
            }

            action(Reject)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Reject the leave application.';
                Enabled = IsPending;

                trigger OnAction()
                begin
                    if Confirm('Do you want to reject this leave application?') then begin
                        Rec.Reject();
                        CurrPage.Update(false);
                        Message('Leave application rejected.');
                    end;
                end;
            }

            action(Reopen)
            {
                ApplicationArea = All;
                Caption = 'Reopen';
                Image = ReOpen;
                ToolTip = 'Reopen the leave application.';
                Enabled = not IsEditable and (Rec.Status <> Rec.Status::Posted);

                trigger OnAction()
                begin
                    if Confirm('Do you want to reopen this leave application?') then begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        CurrPage.Update(false);
                    end;
                end;
            }

            action(Post)
            {
                ApplicationArea = All;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Post the approved leave application.';
                Enabled = Rec.Status = Rec.Status::Approved;

                trigger OnAction()
                begin
                    if Confirm('Do you want to post this leave application?') then begin
                        Rec.Status := Rec.Status::Posted;
                        Rec.Modify(true);
                        CurrPage.Update(false);
                        Message('Leave application posted successfully.');
                    end;
                end;
            }
        }
    }

    var
        IsEditable: Boolean;
        IsPending: Boolean;
        StatusIsPending: Boolean;

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    local procedure UpdateControls()
    begin
        IsEditable := Rec.Status = Rec.Status::Open;
        IsPending := Rec.Status = Rec.Status::Pending;
        StatusIsPending := Rec.Status = Rec.Status::Pending;
    end;
}