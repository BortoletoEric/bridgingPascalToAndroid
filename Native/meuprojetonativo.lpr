library meuprojetonativo;

//{$mode delphi}
//{$linklib log}

uses
  // Unidades necessárias para JNI, geralmente parte do FPC
  SysUtils, Classes, jni, ctypes;

var
  javaVM : PJavaVM = nil;

const
  ANDROID_LOG_INFO = 4; //Nível de log
  LOG_TAG = 'MeuProjetoNativo'; // Tag para os logs

  // Importa a função da biblioteca de log nativa do Android
  procedure __android_log_print(prio: cint; tag: PAnsiChar; fmt: PAnsiChar); cdecl; external 'log' name '__android_log_print';

  // Função auxiliar para facilitar o uso
  procedure LogToAndroid(tag, msg: string);
  begin
    __android_log_print(ANDROID_LOG_INFO, PAnsiChar(AnsiString(tag)), PAnsiChar(AnsiString(msg)));
  end;

function soma(env: PJNIEnv; obj: JObject; a: JInt; b: JInt): JInt; cdecl;
begin
  Result := a + b;
  // Adiciona o log da operação
  LogToAndroid(LOG_TAG, Format('Função SOMA: %d + %d = %d', [a, b, Result]));
end;

function subtrai(env: PJNIEnv; obj: JObject; a: JInt; b: JInt): JInt; cdecl;
begin
  Result := a - b;
  // Adiciona o log da operação
  LogToAndroid(LOG_TAG, Format('Função SUBTRAI: %d - %d = %d', [a, b, Result]));
end;

function multiplica(env: PJNIEnv; obj: JObject; a: JInt; b: JInt): JInt; cdecl;
begin
  Result := a * b;
  // Adiciona o log da operação
  LogToAndroid(LOG_TAG, Format('Função MULTIPLICA: %d * %d = %d', [a, b, Result]));
end;

function divide(env: PJNIEnv; obj: JObject; a: JDouble; b: JDouble): JDouble; cdecl;
begin
  Result := a / b;
  // Adiciona o log da operação. Usamos %f para números de ponto flutuante (Double).
  LogToAndroid(LOG_TAG, Format('Função DIVIDE: %f / %f = %f', [a, b, Result]));
end;

function JNI_OnLoad(vm: PJavaVM; reserved: Pointer): jint; cdecl;
begin
  javaVM := vm;  // Salva o ponteiro do JavaVM globalmente
  Result := JNI_VERSION_1_6;  // Retorna a versão JNI
  // Log de inicialização da biblioteca
  LogToAndroid(LOG_TAG, 'JNI_OnLoad executado com sucesso.');
end;

exports
  JNI_OnLoad,
  soma name 'Java_com_example_meuprojetonativo_NativeLib_soma',
  subtrai name 'Java_com_example_meuprojetonativo_NativeLib_subtrai',
  multiplica name 'Java_com_example_meuprojetonativo_NativeLib_multiplica',
  divide name 'Java_com_example_meuprojetonativo_NativeLib_divide';

begin
end.
