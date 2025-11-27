table 50100 "HR Employee"
{
    Caption = 'HR Employee';
    DataClassification = CustomerContent;
    LookupPageId = "HR Employee List";
    DrillDownPageId = "HR Employee List";

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
                    // Fixed: Use new No. Series codeunit
                    NoSeries.TestManual(HRSetup."Employee Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdateFullName();
            end;
        }

        field(3; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdateFullName();
            end;
        }

        field(4; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(5; "Email"; Text[80])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }

        field(6; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
        }

        field(7; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Date of Birth" > Today then
                    Error('Date of Birth cannot be in the future.');
            end;
        }

        field(8; "Gender"; Option)
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;
            OptionMembers = " ","Male","Female","Other";
            OptionCaption = ' ,Male,Female,Other';
        }

        field(10; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = CustomerContent;
            TableRelation = "HR Department";
        }

        field(11; "Position Code"; Code[20])
        {
            Caption = 'Position Code';
            DataClassification = CustomerContent;
            TableRelation = "HR Position";
        }

        field(12; "Employment Date"; Date)
        {
            Caption = 'Employment Date';
            DataClassification = CustomerContent;
        }

        field(13; "Termination Date"; Date)
        {
            Caption = 'Termination Date';  
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Termination Date" <> 0D then begin
                    if "Termination Date" < "Employment Date" then
                        Error('Termination Date cannot be before Employment Date.');
                    Status := Status::Inactive;
                end else
                    if Status = Status::Inactive then
                        Status := Status::Active;
            end;
        }

        field(14; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = Active,Inactive,"On Leave";
            OptionCaption = 'Active,Inactive,On Leave';
        }

        field(15; "Salary"; Decimal)
        {
            Caption = 'Salary';
            DataClassification = CustomerContent;
            MinValue = 0;
        }

        field(16; "Manager Employee No."; Code[20])
        {
            Caption = 'Manager Employee No.';
            DataClassification = CustomerContent;
            TableRelation = "HR Employee";
        }

        field(20; "Address"; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(21; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = CustomerContent;
        }

        field(22; "City"; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

        field(23; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
        }

        field(24; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }

        field(30; "Emergency Contact Name"; Text[100])
        {
            Caption = 'Emergency Contact Name';
            DataClassification = CustomerContent;
        }

        field(31; "Emergency Contact Phone"; Text[30])
        {
            Caption = 'Emergency Contact Phone';
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
        }

        field(40; "No. Series"; Code[20])
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
        key(Name; "Last Name", "First Name")
        {
        }
        key(Department; "Department Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Full Name", "Department Code", Status)
        {
        }
        fieldgroup(Brick; "No.", "Full Name", "Email")
        {
        }
    }

trigger OnInsert()
begin
    if "No." = '' then begin
        HRSetup.Get();
        HRSetup.TestField("Employee Nos.");
        "No." := NoSeries.GetNextNo(HRSetup."Employee Nos.", WorkDate(), true);
    end;

    // Initialize default status
    if Status = Status::Active then
        exit;
        
    if Status = Status::Inactive then
        exit;
    
    if Status = Status::"On Leave" then
        exit;
        
    Status := Status::Active;
end;

    var
        HRSetup: Record "HR Setup";
        NoSeries: Codeunit "No. Series"; // Fixed: Use new No. Series codeunit

    local procedure UpdateFullName()
    begin
        "Full Name" := "First Name" + ' ' + "Last Name";
    end;
}