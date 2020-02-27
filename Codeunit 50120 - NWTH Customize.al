codeunit 50120 "NWTH Customize"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    local procedure ______BEGIN_GLOBAL____________________________________________________()
    begin
    end;

    procedure GenerateBarcode(textP: Text)
    var
        InStreamL: InStream;
        OutStreamL: OutStream;
        HttpClientL: HttpClient;
        HttpResponseMessageL: HttpResponseMessage;
        NWTHBarcodeL: Record "NWTH Gen Barcode";

    begin
        HttpClientL.Get('http://barcodes4.me/barcode/c128a/' + textP + '.png', HttpResponseMessageL);
        HttpResponseMessageL.Content.ReadAs(InStreamL);
        NWTHBarcodeL.Image.CreateOutStream(OutStreamL, TextEncoding::UTF8);
        CopyStream(OutStreamL, InStreamL);
        NWTHBarcodeL.Insert(true);
        // exit(NWTHBarcodeL);
    end;

}