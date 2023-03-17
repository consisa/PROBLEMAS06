codeunit 50601 "C6 Set Invoice Type"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    local procedure MyOnAfterPostSalesDoc(
        CommitIsSuppressed: Boolean;
        InvtPickPutaway: Boolean;
        RetRcpHdrNo: Code[20];
        SalesCrMemoHdrNo: Code[20];
        SalesInvHdrNo: Code[20];
        SalesShptHdrNo: Code[20];
        var CustLedgerEntry: Record "Cust. Ledger Entry";
        var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        var SalesHeader: Record "Sales Header";
        WhseReceiv: Boolean;
        WhseShip: Boolean
        )

    var
        SalesInvoiceHeader: Record "Sales Invoice Header";

    begin

        SalesInvoiceHeader.Get(SalesInvHdrNo);
        if SalesHeader.InvoiceType.AsInteger() <> 0 then begin

            if SalesHeader.InvoiceType.AsInteger() = 1 then begin
                SalesInvoiceHeader."No. Series" := 'SVFCF';
            end

            else
                if SalesHeader.InvoiceType.AsInteger() = 2 then begin
                    SalesInvoiceHeader."No. Series" := 'SVCF';
                end

                else
                    if SalesHeader.InvoiceType.AsInteger() = 3 then begin
                        SalesInvoiceHeader."No. Series" := 'SVFE';
                    end
        end;

        SalesInvoiceHeader.Insert(true);

    end;

}