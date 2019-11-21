unit ufrmDeleteEOD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons,
  cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, System.DateUtils;

type
  TfrmDeleteEndOfDay = class(TfrmDefaultInput)
    dtEOD: TcxDateEdit;
    cxLabel8: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure InitState;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeleteEndOfDay: TfrmDeleteEndOfDay;

implementation

uses
  uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmDeleteEndOfDay.btnSaveClick(Sender: TObject);
var
  SS: TStrings;
begin
  inherited;
  if DateOf(dtEOD.Date) = DateOf(EndOfTheYear(dtEOD.Date)) then
  begin
    TAppUtils.Warning('EOD Akhir tahun tidak bisa dihapus');
    exit;
  end;

  if not TAppUtils.Confirm('Apakah Anda yakin menghapus Tanggal EOD ini?') then
    exit;

  SS := TStringList.Create;
  Try
    SS.Append('delete b from TCASHOPNAME a inner join TCASHOPNAMEITEM b on a.id = b.CASHOPNAME_ID where a.TRANSDATE = ' + TDBUtils.QuotD(dtEOD.Date));
    SS.Append('delete from TCASHOPNAME where TRANSDATE = ' + TDBUtils.QuotD(dtEOD.Date) );
    SS.Append('delete from TENDOFDAY where TRANSDATE = ' + TDBUtils.QuotD(dtEOD.Date));

    if TDBUtils.ExecuteSQL(SS) then
    begin
      TAppUtils.Information('Berhasil Hapus Tanggal EOD');
      InitState;
    end;
  Finally
    FreeAndNil(SS);
  End;

end;

procedure TfrmDeleteEndOfDay.FormCreate(Sender: TObject);
begin
  inherited;
  InitState;
end;

procedure TfrmDeleteEndOfDay.InitState;
var
  s: string;
begin
  dtEOD.Date := 0;


  s := 'SELECT MAX(TRANSDATE) FROM TENDOFDAY';
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        dtEOD.Date := Fields[0].AsDateTime;
    Finally
      Free;
    End;
  end;
end;

end.
