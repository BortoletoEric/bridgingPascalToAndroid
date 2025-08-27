package com.example.minhabibliotecajnanativa

import com.sun.jna.Library
import com.sun.jna.Native
import com.sun.jna.Pointer

interface NativeLib: Library {

    // Declara funções que correspondem EXATAMENTE aos nomes exportados no Pascal
    fun getMessageFromPascal(): Pointer // Mapea PChar para Pointer para segurança
    fun freePascalMessage(ptr: Pointer)

    // Companio object ára carregar a biblioteca de forma fácil
    // 3. Companion object para carregar a biblioteca de forma fácil
    companion object {
        // JNA carrega a biblioteca e cria uma implementação da interface para nós.
        val INSTANCE: NativeLib by lazy {
            Native.load("meuprojetojnanativo", NativeLib::class.java)
        }
    }
}