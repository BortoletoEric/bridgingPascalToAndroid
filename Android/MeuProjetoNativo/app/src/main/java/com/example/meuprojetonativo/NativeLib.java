package com.example.meuprojetonativo;

public class NativeLib {

    // Carrega a nossa biblioteca nativa ao iniciar a classe
    static {
        System.loadLibrary("soma"); // Note que o prefixo "lib" e o sufixo ".so" são omitidos
    }

    // Declaração da função nativa
    public native int soma(int a, int b);
}
