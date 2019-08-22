unit uPrintStruk;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows, Printers, Winapi.WinSpool,
  Vcl.Dialogs, uAppUtils, uTransDetail, System.StrUtils, System.Math;

type
  TPrintStruk = class(TObject)
  private
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    class function GenerateStruk(ASalesInv: TSalesInvoice): TStrings; overload;
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    class function GenerateStruk(ASalesRetur: TSalesRetur): TStrings; overload;
  public
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    class procedure Print(ASalesInv: TSalesInvoice); overload;
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    class procedure Print(ASalesRetur: TSalesRetur); overload;
  end;

procedure PrintStrings(aSS: TStrings);

const
  FILE_HEADER : string  = 'header.txt';
  FILE_FOOTER : string  = 'footer.txt';


implementation

uses
  uVariable, uDBUtils;

procedure PrintStrings(aSS: TStrings);
var
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  DriverName: array [0..255] of char;
  DeviceName: array [0..255] of char;
  OutPut: array [0..255] of char;
  DeviceMode: Thandle;
//  i: Integer;
begin
  Printer.GetPrinter(DeviceName, DriverName, Output, DeviceMode);

  if not OpenPrinter(DeviceName, Handle, nil) then
  begin
    ShowMessage('error ' + IntToStr(GetLastError));
    Exit;
  end;

  with DocInfo1 do
  begin
    pDocName := PChar('test doc');
    pOutputFile := nil;
    pDataType := 'RAW';
  end;

  StartDocPrinter(Handle, 1, @DocInfo1);
  StartPagePrinter(Handle);

//  for i := 0 to aSS.Count-1 do
//    WritePrinter(Handle, PChar(aSS[i]), Length(aSS[i]), N);

  WritePrinter(Handle, PChar(aSS.Text), Length(aSS.Text)*SizeOf(Char), N);

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
end;

class function TPrintStruk.GenerateStruk(ASalesInv: TSalesInvoice): TStrings;
var
//  iCetul: Integer;
  lDetail: TTransDetail;
  lFileName: string;
  lService: TServiceDetail;
  lSS: TStrings;
  sDir: string;
  sReportPath: string;
  sTemp: string;
begin
  lSS := TStringList.Create;
  Result := TStringList.Create;
  try
    sReportPath := TAppUtils.GetAppPath;
    lSS.LoadFromFile(sReportPath + 'reports\' + FILE_HEADER);

    // baris cetul
//    iCetul := lSS.Count + 3;

    Result.AddStrings(lSS);
    Result.Add('Kasir : ' + TAppUtils.StrPadRight(UserLogin,24,' ')
      + FormatDateTime('dd/MM/yy',Now));

    Result.Add('No#   : ' + TAppUtils.StrPadRight(ASalesInv.InvoiceNo,24,' ')
      + FormatDateTime('HH:nn:ss',Now));

    if Assigned(ASalesInv.Customer) then
      Result.Add('Cust  : '
        + TAppUtils.StrPadRight(ASalesInv.Customer.Nama,32,' '));

    if ASalesInv.PaymentFlag = PaymentFlag_Credit then
    begin
      Result.Add('Bayar : '
        + TAppUtils.StrPadRight('KREDIT - JT TEMPO : ',24,' ')
        + FormatDateTime('dd/MM/yy',ASalesInv.DueDate));
    end;

//    Result.Add('       - CETAK ULANG / REPRINT -');
    Result.Add(TAppUtils.StrPadRight('',40,'-'));


    for lDetail in ASalesInv.Items do
    begin
      if lDetail.Item = nil then
        raise Exception.Create('lDetail.Item = nil');
      if lDetail.Item.Nama = '' then
        lDetail.Item.ReLoad(False);

      if Abs(lDetail.Qty) = 1 then
      begin
        Result.Add(
          TAppUtils.StrPadRight(LeftStr(lDetail.Item.Nama,29),29,' ') +' '
          + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lDetail.Harga),10,' ')
        );
      end
      else
      begin
        if lDetail.UOM = nil then
          raise Exception.Create('lDetail.UOM = nil');
        if lDetail.UOM.UOM = '' then
          lDetail.UOM.ReLoad(False);

        Result.Add(LeftStr(lDetail.Item.Nama,40));
        sTemp :=
              TAppUtils.StrPadLeftCut(FloatToStr(Abs(lDetail.Qty)),10,' ') + ' '
            + TAppUtils.StrPadRight(lDetail.UOM.UOM,5,' ') + 'x'
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lDetail.Harga),10,' ')
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Abs(lDetail.Qty*lDetail.Harga)),13,' ');

        Result.Add(sTemp);
      end;

      if lDetail.Discount > 0 then
      begin
        Result.Add(
           TAppUtils.StrPadLeftCut(RightStr('Diskon ',20),20,' ')
          +TAppUtils.StrPadRight(' ',9,' ')
          +TAppUtils.StrPadRight(' (',3,' ')
          +TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Abs(lDetail.Qty* lDetail.Discount)),7,' ')
          +TAppUtils.StrPadRight(')',1,' ')
        );
      end

    end;

    for lService in ASalesInv.Services do
    begin
      if lService.Service = nil then
        raise Exception.Create('lService.Service = nil');
      if lService.Service.Nama = '' then
        lService.Service.ReLoad(False);

      if Abs(lService.Qty) = 1 then
      begin
        Result.Add(
          TAppUtils.StrPadRight(LeftStr(lService.Service.Nama,29),29,' ') +' '
          + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lService.Harga),10,' ')
        );
      end
      else
      begin
        Result.Add(LeftStr(lService.Service.Nama,40));
        sTemp :=
              TAppUtils.StrPadLeftCut(FloatToStr(Abs(lService.Qty)),10,' ') + ' '
            + TAppUtils.StrPadRight('PCS',5,' ') + 'x'
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lService.Harga),10,' ')
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Abs(lService.Qty*lService.Harga)),13,' ');

        Result.Add(sTemp);
      end;

      if lService.Discount > 0 then
      begin
        Result.Add(
           TAppUtils.StrPadLeftCut(RightStr('Diskon ',20),20,' ')
          +TAppUtils.StrPadRight(' ',9,' ')
          +TAppUtils.StrPadRight(' (',3,' ')
          +TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Abs(lService.Qty* lService.Discount)),7,' ')
          +TAppUtils.StrPadRight(')',1,' ')
        );
      end

    end;

    sTemp := '';
    Result.Add(TAppUtils.StrPadRight('',40,'-'));


//    Result.Add(TAppUtils.StrPadLeftCut('TOTAL SEBELUM PAJAK:',27,' ')
//      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Ceil(ASalesInv.Amount-ASalesInv.PPN)),13,' '));
//    Result.Add(TAppUtils.StrPadLeftCut('TOTAL PPN:',27,' ')
//      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Ceil(ASalesInv.PPN)),13,' '));
    Result.Add(TAppUtils.StrPadLeftCut('TOTAL BELANJA:',27,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Ceil(ASalesInv.Amount)),13,' '));


    if ASalesInv.HasRetur then
    begin
      ASalesInv.SalesRetur.ReLoad(False);

      Result.Add(TAppUtils.StrPadLeftCut('RETUR:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.SalesRetur.Amount),13,' '));
      Result.Add(TAppUtils.StrPadRight('',27,' ') + TAppUtils.StrPadRight('',13,'-'));
      Result.Add(TAppUtils.StrPadLeftCut('TOTAL BAYAR:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.Amount - ASalesInv.SalesRetur.Amount),13,' '));

    end;

    if ASalesInv.CardAmount > 0 then
    begin
      Result.Add(TAppUtils.StrPadRight('',27,' ') + TAppUtils.StrPadRight('',13,'-'));
      Result.Add(TAppUtils.StrPadLeftCut('BAYAR KARTU:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.CardAmount),13,' '));
      Result.Add(TAppUtils.StrPadLeftCut('BAYAR TUNAI:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.CashAmount),13,' '));
      Result.Add(TAppUtils.StrPadRight('',27,' ') + TAppUtils.StrPadRight('',13,'-'));
      Result.Add(TAppUtils.StrPadLeftCut('KEMBALI:',27,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.CashAmount + ASalesInv.CardAmount - ASalesInv.Amount),13,' '));

    end;

    //update 2019/7/28 => bengkel terima uang setelah cetak faktur
//    if ASalesInv.CashAmount > 0 then
////    begin
//      Result.Add(TAppUtils.StrPadLeftCut('TUNAI:',27,' ')
//        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.CashAmount),13,' '));
//      Result.Add(TAppUtils.StrPadRight('',27,' ') + TAppUtils.StrPadRight('',13,'-'));
//      Result.Add(TAppUtils.StrPadLeftCut('Kembali:',27,' ')
//        + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',ASalesInv.CashAmount - ASalesInv.Amount),13,' '));
//    end;


    Result.Add(TAppUtils.StrPadRight('',40,'-'));
    lSS.LoadFromFile(sReportPath + 'reports\' + FILE_FOOTER);
    Result.AddStrings(lSS);

    if TAppUtils.BacaRegistry('PrintToFile') = '1' then
    begin
      lFileName := StringReplace( ASalesInv.InvoiceNo,'.','',[rfReplaceAll]);
      lFileName := StringReplace( lFileName,'/','',[rfReplaceAll]);
      lFileName := lFileName + '.txt';
  //    if Reprint then lFileName := ModTransaksi.TRANS_NO + '_R.txt';
      sDir := TAppUtils.GetAppPath + 'print\';
      if not DirectoryExists(sDir) then CreateDir(sDir);
      Result.SaveToFile(sDir + lFileName);
    end;
//    Result.Delete(iCetul);
  finally
    lSS.Free;
  end;
end;

class function TPrintStruk.GenerateStruk(ASalesRetur: TSalesRetur): TStrings;
var
  lDetail: TTransDetail;
  lFileName: string;
  lSS: TStrings;
  sDir: string;
  sReportPath: string;
  sTemp: string;
begin
  lSS := TStringList.Create;
  Result := TStringList.Create;
  try
    sReportPath := TAppUtils.GetAppPath;
    lSS.LoadFromFile(sReportPath + 'reports\' + FILE_HEADER);

    Result.AddStrings(lSS);
    Result.Add('Kasir  : ' + TAppUtils.StrPadRight(UserLogin,24,' ')
      + FormatDateTime('dd/MM/yy',Now));

    Result.Add('Retur  : ' + TAppUtils.StrPadRight(ASalesRetur.Refno,24,' ')
      + FormatDateTime('HH:nn:ss',Now));

    if ASalesRetur.Invoice <> nil then
      Result.Add('Faktur : ' + TAppUtils.StrPadRight(ASalesRetur.Invoice.InvoiceNo,24,' ') );

    if Assigned(ASalesRetur.Customer) then
      Result.Add('Cust   : '
        + TAppUtils.StrPadRight(ASalesRetur.Customer.Nama,32,' '));


//    Result.Add('       - CETAK ULANG / REPRINT -');
    Result.Add(TAppUtils.StrPadRight('',40,'-'));


    for lDetail in ASalesRetur.Items do
    begin
      if lDetail.Item = nil then
        raise Exception.Create('lDetail.Item = nil');
      if lDetail.Item.Nama = '' then
        lDetail.Item.ReLoad(False);

      if Abs(lDetail.Qty) = 1 then
      begin
        Result.Add(
          TAppUtils.StrPadRight(LeftStr(lDetail.Item.Nama,29),29,' ') +' '
          + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lDetail.Harga),10,' ')
        );
      end
      else
      begin
        if lDetail.UOM = nil then
          raise Exception.Create('lDetail.UOM = nil');
        if lDetail.UOM.UOM = '' then
          lDetail.UOM.ReLoad(False);

        Result.Add(LeftStr(lDetail.Item.Nama,40));
        sTemp :=
              TAppUtils.StrPadLeftCut(FloatToStr(Abs(lDetail.Qty)),10,' ') + ' '
            + TAppUtils.StrPadRight(lDetail.UOM.UOM,5,' ') + 'x'
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',lDetail.Harga),10,' ')
            + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Abs(lDetail.Qty*lDetail.Harga)),13,' ');

        Result.Add(sTemp);
      end;

      if lDetail.Discount > 0 then
      begin
        Result.Add(
           TAppUtils.StrPadLeftCut(RightStr('Diskon ',20),20,' ')
          +TAppUtils.StrPadRight(' ',9,' ')
          +TAppUtils.StrPadRight(' (',3,' ')
          +TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Abs(lDetail.Qty* lDetail.Discount)),7,' ')
          +TAppUtils.StrPadRight(')',1,' ')
        );
      end

    end;




    sTemp := '';
    Result.Add(TAppUtils.StrPadRight('',40,'-'));


    Result.Add(TAppUtils.StrPadLeftCut('TOTAL RETUR:',27,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Ceil(ASalesRetur.Amount)),13,' '));



    Result.Add(TAppUtils.StrPadRight('',40,'-'));
    lSS.LoadFromFile(sReportPath + 'reports\' + FILE_FOOTER);
    Result.AddStrings(lSS);

    if TAppUtils.BacaRegistry('PrintToFile') = '1' then
    begin
      lFileName := StringReplace( ASalesRetur.Refno,'.','',[rfReplaceAll]);
      lFileName := StringReplace( lFileName,'/','',[rfReplaceAll]);
      lFileName := lFileName + '.txt';
  //    if Reprint then lFileName := ModTransaksi.TRANS_NO + '_R.txt';
      sDir := TAppUtils.GetAppPath + 'print\';
      if not DirectoryExists(sDir) then CreateDir(sDir);
      Result.SaveToFile(sDir + lFileName);
    end;
//    Result.Delete(iCetul);
  finally
    lSS.Free;
  end;
end;

class procedure TPrintStruk.Print(ASalesInv: TSalesInvoice);
var
  lSS: TStrings;
begin
  lSS := GenerateStruk(ASalesInv);
  Try
    PrintStrings(lSS);
  Finally
    lSS.Free;
  End;
end;

class procedure TPrintStruk.Print(ASalesRetur: TSalesRetur);
var
  lSS: TStrings;
begin
  lSS := GenerateStruk(ASalesRetur);
  Try
    PrintStrings(lSS);
  Finally
    lSS.Free;
  End;
end;

end.
