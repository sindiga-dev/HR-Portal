table 50101 "HR Department"
{
    Caption = 'HR Department';
    DataClassification = CustomerContent;
    LookupPageId = "HR Department List";
    DrillDownPageId = "HR Department List";

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

        field(3; "Manager Employee No."; Code[20])
        {
            Caption = 'Manager Employee No.';
            DataClassification = CustomerContent;
            TableRelation = "HR Employee";
        }

        field(4; "Cost Center"; Code[20])
        {
            Caption = 'Cost Center';
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
        fieldgroup(DropDown; "Code", "Description")
        {
        }
    }
}