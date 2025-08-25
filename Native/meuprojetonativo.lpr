library meuprojetonativo;

//{$mode delphi}

uses
  // Unidades necessárias para JNI, geralmente parte do FPC
  jni;

var
  javaVM : PJavaVM = nil;

function getJstring(env: PJNIEnv; str : string): jstring;
begin
  Result:=  env^.NewStringUTF(env, PChar(str));
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
  hello name 'Java_com_example_meuprojetonativo_MainActivity_getMensagemDoPascal';

begin
end.
