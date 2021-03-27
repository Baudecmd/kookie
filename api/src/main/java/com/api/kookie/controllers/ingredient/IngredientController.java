package com.api.kookie.controllers.ingredient;

import com.api.kookie.core.dto.IngredientDTO;
import com.api.kookie.core.ingredient.IngredientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ingredient")
public class IngredientController {

    private static final Logger LOGGER = LoggerFactory.getLogger(IngredientController.class);

    @Autowired
    IngredientService ingredientService;

    @PostMapping
    public ResponseEntity<?> add(@RequestBody IngredientDTO ingredientDTO) {
        LOGGER.debug("[IngredientController, add] ingredientDTO: " + ingredientDTO.toString());

        boolean isAdded = ingredientService.createIngredient(ingredientDTO);

        if (isAdded) {
            return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(null);
        }
        return ResponseEntity.status(HttpStatus.FORBIDDEN).contentType(MediaType.APPLICATION_JSON).body(null);

    }

    @GetMapping("/all")
    public ResponseEntity<?> getAllIngredients() {
        LOGGER.debug("[IngredientController, add]");

        List<IngredientDTO> ingredients = ingredientService.getAllIngredients();

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(ingredients);

    }

    @GetMapping("/all/category")
    public ResponseEntity<?> getAllIngredientsByCategoryId(@RequestParam Integer categoryId) {
        LOGGER.debug("[IngredientController, add] categoryId =  " + categoryId);

        List<IngredientDTO> ingredients = ingredientService.getAllIngredientsByCategoryId(categoryId);

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(ingredients);

    }

}
