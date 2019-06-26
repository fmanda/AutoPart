unit uSettingFee;

interface

uses
  CRUDObject;

type
  TSettingFee = class(TCRUDObject)
  private
    FIsActive: Integer;
    FFee_1: Double;
    FFee_2: Double;
    FFee_3: Double;
    FNama: string;
    FMaxTempo_1: Integer;
    FMaxTempo_2: Integer;
    FMaxTempo_3: Integer;
  public
    constructor Create;
  published
    property IsActive: Integer read FIsActive write FIsActive;
    property Fee_1: Double read FFee_1 write FFee_1;
    property Fee_2: Double read FFee_2 write FFee_2;
    property Fee_3: Double read FFee_3 write FFee_3;
    property Nama: string read FNama write FNama;
    property MaxTempo_1: Integer read FMaxTempo_1 write FMaxTempo_1;
    property MaxTempo_2: Integer read FMaxTempo_2 write FMaxTempo_2;
    property MaxTempo_3: Integer read FMaxTempo_3 write FMaxTempo_3;
  end;

implementation

constructor TSettingFee.Create;
begin
  inherited;
  IsActive := 1;
end;

end.
