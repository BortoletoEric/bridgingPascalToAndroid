package com.example.minhabibliotecajnanativa

import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import com.sun.jna.Pointer

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val btnJna = findViewById<Button?>(R.id.btnJna)
        val textView = findViewById<TextView?>(R.id.textView)
        var messagePointer: Pointer? = null

        btnJna?.setOnClickListener {
            try {
                // 1. Chama a função nativa através da interface
                messagePointer = NativeLib.INSTANCE.getMessageFromPascal()

                // 2. Converte o ponteiro para uma String Kotlin/Java
                // O segundo argumento é o encoding.
                val message = messagePointer.getString(0, "UTF-8")

                // 3. Usa a string
                Log.d("JNA_TEST", "Mensagem do Pascal: $message")
                // ... mostrar na UI, etc.
                textView?.text = message

            } catch (e: Exception) {
                Log.e("JNA_TEST", "Erro ao chamar a função nativa", e)
            } finally {
                // 4. ESSENCIAL: Libera a memória, não importa o que aconteça
                messagePointer?.let {
                    NativeLib.INSTANCE.freePascalMessage(it)
                    Log.d("JNA_TEST", "Memória do Pascal liberada.")
                }
            }
        }
    }
}