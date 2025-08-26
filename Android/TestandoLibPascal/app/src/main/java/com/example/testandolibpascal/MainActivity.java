package com.example.testandolibpascal;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

import com.example.meuprojetonativo.NativeLib;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        Button btnSoma = findViewById(R.id.btnSoma);
        Button btnSubtrai = findViewById(R.id.btnSubtrai);
        Button btnMultiplica = findViewById(R.id.btnMultiplica);
        Button btnDivide = findViewById(R.id.btnDivide);

        EditText txtPrimeiroNumero = findViewById(R.id.editTextPrimeiroNumero);
        EditText txtSegundoNumero = findViewById(R.id.editTextSegundoNumero);
        TextView txtResultado = findViewById(R.id.text_view_resultado);

        NativeLib nativeLib = new NativeLib();

        // Chama a função Pascal como se fosse uma função Java normal!
        btnSoma.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    txtResultado.setText(String.valueOf(nativeLib.soma(Integer.parseInt(txtPrimeiroNumero.getText().toString()), Integer.parseInt(txtSegundoNumero.getText().toString()))));
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        });

        btnSubtrai.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    txtResultado.setText(String.valueOf(nativeLib.subtrai(Integer.parseInt(txtPrimeiroNumero.getText().toString()), Integer.parseInt(txtSegundoNumero.getText().toString()))));
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        });

        btnMultiplica.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    txtResultado.setText(String.valueOf(nativeLib.multiplica(Integer.parseInt(txtPrimeiroNumero.getText().toString()), Integer.parseInt(txtSegundoNumero.getText().toString()))));
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        });

        btnDivide.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    txtResultado.setText(String.valueOf(nativeLib.divide(Double.parseDouble(txtPrimeiroNumero.getText().toString()), Double.parseDouble(txtSegundoNumero.getText().toString()))));
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        });
    }
}