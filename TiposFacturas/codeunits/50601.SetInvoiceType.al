codeunit 50601 "C6 Set Invoice Type"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure MyOnBeforePostSalesDoc(
        CommitIsSuppressed: Boolean;
        PreviewMode: Boolean;
        sender: Codeunit "Sales-Post";
        var HideProgressWindow: Boolean;
        var SalesHeader: Record "Sales Header"
        )

    var
        SalesInvoiceHeader: Record "Sales Invoice Header";

    begin

        //Set No. Series to Invoice Type
        Evaluate(SalesInvoiceHeader."No. Series", Format(SalesHeader.InvoiceType));

        if Format(SalesHeader.InvoiceType) = 'Final Consumer Invoice' then begin
            SalesInvoiceHeader."No. Series" := 'SVFCF';
        end

        else
            if Format(SalesHeader.InvoiceType) = 'Tax Credit Invoice' then begin
                SalesInvoiceHeader."No. Series" := 'SVCF';
            end

            else
                if Format(SalesHeader.InvoiceType) = 'Export Invoice' then begin
                    SalesInvoiceHeader."No. Series" := 'SVFE';
                end

    end;

}