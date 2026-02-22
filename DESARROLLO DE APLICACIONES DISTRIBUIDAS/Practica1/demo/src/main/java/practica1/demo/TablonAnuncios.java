
package main.java.practica1.demo;

import java.util.List;

public class TablonAnuncios {
    List <Anuncio> anuncios;

    public TablonAnuncios(List<Anuncio> anuncios) {
        this.anuncios = anuncios;
    }

    public List<Anuncio> getAnuncios() {
        return anuncios;
    }

    public void setAnuncios(List<Anuncio> anuncios) {
        this.anuncios = anuncios;
    } 
        
}
