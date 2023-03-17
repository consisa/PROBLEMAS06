enum 50600 "C6 Invoice Type"
{
    Extensible = true;

    value(0; empty)
    {
        Caption = '--Select One--';
    }

    value(1; SVFCF)
    {
        //Final Consumer Invoice
        Caption = 'SVFCF';
    }

    value(2; SVCF)
    {
        //Tax Credit Invoice
        Caption = 'SVCF';
    }

    value(3; SVFE)
    {
        //Export Invoice
        Caption = 'SVFE';
    }
}