package com.example.proyecto_inventario.ui.Consultar_Asignacion;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.navigation.Navigation;

import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.JsonReader;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.proyecto_inventario.R;
import com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases.Asignacion;
import com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases.Gerencia;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class Descripcion_Bien extends Fragment {

    public String codigo="";
    public ArrayList<Asignacion> bien;
    TextView nom_codigo, nom_gerencia, nom_area, nom_personal, nom_nombre, nom_marca, nom_modelo, nom_categoria,nom_color,nom_serie,nom_estado;
    ImageView imagen;

    public Descripcion_Bien() {
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
        return inflater.inflate(R.layout.fragment_descripcion__bien, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);


        nom_codigo = view.findViewById(R.id.txt_nom_codigo);
        nom_gerencia = view.findViewById(R.id.txt_nom_gerencia);
        nom_area = view.findViewById(R.id.txt_nom_area);
        nom_personal = view.findViewById(R.id.txt_nom_responsable);

        nom_nombre = view.findViewById(R.id.txt_nom_bien);
        nom_marca = view.findViewById(R.id.txt_nom_marca);
        nom_modelo = view.findViewById(R.id.txt_nom_modelo);
        nom_categoria = view.findViewById(R.id.txt_nom_categoria);
        nom_color = view.findViewById(R.id.txt_nom_color);
        nom_serie = view.findViewById(R.id.txt_nom_serie);
        nom_estado = view.findViewById(R.id.txt_nom_estado);

        imagen = view.findViewById(R.id.mostrar_imagen_bien);


        if(getArguments()!=null){
            codigo = getArguments().getString("id_codigo");

            new Thread(new Runnable() {
                @Override
                public void run() {
                    bien = consultar_bien(codigo);
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                            nom_codigo.setText(bien.get(0).getCodigo());
                            nom_gerencia.setText(bien.get(0).getGerencia());
                            nom_area.setText(bien.get(0).getArea());
                            nom_personal.setText(bien.get(0).getPersonal());
                            nom_nombre.setText(bien.get(0).getBien());
                            nom_marca.setText(bien.get(0).getMarca());
                            nom_modelo.setText(bien.get(0).getBien());
                            nom_categoria.setText(bien.get(0).getCategoria());
                            nom_color.setText(bien.get(0).getBien());
                            nom_serie.setText(bien.get(0).getSerie());
                            nom_estado.setText(bien.get(0).getEstado());
                            byte[] arr_byte = Base64.decode(bien.get(0).getImagen_byte(),Base64.DEFAULT);
                            Bitmap bmp = BitmapFactory.decodeByteArray(arr_byte,0,arr_byte.length);
                            imagen.setImageBitmap(Bitmap.createScaledBitmap(bmp,300,300,false));
                        }
                    });
                }
            }).start();

        }

        Button btn_actualizar = view.findViewById(R.id.btn_actualizar_estado);

        btn_actualizar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Navigation.findNavController(view).navigate(R.id.action_actualizar_estado);
            }
        });

        Toast.makeText(view.getContext(), codigo, Toast.LENGTH_SHORT).show();



    }

    private ArrayList<Asignacion> consultar_bien(String codigo) {

        Asignacion asignacion;
        ArrayList<Asignacion> lista_Bien = new ArrayList<Asignacion>();
        try {
            URL url = new URL("http://edinson2020-001-site1.btempurl.com/api/BienesRest?id_gerencia=&id_area=&id_personal=&codigo="+codigo);
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

            if(httpURLConnection.getResponseCode() == 200){
                InputStream inputStream = httpURLConnection.getInputStream();
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream,"UTF-8");

                JsonReader jsonReader = new JsonReader(inputStreamReader);
                jsonReader.beginObject();
                while (jsonReader.hasNext()){
                    String nombre1 = jsonReader.nextName();
                    if(nombre1.equals("encontrado")){
                        jsonReader.beginArray();
                        while (jsonReader.hasNext()){
                            jsonReader.beginObject();
                            asignacion = new Asignacion();
                            while(jsonReader.hasNext()){
                                String nombre = jsonReader.nextName();
                                if(nombre.equals("Id_encontrado")){
                                    asignacion.setId_encontrado(jsonReader.nextInt());
                                }else if(nombre.equals("Id_bienes")){
                                    asignacion.setId_bienes(jsonReader.nextInt());
                                }else if(nombre.equals("Bien")){
                                    asignacion.setBien(jsonReader.nextString());
                                }else if(nombre.equals("Id_inventario")){
                                    asignacion.setId_inventario(jsonReader.nextInt());
                                }else if(nombre.equals("Inventario")){
                                    asignacion.setInventario(jsonReader.nextString());
                                }else if(nombre.equals("Fecha")){
                                    asignacion.setFecha(jsonReader.nextString());
                                }else if(nombre.equals("Estado")){
                                    asignacion.setEstado(jsonReader.nextString());
                                }else if(nombre.equals("Categoria")){
                                    asignacion.setCategoria(jsonReader.nextString());
                                }else if(nombre.equals("Codigo")){
                                    asignacion.setCodigo(jsonReader.nextString());
                                }else if(nombre.equals("Imagen_byte")){
                                    asignacion.setImagen_byte(jsonReader.nextString());
                                }else if(nombre.equals("Detalle_estado")){
                                    asignacion.setDetalle_estado(jsonReader.nextString());
                                }else if(nombre.equals("Id_personal")){
                                    asignacion.setId_personal(jsonReader.nextInt());
                                }else if(nombre.equals("Personal")){
                                    asignacion.setPersonal(jsonReader.nextString());
                                }else if(nombre.equals("Id_area")){
                                    asignacion.setId_area(jsonReader.nextInt());
                                }else if(nombre.equals("Area")){
                                    asignacion.setArea(jsonReader.nextString());
                                }else if(nombre.equals("Id_gerencia")){
                                    asignacion.setId_gerencia(jsonReader.nextInt());
                                }else if(nombre.equals("Gerencia")){
                                    asignacion.setGerencia(jsonReader.nextString());
                                }else if(nombre.equals("Marca")){
                                    asignacion.setMarca(jsonReader.nextString());
                                }else if(nombre.equals("Modelo")){
                                    asignacion.setModelo(jsonReader.nextString());
                                }else if(nombre.equals("Color")){
                                    asignacion.setColor(jsonReader.nextString());
                                }else if(nombre.equals("Serie")){
                                    asignacion.setSerie(jsonReader.nextString());
                                }else {
                                    jsonReader.skipValue();
                                }
                            }
                            jsonReader.endObject();
                            lista_Bien.add(asignacion);
                        }
                    }
                    jsonReader.endArray();
                }
                jsonReader.endObject();
                jsonReader.close();

            }
            httpURLConnection.disconnect();

        } catch (MalformedURLException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return lista_Bien;
    }
}