page 50120 "NWTH Test Barcode"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "NWTH Gen Barcode";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Id)
                {
                    ApplicationArea = All;

                }
                field(Image; Image)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Test)
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    NWTHGenBarcodeL: Report "NWTH Gen Barcode";
                begin
                    NWTHGenBarcodeL.Run();
                end;
            }
        }
    }
}