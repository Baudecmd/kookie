package com.api.kookie.controllers.recette;

import com.api.kookie.controllers.ingredient.IngredientController;
import com.api.kookie.controllers.security.JwtUtils;
import com.api.kookie.core.dto.IngredientDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.recette.RecetteService;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.User;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RecetteController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecetteController.class);

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

    @GetMapping("/recette/thumbnail/all")
    public ResponseEntity<?> getAllRecettesThumbnails(@RequestParam Integer profileId) {
        LOGGER.debug("[RecetteController, getAllRecettesThumbnails] profileId = " + profileId);

        List<RecetteThumbnailDTO> recettes = recetteService.getAllRecettesThumbnails(profileId);

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(recettes);

    }

    @GetMapping("/recette_search")
    public List<RecetteDTO> recette_search() {
        return recetteService.searchByString("test");
    }




}
