package com.api.kookie.controllers.recette;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.recette.RecipeCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/recipeCategory", headers = "content-type=utf-8")
public class RecipeCategoryController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecipeCategoryController.class);

    @Autowired
    RecipeCategoryService recipeCategoryService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllCategories() {
        LOGGER.debug("[RecipeCategoryController, getAllCategories]");

        List<CategoryDTO> categories = recipeCategoryService.getAllCategories();

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(categories);

    }

    @GetMapping("/allRecipes")
    public ResponseEntity<List<RecetteDTO>> getAllRecipesByCategoryId(@RequestParam Integer categoryId) {
        LOGGER.debug("[RecipeCategoryController, getAllRecipesByCategoryId] categoryId : " + categoryId);

        if (categoryId == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(null);
        } else {
            List<RecetteDTO> categories = recipeCategoryService.getAllByCategoryId(categoryId);
            if (categories != null) {
                return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(categories);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(null);
            }
        }
    }

}