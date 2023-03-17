tableextension 50600 "C6 Sales Header Ext" extends "Sales Header"

{
    fields
    {
        field(50600; InvoiceType; Enum "C6 Invoice Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Type';
        }
    }
}