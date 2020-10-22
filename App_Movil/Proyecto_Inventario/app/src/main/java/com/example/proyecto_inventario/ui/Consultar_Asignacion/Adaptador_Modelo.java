package com.example.proyecto_inventario.ui.Consultar_Asignacion;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;

import java.util.ArrayList;

public abstract class Adaptador_Modelo extends BaseAdapter {

    private ArrayList<?> datos;
    private int R_Layout_Idview;
    private Context contexto;

    public Adaptador_Modelo(ArrayList<?> datos, int r_Layout_Idview, Context contexto) {
        this.datos = datos;
        this.R_Layout_Idview = r_Layout_Idview;
        this.contexto = contexto;
    }
    @Override
    public int getCount() {
        return datos.size();
    }

    @Override
    public Object getItem(int i) {
        return datos.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        if(view == null){
            LayoutInflater vi = (LayoutInflater) contexto.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = vi.inflate(R_Layout_Idview,null);

        }
        onEntrada(datos.get(i),view);
        return view;
    }

    public abstract void onEntrada(Object data, View view);
}
