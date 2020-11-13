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
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.proyecto_inventario.BuildConfig;
import com.example.proyecto_inventario.R;
import com.example.proyecto_inventario.ui.Consultar_Asignacion.Clases.Asignacion;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class Lista_Consulta extends Fragment {

   ArrayList<Modelo_Items> datos = new ArrayList<Modelo_Items>();
   TextView txt_gerencia,txt_area,txt_responsable;
   ImageView imagen_portada;
   public int id_gerencia=0,id_area=0,id_personal=0;
   public String codigo;
   public ArrayList<Asignacion> lista_asignacion_consultada;

    public Lista_Consulta() {
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

        return inflater.inflate(R.layout.fragment_lista__consulta, container, false);

    }

    @Override
    public void onViewCreated(@NonNull final View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        txt_gerencia = view.findViewById(R.id.txt_gerencia);
        txt_area = view.findViewById(R.id.txt_area);
        txt_responsable = view.findViewById(R.id.txt_responsable);
        imagen_portada = view.findViewById(R.id.imagen_generada);
        final ListView lista = view.findViewById(R.id.lista_consulta);



        if(getArguments()!=null){
            id_gerencia = getArguments().getInt("id_gerencia");
            id_area = getArguments().getInt("id_area");
            id_personal = getArguments().getInt("id_personal");
            codigo = getArguments().getString("codigo");

            //consultar_asignacion(id_gerencia,id_area,id_personal);
        }

        new Thread(new Runnable() {
            @Override
            public void run() {
                lista_asignacion_consultada = consultar_asignacion(id_gerencia,id_area,id_personal,codigo);
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    @Override
                    public void run() {
                        txt_area.setText(lista_asignacion_consultada.get(0).getArea());
                        txt_gerencia.setText(lista_asignacion_consultada.get(0).getGerencia());
                        txt_responsable.setText(lista_asignacion_consultada.get(0).getPersonal());

                        for(int i=0 ; i<lista_asignacion_consultada.size();i++){

                            byte[] arr_byte = Base64.decode(lista_asignacion_consultada.get(0).getImagen_byte(),Base64.DEFAULT);
                            Bitmap bmp = BitmapFactory.decodeByteArray(arr_byte,0,arr_byte.length);
                            //imagen_portada.setImageBitmap(Bitmap.createScaledBitmap(bmp,200,200,false));
                            bmp = Bitmap.createScaledBitmap(bmp,100,100,false);
                            datos.add(new Modelo_Items(bmp,lista_asignacion_consultada.get(i).getCodigo(),lista_asignacion_consultada.get(i).getBien(),lista_asignacion_consultada.get(i).getPersonal()));

                            //datos.add(new Modelo_Items(R.drawable.silla_reclinable,"hola","hola","Hola"));
                            //Toast.makeText(getContext(),lista_asignacion_consultada.get(0).getPersonal(), Toast.LENGTH_SHORT).show();

                        }



                        lista.setAdapter(new Adaptador_Modelo(datos,R.layout.modelo_items,view.getContext()) {
                            @Override
                            public void onEntrada(Object data, View view) {
                                TextView codigo = view.findViewById(R.id.codigo_modelo);
                                codigo.setText(((Modelo_Items)data).getM_codigo());
                                TextView nombre = view.findViewById(R.id.nombre_modelo);
                                nombre.setText(((Modelo_Items)data).getM_nombre());
                                TextView color = view.findViewById(R.id.color_modelo);
                                color.setText(((Modelo_Items)data).getM_color());
                                ImageView imagen = view.findViewById(R.id.img_modelo);
                                imagen.setImageBitmap(((Modelo_Items)data).getM_idImagen());
                            }
                        });

                    }
                });
            }
        }).start();





        //datos.add(new Modelo_Items(R.drawable.silla_reclinable,"hola","hola","Hola"));




        lista.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                Bundle bundle = new Bundle();
                bundle.putString("id_codigo",((Modelo_Items)adapterView.getItemAtPosition(i)).getM_codigo());
                //Toast.makeText(getContext(), ((Modelo_Items)adapterView.getItemAtPosition(i)).getM_codigo(), Toast.LENGTH_SHORT).show();
                Navigation.findNavController(view).navigate(R.id.action_descripcion_bien,bundle);
            }
        });


    }

    private ArrayList<Asignacion> consultar_asignacion(int id_gerencia, int id_area, int id_personal, String codigo) {

        Asignacion asignacion;
        ArrayList<Asignacion> lista_asignacion = new ArrayList<Asignacion>();
        try {
            URL url = new URL("http://edinson2020-001-site1.btempurl.com/api/BienesRest?id_gerencia="+id_gerencia+"&id_area="+id_area+"&id_personal="+id_personal+"&codigo="+codigo);
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
                                }else {
                                    jsonReader.skipValue();
                                }
                            }
                            jsonReader.endObject();
                            lista_asignacion.add(asignacion);
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

        return lista_asignacion;
    }


}