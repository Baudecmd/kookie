package com.api.kookie.controllers.recette;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.recette.RecetteCategoryService;
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
@RequestMapping("/recetteCategory")
public class RecetteCategoryController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecetteCategoryController.class);

    @Autowired
    RecetteCategoryService recetteCategoryService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllCategories() {
        LOGGER.debug("[RecetteCategoryController, getAllCategories]");

        List<CategoryDTO> categories = recetteCategoryService.getAllCategories();

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(categories);

    }

    @GetMapping("/recettes")
    public ResponseEntity<List<RecetteDTO>> getAllRecettesByCategoryId(@RequestParam Integer categoryId) {
        LOGGER.debug("[RecetteCategoryController, getAllRecettesByCategoryId] categoryId : " + categoryId);

        if (categoryId == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(null);
        } else {
            List<RecetteDTO> categories = recetteCategoryService.getAllByCategoryId(categoryId);
            if (categories != null) {
                return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(categories);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(null);
            }
        }
    }

}