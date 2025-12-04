page 50100 "Test Customer"
{
    SourceTable = Customer;
    PageType = Card;


    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {

            }
            field(Name; Rec.Name)
            {

            }
            field(Name1; Rec.Name)
            {

            }
            field(Name2; Rec.Name)
            {

            }
            field(Name3; Rec.Name)
            {

            }
            field(EmptyThing; EmptyVariable)
            {
                ToolTip = 'This thing never supposed to be eptmy.';
            }
        }
    }

    var
        EmptyVariable: Boolean;

    trigger OnOpenPage()
    begin
        Message('Hey, how are you doing today?');
    end;

    trigger OnAfterGetRecord()
    begin
        AssignNewCode();
        LoopThroughAllVendors();
    end;

    procedure AssignNewCode()
    var
        CheckNumber: Integer;
    begin
        CheckNumber := 1;

        case CheckNumber of
            1:
                Rec.Name := '1';
            2:
                Rec.Name := '2';
            3:
                Rec.Name := '3';
            4:
                Rec.Name := '4';
        end;
    end;

    local procedure ForSureIsUsedSomewhere()
    var
        OopsyErr: Label 'Oopsy, something went wrong';
    begin
        if Today() > 0D then
            Error(OopsyErr);
    end;

    local procedure LoopThroughAllVendors()
    var
        Vendor: Record Vendor;
        Vendor2: Record Vendor;
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        Vendor.FindSet();
        repeat
            if Vendor.Address <> '' then begin
                if Vendor."Address 2" <> '' then begin
                    VendorLedgerEntry.SetRange("Vendor No.", Vendor."Mobile Phone No.");
                    VendorLedgerEntry.FindSet();
                    repeat
                        VendorLedgerEntry.Amount := 0;
                        VendorLedgerEntry."Debit Amount" := 0;
                        VendorLedgerEntry."On Hold" := 'false';
                        if VendorLedgerEntry."Due Date" < Today() then
                            continue
                        else
                            VendorLedgerEntry.modify(false);
                    until VendorLedgerEntry.Next() = 0;
                end;

                if Vendor."Address 2" <> '' then begin
                    VendorLedgerEntry.GetLastEntryNo();
                    VendorLedgerEntry.Init();
                    VendorLedgerEntry."Credit Amount" := 1;
                    VendorLedgerEntry.Insert(false);
                end;
            end;

        until Vendor.Next() = 0;
    end;
}