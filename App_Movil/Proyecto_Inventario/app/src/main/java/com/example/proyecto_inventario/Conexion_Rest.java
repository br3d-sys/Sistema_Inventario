package com.example.proyecto_inventario;

import android.util.JsonReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class Conexion_Rest implements Runnable {

    public String resp;
    private URL url_conexion;
    private String url;


    public Conexion_Rest(String url){
        this.url = url;
        //try {
            //url_conexion = new URL(url);
        //} catch (MalformedURLException e) {
            //e.printStackTrace();
        //}
    }

    @Override
    public void run() {
        resp = "hola";
        try {
            url_conexion = new URL(url);
            HttpURLConnection myconnection = (HttpURLConnection) url_conexion.openConnection();

            if(myconnection.getResponseCode() == 200){

                InputStream response = myconnection.getInputStream();
                InputStreamReader reader = new InputStreamReader(response,"UTF-8");
                JsonReader jr = new JsonReader(reader);
                jr.beginObject();
                while(jr.hasNext()){

                    String key = jr.nextName();
                    if(key.equals("respuesta")){
                        String value = jr.nextString();

                        break;
                    }else{
                        jr.skipValue();
                    }
                }

                jr.close();
                myconnection.disconnect();
            }else{

            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
