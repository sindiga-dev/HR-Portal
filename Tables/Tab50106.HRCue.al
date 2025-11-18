table 50106 "HR Cue"
{
    Caption = 'HR Cue';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(2; "Active Employees"; Integer)
        {
            Caption = 'Active Employees';
            FieldClass = FlowField;
            CalcFormula = count("HR Employee" where(Status = const(Active)));
            Editable = false;
        }

        field(3; "Employees On Leave"; Integer)
        {
            Caption = 'Employees On Leave';
            FieldClass = FlowField;
            CalcFormula = count("HR Employee" where(Status = const("On Leave")));
            Editable = false;
        }

        field(4; "Inactive Employees"; Integer)
        {
            Caption = 'Inactive Employees';
            FieldClass = FlowField;
            CalcFormula = count("HR Employee" where(Status = const(Inactive)));
            Editable = false;
        }

        field(5; "Pending Leave Applications"; Integer)
        {
            Caption = 'Pending Leave Applications';
            FieldClass = FlowField;
            CalcFormula = count("HR Leave Application" where(Status = const(Pending)));
            Editable = false;
        }

        field(6; "Approved Leave Applications"; Integer)
        {
            Caption = 'Approved Leave Applications';
            FieldClass = FlowField;
            CalcFormula = count("HR Leave Application" where(Status = const(Approved)));
            Editable = false;
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