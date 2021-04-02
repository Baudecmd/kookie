package com.api.kookie.controllers.category;

import com.api.kookie.core.category.CategoryService;
import com.api.kookie.core.dto.CategoryDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CategoryController.class);

    @Autowired
    CategoryService categoryService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllCategories() {
        LOGGER.debug("[CategoryController, getAllCategories]");

        List<CategoryDTO> categories = categoryService.getAllCategories();

        return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(categories);

    }

}
