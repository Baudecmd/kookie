package com.api.kookie.controllers.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecipeLevelDTO;
import com.api.kookie.core.recette.RecipeLevelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/recipeLevel", produces = "application/json;charset=utf-8")
public class RecipeLevelController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecipeLevelController.class);

    @Autowired
    RecipeLevelService recipeLevelService;

    @PostMapping("/add")
    public ResponseEntity<Boolean> addRecipeLevel(@RequestBody RecipeLevelDTO recipeLevel) {
        LOGGER.debug("[RecipeLevelController, addRecipeLevel] recipeLevelDTO : " + recipeLevel.toString());

        if (recipeLevel == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(false);
        } else {
            Boolean added = recipeLevelService.addRecipeLevel(recipeLevel);
            if (added != null) {
                if (added) {
                    return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(true);
                } else {
                    return ResponseEntity.status(HttpStatus.CONFLICT).contentType(MediaType.APPLICATION_JSON).body(false);
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(false);
            }
        }
    }

    @PostMapping("/update")
    public ResponseEntity<Boolean> updateRecipeLevel(@RequestBody RecipeLevelDTO recipeLevel) {
        LOGGER.debug("[RecipeLevelController, updateRecipeLevel] recipeLevelDTO : " + recipeLevel.toString());

        if (recipeLevel == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(false);
        } else {
            Boolean added = recipeLevelService.updateRecipeLevel(recipeLevel);
            if (added != null) {
                if (added) {
                    return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(true);
                } else {
                    return ResponseEntity.status(HttpStatus.CONFLICT).contentType(MediaType.APPLICATION_JSON).body(false);
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(false);
            }
        }
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Boolean> deleteRecipeLevel(@RequestParam Integer recipeLevelId) {
        LOGGER.debug("[RecipeLevelController, deleteRecipeLevel] recipeLevelId : " + recipeLevelId);

        if (recipeLevelId == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(false);
        } else {
            Boolean added = recipeLevelService.deleteRecipeLevel(recipeLevelId);
            if (added != null) {
                return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(added);

            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(false);
            }
        }
    }

    @GetMapping("/allRecipes")
    public ResponseEntity<List<RecetteDTO>> getAllRecipes(@RequestParam Integer recipeLevelId) {
        LOGGER.debug("[RecipeLevelController, getAllRecipes] recipeLevelId : " + recipeLevelId);

        if (recipeLevelId == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(null);
        } else {
            List<RecetteDTO> recipes = recipeLevelService.getAllRecipes(recipeLevelId);
            if (recipes != null) {
                return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(recipes);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(null);
            }
        }
    }


}
