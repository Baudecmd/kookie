package com.api.kookie.controllers.ingredient;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.ingredient.IngredientCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/ingredientCategory", produces = "application/json; charset=utf-8")
public class IngredientCategoryController {

    private static final Logger LOGGER = LoggerFactory.getLogger(IngredientCategoryController.class);

    @Autowired
    IngredientCategoryService ingredientCategoryService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllCategories() {
        LOGGER.debug("[IngredientCategoryController, getAllCategories]");

        List<CategoryDTO> categories = ingredientCategoryService.getAllCategories();

        return ResponseEntity.status(HttpStatus.OK).body(categories);

    }

}
