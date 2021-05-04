package com.api.kookie.core.ingredient;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.util.IngredientCategoryParser;
import com.api.kookie.data.ingredient.IngredientCategoryRepository;
import com.api.kookie.data.entity.ingredient.IngredientCategory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class IngredientCategoryServiceImpl implements IngredientCategoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger(IngredientCategoryService.class);

    @Autowired
    IngredientCategoryRepository ingredientCategoryRepository;

    public List<CategoryDTO> getAllCategories() {

        LOGGER.debug("[IngredientCategoryService, getAllCategories]");

        List<IngredientCategory> categories = new ArrayList<>();
        ingredientCategoryRepository.findAll().forEach(categories::add);
        return IngredientCategoryParser.parseListToDTO(categories);
    }
}
