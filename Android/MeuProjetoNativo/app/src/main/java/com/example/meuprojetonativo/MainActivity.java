package com.example.meuprojetonativo;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    // Carrega a biblioteca .so na memória.
    // Note que o nome é "meuprojetonativo", sem o "lib" e o ".so".
    static {
        try {
            System.loadLibrary("meuprojetonativo");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    // Declaração do método nativo que corresponde à função em Pascal.
    public native String getMensagemDoPascal();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        Button button = findViewById(R.id.button);
        // Chama a função Pascal como se fosse um método Java normal!
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                button.setText(getMensagemDoPascal());
            }
        });
    }
}