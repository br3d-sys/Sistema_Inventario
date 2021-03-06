package com.example.proyecto_inventario;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.JsonReader;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.material.textfield.TextInputEditText;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MainActivity extends AppCompatActivity {
    TextInputEditText txt_usuario,txt_contrasena;
    Button iniciar;
    public String cr,usuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        iniciar = findViewById(R.id.btn_iniciarsesion);
        txt_usuario = findViewById(R.id.txt_usuario);
        txt_contrasena = findViewById(R.id.txt_contrasena);

        iniciar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                usuario = "correo="+txt_usuario.getText()+"&contrasena="+txt_contrasena.getText();
                //Toast.makeText(MainActivity.this, "texto " + txt_usuario.getText(), Toast.LENGTH_SHORT).show();

               new Thread(
                        new Runnable() {
                    @Override
                    public void run() {
                        //cr="hola";
                        try {

                            URL url_conexion = new URL("http://edinson2020-001-site1.btempurl.com/api/UsuarioRest");
                            HttpURLConnection myconnection = (HttpURLConnection) url_conexion.openConnection();
                            myconnection.setRequestMethod("POST");
                            myconnection.setDoOutput(true);
                            myconnection.getOutputStream().write(usuario.getBytes());
                            //myconnection.getOutputStream().write(contrasena.getBytes());

                            if(myconnection.getResponseCode() == 200){
                                InputStream response = myconnection.getInputStream();
                                InputStreamReader reader = new InputStreamReader(response,"UTF-8");
                                JsonReader jr = new JsonReader(reader);
                                jr.beginObject();

                                while(jr.hasNext()){

                                    String key = jr.nextName();
                                    if(key.equals("success")){
                                        Boolean value = jr.nextBoolean();
                                        //Log.d("entrada",value);
                                        //cr=value;
                                        if(value==true){
                                            cambiar();
                                        }

                                        break;
                                    }else{
                                        jr.skipValue();
                                    }
                                }

                                jr.close();
                                myconnection.disconnect();
                            }else{
                                Toast.makeText(MainActivity.this, "No se pudo conectar al servidor", Toast.LENGTH_SHORT).show();
                            }

                        } catch (IOException e) {
                            e.printStackTrace();
                            Log.i("error",e.getMessage());
                        }
                    }
                }).start();

            }



        });


    }
    public void cambiar(){
        Intent i = new Intent(MainActivity.this,Menu_Principal.class);
        startActivity(i);
        //Toast.makeText(MainActivity.this, cr, Toast.LENGTH_SHORT).show();
    }
}