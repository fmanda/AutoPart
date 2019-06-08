unit uUOM;

interface

uses
  CRUDObject;

type
  TUOM = class(TCRUDObject)
  private
    FUOM: String;
    FDeskripsi: String;
  published
    [AttributeOfCode]
    property UOM: String read FUOM write FUOM;
    property Deskripsi: String read FDeskripsi write FDeskripsi;
  end;

implementation

end.
