pageextension 50601 "C6 Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
    }

    actions
    {
        addbefore("Update Document")
        {
            action(C6PrintInvoice)
            {
                Caption = 'C6 Print Invoice';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    SVFCF_Report: Report "C6 SVFCF Invoice";
                    SVCF_Report: Report "C6 SVCF Invoice";
                    SVFE_Report: Report "C6 SVFE Invoice";

                begin

                    if Format(SalesInvoiceHeader.InvoiceType) <> '--Select One--' then begin

                        if Format(SalesInvoiceHeader.InvoiceType) = 'Final Consumer Invoice' then begin
                            Rec."No. Series" := 'SVFCF';
                            SalesInvoiceHeader.SetRange("No.", Rec."No.");
                            SVFCF_Report.SetTableView(SalesInvoiceHeader);
                            SVCF_Report.Run();
                        end

                        else
                            if Format(SalesInvoiceHeader.InvoiceType) = 'Tax Credit Invoice' then begin
                                Rec."No. Series" := 'SVCF';
                                SalesInvoiceHeader.SetRange("No.", Rec."No.");
                                SVCF_Report.SetTableView(SalesInvoiceHeader);
                                SVCF_Report.Run();
                            end

                            else
                                if Format(SalesInvoiceHeader.InvoiceType) = 'Tax Credit Invoice' then begin
                                    Rec."No. Series" := 'SVFE';
                                    SalesInvoiceHeader.SetRange("No.", Rec."No.");
                                    SVFE_Report.SetTableView(SalesInvoiceHeader);
                                    SVFE_Report.Run();
                                end;

                    end;

                end;
            }
        }
    }
}