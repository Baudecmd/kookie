package com.api.kookie.controllers.recette;

import com.api.kookie.controllers.security.JwtUtils;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.recette.RecetteService;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.User;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RecetteController {

    @Autowired
    RecetteRepository recetteRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RecetteService recetteService;


    @GetMapping("/recettes")
    public List<Recette> liste_recette() {
        return (List<Recette>) recetteRepository.findAll();
    }

    @PostMapping("/recette/add")
    public Map<String, String> ajout_recette(@RequestBody Map<String, String> arg) {
        HashMap<String, String> map = new HashMap<>();

        String jwt = arg.get("jwt");
        String nom_recette = arg.get("nom_recette");
        int id_utilisateur = JwtUtils.getIdFromToken(jwt);
        User u = userRepository.findById(Long.valueOf(id_utilisateur)).get();
        if (u != null) {
            Recette recette = new Recette(u, nom_recette);
            recetteRepository.save(recette);
            map.put("ok", "ok");

        } else {
            map.put("erreur_lib", "problème d'auth veuillez vous reconnecter");

        }
        return map;
    }

    @GetMapping("/recette_search")
    public List<RecetteDTO> recette_search() {
        return recetteService.searchByString("test");
    }




}
