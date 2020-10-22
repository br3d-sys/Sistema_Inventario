package com.example.proyecto_inventario.ui.Consultar_Asignacion;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.UiThread;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.navigation.Navigation;

import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.JsonReader;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.Toast;

import com.example.proyecto_inventario.R;
import com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases.Area;
import com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases.Gerencia;
import com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases.Personal;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class Consultar_Asignacion extends Fragment {
    Button btnbuscar;
    AutoCompleteTextView gerencias,areas,personal;

    public ArrayList<Gerencia> lista_ger ;
    public ArrayList<Area> lista_ar;
    public ArrayList<Personal> lista_per;

    int idg=0, ida=0, idp=0;

    public Consultar_Asignacion() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_consultar__asignacion, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        btnbuscar = view.findViewById(R.id.btn_buscar);
        gerencias = view.findViewById(R.id.lista_gerencia);
        areas = view.findViewById(R.id.lista_area);
        personal = view.findViewById(R.id.lista_personal);

                new Thread(new Runnable() {
                    @Override
                    public void run() {

                        final ArrayList<Gerencia> lista_gerencia = extraer_gerencia();
                        Log.d("array",lista_gerencia.get(0).getNombre());

                        lista_ger = lista_gerencia;

                        final ArrayList<String> lista_gerencia_nombre = new ArrayList<String>();
                        for (int i = 0; i<lista_gerencia.size(); i++){
                            lista_gerencia_nombre.add(lista_gerencia.get(i).getNombre());
                        }

                        new Handler(Looper.getMainLooper()).post(new Runnable() {
                            @Override
                            public void run() {
                                ArrayAdapter<String> arr = new ArrayAdapter<String>(getContext(),R.layout.list_item,lista_gerencia_nombre);
                                gerencias.setAdapter(arr);
                            }
                        });



                    }
                }).start();

        gerencias.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                for (int n = 0; n<lista_ger.size(); n++){
                    if(lista_ger.get(n).getNombre() == adapterView.getItemAtPosition(i).toString()){
                        final int id_ger = lista_ger.get(n).getId_gerencia();

                        idg = id_ger;

                        Toast.makeText(getContext(), "item " + id_ger, Toast.LENGTH_SHORT).show();

                        new Thread(new Runnable() {
                            @Override
                            public void run() {

                                final ArrayList<Area> lista_area = extraer_area(id_ger);
                                Log.d("array",lista_area.get(0).getNombre());

                                lista_ar = lista_area;

                                final ArrayList<String> lista_area_nombre = new ArrayList<String>();
                                for (int i = 0; i<lista_area.size(); i++){
                                    lista_area_nombre.add(lista_area.get(i).getNombre());
                                }

                                new Handler(Looper.getMainLooper()).post(new Runnable() {
                                    @Override
                                    public void run() {
                                        ArrayAdapter<String> arr = new ArrayAdapter<String>(getContext(),R.layout.list_item,lista_area_nombre);
                                        areas.setAdapter(arr);
                                    }
                                });



                            }
                        }).start();

                    }
                }


            }
        });

        areas.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                for (int n = 0; n<lista_ar.size(); n++){
                    if(lista_ar.get(n).getNombre() == adapterView.getItemAtPosition(i).toString()){
                        final int id_ar = lista_ar.get(n).getId_area();

                        ida = id_ar;

                        Toast.makeText(getContext(), "item " + id_ar, Toast.LENGTH_SHORT).show();

                        new Thread(new Runnable() {
                            @Override
                            public void run() {

                                final ArrayList<Personal> lista_personal = extraer_personal(id_ar);
                                Log.d("array",lista_personal.get(0).getNombre());

                                lista_per = lista_personal;

                                final ArrayList<String> lista_personal_nombre = new ArrayList<String>();
                                for (int i = 0; i<lista_personal.size(); i++){
                                    lista_personal_nombre.add(lista_personal.get(i).getNombre());
                                }

                                new Handler(Looper.getMainLooper()).post(new Runnable() {
                                    @Override
                                    public void run() {
                                        ArrayAdapter<String> arr = new ArrayAdapter<String>(getContext(),R.layout.list_item,lista_personal_nombre);

                                        personal.setAdapter(arr);
                                    }
                                });



                            }
                        }).start();

                    }
                }
            }
        });

        personal.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                for (int n = 0; n<lista_per.size(); n++) {
                    if (lista_per.get(n).getNombre() == adapterView.getItemAtPosition(i).toString()) {
                        final int id_per = lista_per.get(n).getId_personal();

                        idp = id_per;

                        Toast.makeText(getContext(), "item " + id_per, Toast.LENGTH_SHORT).show();
                    }
                }

            }
        });


        btnbuscar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Bundle enviar_datos = new Bundle();
                enviar_datos.putInt("id_gerencia", idg);
                enviar_datos.putInt("id_area", ida);
                enviar_datos.putInt("id_personal", idp);

                Navigation.findNavController(view).navigate(R.id.action_lista_consulta,enviar_datos);

            }
        });

        /*String[] items = {"a","b","c","d"};

        ArrayAdapter<String> arr = new ArrayAdapter<String>(view.getContext(),R.layout.list_item,lista_gerencia);
        gerencias.setAdapter(arr);*/

    }

    private ArrayList<Gerencia> extraer_gerencia() {

        Gerencia ger;
        ArrayList<Gerencia> arr = new ArrayList<Gerencia>();

                try {
                    URL url = new URL("http://10.0.2.2/api-rest/Acceso_Rest/Gerencia.php");
                    HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

                    if(urlConnection.getResponseCode() == 200){
                        InputStream resp = urlConnection.getInputStream();
                        InputStreamReader reader = new InputStreamReader(resp,"UTF-8");

                        JsonReader jsonReader = new JsonReader(reader);
                        //Log.d("problem" , jsonReader.toString());
                        jsonReader.beginArray();
                        while(jsonReader.hasNext()){
                            jsonReader.beginObject();
                                ger = new Gerencia();
                                while (jsonReader.hasNext()){
                                    //Log.d("arr",jsonReader.toString());
                                    String val = jsonReader.nextName();
                                    if(val.equals("id_gerencia")) {
                                        ger.setId_gerencia(jsonReader.nextInt());
                                        //Log.d("valor",jsonReader.nextString());
                                        //arr.add(jsonReader.nextString());
                                    }else if(val.equals("nombre")){
                                        ger.setNombre(jsonReader.nextString());
                                    }else {
                                        jsonReader.skipValue();
                                    }
                                }
                                arr.add(ger);
                                jsonReader.endObject();
                            //arr = Optener_Elementos(jsonReader);


                        }
                        jsonReader.endArray();
                        jsonReader.close();
                        urlConnection.disconnect();
                    }

                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }


        return arr;
    }

    private ArrayList<Area> extraer_area(int id_gerencia){

        Area area;
        ArrayList<Area> arr = new ArrayList<Area>();

        try {
            URL url = new URL("http://10.0.2.2/api-rest/Acceso_Rest/Area.php?id_g="+id_gerencia);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

            if(urlConnection.getResponseCode() == 200){
                InputStream resp = urlConnection.getInputStream();
                InputStreamReader reader = new InputStreamReader(resp,"UTF-8");

                JsonReader jsonReader = new JsonReader(reader);
                //Log.d("problem" , jsonReader.toString());
                jsonReader.beginArray();
                while(jsonReader.hasNext()){
                    jsonReader.beginObject();
                    area = new Area();
                    while (jsonReader.hasNext()){
                        //Log.d("arr",jsonReader.toString());
                        String val = jsonReader.nextName();
                        if(val.equals("id_area")) {
                            area.setId_area(jsonReader.nextInt());
                            //Log.d("valor",jsonReader.nextString());
                            //arr.add(jsonReader.nextString());
                        }else if(val.equals("nombre")){
                            area.setNombre(jsonReader.nextString());
                        }else {
                            jsonReader.skipValue();
                        }
                    }
                    arr.add(area);
                    jsonReader.endObject();
                    //arr = Optener_Elementos(jsonReader);


                }
                jsonReader.endArray();
                jsonReader.close();
                urlConnection.disconnect();
            }

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return arr;
    }

    private ArrayList<Personal> extraer_personal(int id_area){
        Personal personal;
        ArrayList<Personal> arr = new ArrayList<Personal>();

        try {
            URL url = new URL("http://10.0.2.2/api-rest/Acceso_Rest/Personal.php?id_a="+id_area);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

            if(urlConnection.getResponseCode() == 200){
                InputStream resp = urlConnection.getInputStream();
                InputStreamReader reader = new InputStreamReader(resp,"UTF-8");

                JsonReader jsonReader = new JsonReader(reader);
                //Log.d("problem" , jsonReader.toString());
                jsonReader.beginArray();
                while(jsonReader.hasNext()){
                    jsonReader.beginObject();
                    personal = new Personal();
                    while (jsonReader.hasNext()){
                        //Log.d("arr",jsonReader.toString());
                        String val = jsonReader.nextName();
                        if(val.equals("id_personal")) {
                            personal.setId_personal(jsonReader.nextInt());
                            //Log.d("valor",jsonReader.nextString());
                            //arr.add(jsonReader.nextString());
                        }else if(val.equals("nombre")){
                            personal.setNombre(jsonReader.nextString());
                        }else {
                            jsonReader.skipValue();
                        }
                    }
                    arr.add(personal);
                    jsonReader.endObject();
                    //arr = Optener_Elementos(jsonReader);


                }
                jsonReader.endArray();
                jsonReader.close();
                urlConnection.disconnect();
            }

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return arr;
    }

}

