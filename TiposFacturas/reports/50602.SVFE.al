report 50602 "C6 SVFE Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\TiposFacturas\reports\50602.SVFE.rdlc';

    dataset
    {
        dataitem(SIH; "Sales Invoice Header")
        {
            column(No_; "No.") { }
            column(Bill_to_Customer_No_; "Bill-to Customer No.") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }

            dataitem("SIL"; "Sales Invoice Line")
            {
                DataItemLinkReference = SIH;
                DataItemLink = "Document No." = field("No.");

                column(Type; Type) { }
                column(InvoiceNo; "No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Quantity; Quantity) { }
                column(Unit_Price; "Unit Price") { }
                column(Amount; Amount) { }
            }

        }
    }

    var
        myInt: Integer;
}