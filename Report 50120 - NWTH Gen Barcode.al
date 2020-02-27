report 50120 "NWTH Gen Barcode"
{
    DefaultLayout = RDLC;
    RDLCLayout = './NWTH Barcode.rdlc';
    ApplicationArea = NWTHLOC;
    Caption = 'NWTH Barcode';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = CONST(1));

            column(BarcodeImage; NWTHGenBarcodeG.Image)
            {

            }

            column(QRcodeImage; NWTHGenBarcode2G.Image2)
            {

            }

            column(BarcodeInputG; BarcodeInputG)
            {

            }

            column(QrCodeInputG; QrCodeInputG)
            {

            }
            trigger OnAfterGetRecord()
            begin

            end;

            trigger OnPreDataItem()
            begin
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Barcode; BarcodeInputG)
                    {
                        ApplicationArea = Basic, Suite;
                    }

                    field(QrCode; QrCodeInputG)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    var
        OutStreamL: OutStream;
        InStreamL: InStream;
        HttpClientL: HttpClient;
        HttpResponseMessageL: HttpResponseMessage;

        OutStream2L: OutStream;
        InStream2L: InStream;
        HttpClient2L: HttpClient;
        HttpResponseMessage2L: HttpResponseMessage;

    begin
        HttpClientL.Get('http://barcodes4.me/barcode/c128a/' + BarcodeInputG + '.gif', HttpResponseMessageL);
        HttpResponseMessageL.Content.ReadAs(InStreamL);
        NWTHGenBarcodeG.Image.CreateOutStream(OutStreamL, TextEncoding::UTF8);
        CopyStream(OutStreamL, InStreamL);
        HttpClient2L.Get('http://barcodes4.me/barcode/qr/qrcode.gif?value=' + QrCodeInputG, HttpResponseMessage2L);
        HttpResponseMessage2L.Content.ReadAs(InStream2L);
        NWTHGenBarcode2G.Image2.CreateOutStream(OutStream2L, TextEncoding::UTF8);
        CopyStream(OutStream2L, InStream2L);

    end;

    var
        NWTHGenBarcodeG: Record "NWTH Gen Barcode";
        NWTHGenBarcode2G: Record "NWTH Gen Barcode";
        BarcodeInputG: Text;
        QrCodeInputG: Text;
        myInt: Integer;
}