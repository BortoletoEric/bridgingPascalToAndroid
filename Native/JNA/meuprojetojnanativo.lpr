library meuprojetojnanativo;

uses
  SysUtils;

// Função 1: Cria e retorna uma mensagem.
// Retorna um ponteiro para a string (PChar).
function getMessageFromPascal(): PChar; cdecl;
var
  S: AnsiString;
begin
  S := Format('Olá do Pascal via JNA! Compilado em %s', [DateTimeToStr(Now)]);
  // StrNew cria uma cópia da string na memória que persistirá após a função retornar.
  // O chamador (JNA) será responsável por liberar essa memória.
  Result := StrNew(PAnsiChar(S));
end;

// Função 2: Libera a memória alocada pela função acima.
// Recebe o ponteiro que foi retornado por getMessageFromPascal.
procedure freePascalMessage(ptr: PChar); cdecl;
begin
  if ptr <> nil then
    StrDispose(ptr);
end;

exports
  getMessageFromPascal,
  freePascalMessage;

begin
end.
