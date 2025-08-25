library meuprojetonativo;

//{$mode delphi}

uses
  // Unidades necessárias para JNI, geralmente parte do FPC
  SysUtils, Classes, jni;

var
  javaVM : PJavaVM = nil;

function getJstring(env: PJNIEnv; str : string): jstring;
begin
  Result:=  env^.NewStringUTF(env, PChar(str));
end;

function soma(env: PJNIEnv; obj: JObject; a: JInt; b: JInt): JInt; cdecl;
begin
  Result := a + b;
end;

function subtrai(env: PJNIEnv; obj: JObject; a: JInt; b: JInt): JInt; cdecl;
begin
  Result := a - b;
end;

function multiplica(env: PJNIEnv; obj: JObject; a: JInt; b: JInt): JInt; cdecl;
begin
  Result := a * b;
end;

function divide(env: PJNIEnv; obj: JObject; a: JDouble; b: JDouble): JDouble; cdecl;
begin
  Result := a / b;
end;

function hello(
  env: PJNIEnv; // Ponteiro para o ambiente JNI
  thiz: jobject // Referência ao objeto Java que chamou o método
): jstring; cdecl;// 'cdecl' é a convenção de chamada padrão

var
  str : string;
begin
  // A JNI tem funções para converter tipos Pascal/Nativos para tipos Java
  result := getJstring(env, 'hello world');
end;

function JNI_OnLoad(vm: PJavaVM; reserved: Pointer): jint; cdecl;
begin
  javaVM := vm;  // Salva o ponteiro do JavaVM globalmente
  Result := JNI_VERSION_1_6;  // Retorna a versão JNI
   SysLogWrite(DefaultSysLogPriority, 'jniLibs', 'JNI_OnLoad' );
end;


exports
  JNI_OnLoad,
  soma name 'Java_com_example_meuprojetonativo_NativeLib_soma',
  subtrai name 'Java_com_example_meuprojetonativo_NativeLib_subtrai',
  multiplica name 'Java_com_example_meuprojetonativo_NativeLib_multiplica',
  divide name 'Java_com_example_meuprojetonativo_NativeLib_divide';

begin
end.
