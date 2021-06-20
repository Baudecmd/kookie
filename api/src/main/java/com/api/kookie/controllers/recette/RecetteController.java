package com.api.kookie.controllers.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.recette.RecetteService;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recipe.RecipeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "recette", produces = "application/json; charset=utf-8")
public class RecetteController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecetteController.class);

    @Autowired
    RecipeRepository recipeRepository;
    @Autowired
    ProfileRepository profileRepository;
    @Autowired
    RecetteService recetteService;

    @GetMapping("/all")
    public ResponseEntity<List<RecetteDTO>> getAllRecipes(Integer profileId) {
        LOGGER.debug("[RecetteController, getAllRecipes] profileId = " + profileId);

        return ResponseEntity.status(HttpStatus.OK).body(recetteService.getAllRecipes(profileId));
    }

    @GetMapping("/one")
    public ResponseEntity<?> getOneByRecipeId(@RequestParam Integer profileId, @RequestParam Integer recipeId) {
        LOGGER.debug("[RecetteController, getOneByRecipeId] profileId = " + profileId + "recipeId = " + recipeId);

        RecetteDTO recipe = recetteService.getOneById(profileId, recipeId);

        return ResponseEntity.status(HttpStatus.OK).body(recipe);

    }

    @PostMapping("/create")
    public ResponseEntity<RecetteDTO> createRecipe(@RequestBody RecetteDTO recipe) {
        LOGGER.debug("[RecetteController, createRecipe] recipe = " + recipe.toString());

        RecetteDTO recipeDTO = recetteService.createRecipe(recipe);

        return ResponseEntity.status(HttpStatus.CREATED).body(recipeDTO);
    }

    @GetMapping("/thumbnail/all")
    public ResponseEntity<?> getAllRecettesThumbnails(@RequestParam Integer profileId) {
        LOGGER.debug("[RecetteController, getAllRecettesThumbnails] profileId = " + profileId);

        List<RecetteThumbnailDTO> recettes = recetteService.getAllRecipesThumbnails(profileId);

        return ResponseEntity.status(HttpStatus.OK).body(recettes);

    }

    @GetMapping("/thumbnail/byCategory")
    public ResponseEntity<?> getAllRecettesThumbnailsByCategoryId(@RequestParam Integer categoryId, @RequestParam Integer profileId) {
        LOGGER.debug("[RecetteController, getAllRecettesThumbnailsByCategoryId] categoryId = " + categoryId + " profileId = " + profileId);

        List<RecetteThumbnailDTO> recettes = recetteService.getAllRecipesThumbnailsByCategoryId(categoryId, profileId);

        return ResponseEntity.status(HttpStatus.OK).body(recettes);

    }

    @GetMapping("/search")
    public List<RecetteDTO> recette_search() {
        return recetteService.searchByString("test");
    }

    /*@GetMapping("/search/category/{categoryID}")
    public List<RecetteDTO> recetteSearchByCategory(@PathVariable("categoryID") Integer categoryID){
        System.out.println(categoryID);
        return recetteService.searchByCategory(categoryID);
    }*/


}
