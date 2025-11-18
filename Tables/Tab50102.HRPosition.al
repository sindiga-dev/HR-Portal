table 50102 "HR Position"
{
    Caption = 'HR Position';
    DataClassification = CustomerContent;
    LookupPageId = "HR Position List";
    DrillDownPageId = "HR Position List";

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

        field(3; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = CustomerContent;
            TableRelation = "HR Department";
        }

        field(4; "Min Salary"; Decimal)
        {
            Caption = 'Min Salary';
            DataClassification = CustomerContent;
            MinValue = 0;
        }

        field(5; "Max Salary"; Decimal)
        {
            Caption = 'Max Salary';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if ("Max Salary" <> 0) and ("Min Salary" <> 0) then
                    if "Max Salary" < "Min Salary" then
                        Error('Max Salary cannot be less than Min Salary.');
            end;
        }

        field(6; "Blocked"; Boolean)
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
        fieldgroup(DropDown; "Code", "Description", "Department Code")
        {
        }
    }
}
