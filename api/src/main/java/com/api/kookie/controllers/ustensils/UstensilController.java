package com.api.kookie.controllers.ustensils;

import com.api.kookie.core.ustensil.UstensilService;
import com.api.kookie.data.entity.Ustensil.Ustensil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(produces = "application/json; charset=utf-8")
public class UstensilController {


    @Autowired
    UstensilService ustensilService;


    @GetMapping("/ustensils/all")

    public List<Ustensil> liste_recette() {
        return ustensilService.getAllUstensil();
    }


}
