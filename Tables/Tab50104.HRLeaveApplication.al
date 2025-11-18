table 50104 "HR Leave Application"
{
    Caption = 'HR Leave Application';
    DataClassification = CustomerContent;
    LookupPageId = "HR Leave Application List";
    DrillDownPageId = "HR Leave Application List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Leave Application Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = CustomerContent;
            TableRelation = "HR Employee";

            trigger OnValidate()
            var
                Employee: Record "HR Employee";
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee."Full Name";
                    "Department Code" := Employee."Department Code";
                end;
            end;
        }

        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(4; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(5; "Leave Type"; Code[20])
        {
            Caption = 'Leave Type';
            DataClassification = CustomerContent;
            TableRelation = "HR Leave Type";
        }

        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Start Date" <> 0D) and ("End Date" <> 0D) then
                    CalculateDays();
            end;
        }

        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "End Date" < "Start Date" then
                    Error('End Date cannot be before Start Date.');
                if ("Start Date" <> 0D) and ("End Date" <> 0D) then
                    CalculateDays();
            end;
        }

        field(8; "No. of Days"; Decimal)
        {
            Caption = 'No. of Days';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
        }

        field(9; "Reason"; Text[250])
        {
            Caption = 'Reason';
            DataClassification = CustomerContent;
        }

        field(10; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = Open,Pending,Approved,Rejected,Posted;
            OptionCaption = 'Open,Pending,Approved,Rejected,Posted';
            Editable = false;
        }

        field(11; "Application Date"; Date)
        {
            Caption = 'Application Date';
            DataClassification = CustomerContent;
        }

        field(12; "Approved By"; Code[50])
        {
            Caption = 'Approved By';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(13; "Approval Date"; Date)
        {
            Caption = 'Approval Date';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(20; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Employee; "Employee No.", "Start Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Employee Name", "Leave Type", "Start Date", Status)
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Leave Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Leave Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Application Date" := Today;
        Status := Status::Open;
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure CalculateDays()
    begin
        "No. of Days" := "End Date" - "Start Date" + 1;
    end;

    procedure Approve()
    begin
        TestField(Status, Status::Pending);
        Status := Status::Approved;
        "Approved By" := UserId;
        "Approval Date" := Today;
        Modify(true);
    end;

    procedure Reject()
    begin
        TestField(Status, Status::Pending);
        Status := Status::Rejected;
        Modify(true);
    end;

    procedure Submit()
    begin
        TestField(Status, Status::Open);
        TestField("Employee No.");
        TestField("Leave Type");
        TestField("Start Date");
        TestField("End Date");
        TestField(Reason);

        Status := Status::Pending;
        Modify(true);
    end;
}