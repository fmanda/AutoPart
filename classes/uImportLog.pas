unit uImportLog;

interface

uses
  CRUDObject;

type
  TImportLog = class(TCRUDObject)
  private
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FNotes: String;
    FRefno: String;
  public
    class function IsFileImported(aFileName: String): Boolean;
    class function ConfirmImport(aFileName: String): Boolean;
    class procedure SaveLog(aFileName: String; aNotes: String = '');
  published
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property Notes: String read FNotes write FNotes;
    [AttributeOfCode]
    property Refno: String read FRefno write FRefno;
  end;

implementation

uses
  uDBUtils, uAppUtils, System.SysUtils;

class function TImportLog.IsFileImported(aFileName: String): Boolean;
var
  lImportLog: TImportLog;
begin
  Result := False;
  lImportLog := TImportLog.Create;
  Try
    Try
      if lImportLog.LoadByCode(ExtractFileName(aFileName)) then
        Result := True;
    except
    End;
  finally
    lImportLog.Free;
  End;
end;

class function TImportLog.ConfirmImport(aFileName: String): Boolean;
var
  lImportLog: TImportLog;
  S: string;
begin
  Result := True;

  lImportLog := TImportLog.Create;
  Try
    Try
      if lImportLog.LoadByCode(ExtractFileName(aFileName)) then
      begin
        S := 'Import File Pernah Dilakukan untuk File : ' + lImportLog.Refno;
        S := S + #13+ 'User Import : ' + lImportLog.ModifiedBy;
        S := S + #13+ 'Date Import : ' + DateTimeToStr(lImportLog.ModifiedDate);
        S := S + #13;
        S := S + #13+ 'Apakah Anda ingin mengulang Import File ini ?';

        Result := TAppUtils.Confirm(S);
      end;
    except
    End;
  finally
    lImportLog.Free;
  End;
end;

class procedure TImportLog.SaveLog(aFileName: String; aNotes: String = '');
var
  lImportLog: TImportLog;
begin
  lImportLog := TImportLog.Create;
  Try
    Try
      lImportLog.ModifiedBy := UserLogin;
      lImportLog.ModifiedDate := Now();
      lImportLog.Notes := aNotes;
      lImportLog.Refno := ExtractFileName(aFileName);
      lImportLog.SaveToDB(True);
    except
    End;
  Finally
    lImportLog.Free;
  End;
end;

end.
