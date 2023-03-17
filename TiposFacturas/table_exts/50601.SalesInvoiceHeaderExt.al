tableextension 50601 "C6 Sales Invoice Header Ext" extends "Sales Invoice Header"
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