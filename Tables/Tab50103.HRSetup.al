table 50103 "HR Setup"
{
    Caption = 'HR Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(2; "Employee Nos."; Code[20])
        {
            Caption = 'Employee Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(3; "Leave Application Nos."; Code[20])
        {
            Caption = 'Leave Application Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(4; "Annual Leave Days"; Integer)
        {
            Caption = 'Annual Leave Days';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}