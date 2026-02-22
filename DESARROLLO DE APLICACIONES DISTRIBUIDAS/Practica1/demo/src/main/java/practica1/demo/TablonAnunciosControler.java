package main.java.practica1.demo; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@RequestMapping("/inicio")
public class TablonAnunciosControler {
    @GetMapping("/")
    public TablonAnuncios getAnuncios(){
        return anuncios; 
    }
    
    @PostMapping
    public ResponseEntity <Anuncio> crearAnuncio(@RequestBody Anuncio anuncio) {
        return new ResponseEntity.ok(anuncio);
    }

}
