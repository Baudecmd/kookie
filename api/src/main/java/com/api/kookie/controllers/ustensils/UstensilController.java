package com.api.kookie.controllers.ustensils;

import com.api.kookie.controllers.security.JwtUtils;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.recette.RecetteService;
import com.api.kookie.core.ustensil.UstensilService;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.User;
import com.api.kookie.data.entity.Ustensil.Ustensil;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(headers = "charset=UTF-8")
public class UstensilController {


    @Autowired
    UstensilService ustensilService;


    @GetMapping("/ustensils/all")
    public List<Ustensil> liste_recette() {
        return (List<Ustensil>) ustensilService.getAllUstensil();
    }



}
