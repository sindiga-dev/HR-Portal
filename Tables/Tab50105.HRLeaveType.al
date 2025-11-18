table 50105 "HR Leave Type"
{
    Caption = 'HR Leave Type';
    DataClassification = CustomerContent;
    LookupPageId = "HR Leave Type List";
    DrillDownPageId = "HR Leave Type List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "Max Days Per Year"; Integer)
        {
            Caption = 'Max Days Per Year';
            DataClassification = CustomerContent;
            MinValue = 0;
        }

        field(4; "Paid Leave"; Boolean)
        {
            Caption = 'Paid Leave';
            DataClassification = CustomerContent;
        }

        field(5; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Description", "Paid Leave")
        {
        }
    }
}