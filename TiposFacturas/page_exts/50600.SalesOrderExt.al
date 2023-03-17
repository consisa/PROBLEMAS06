pageextension 50600 "C6 Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {

            field(InvoiceType; Rec.InvoiceType)
            {
                ApplicationArea = All;
                Caption = 'C6 Invoice Type';
                ShowMandatory = true;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}