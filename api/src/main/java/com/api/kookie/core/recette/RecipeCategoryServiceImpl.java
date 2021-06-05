package com.api.kookie.core.recette;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.util.RecipeCategoryParser;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.data.entity.RecipeCategory;
import com.api.kookie.data.recette.RecipeCategoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional(readOnly = true)
public class RecipeCategoryServiceImpl implements RecipeCategoryService {


    private static final Logger LOGGER = LoggerFactory.getLogger(RecipeCategoryServiceImpl.class);

    @Autowired
    RecipeCategoryRepository recipeCategoryRepository;

    public List<CategoryDTO> getAllCategories() {
        LOGGER.debug("[RecipeCategoryService, getAllCategories]");

        List<RecipeCategory> categories = new ArrayList<>();
        recipeCategoryRepository.findAll().forEach(categories::add);
        return RecipeCategoryParser.parseListToDTO(categories);
    }

    @Override
    public List<CategoryDTO> getAllRecipesCategoriesContainsRecipe() {
        LOGGER.debug("[RecipeCategoryService, getAllRecipeCategoriesContainsRecipe]");

        List<RecipeCategory> categories = new ArrayList<>();
        recipeCategoryRepository.findAll().forEach(categories::add);
        categories = categories.stream().filter(category -> category.getRecipes().size() != 0).collect(Collectors.toList());
        return RecipeCategoryParser.parseListToDTO(categories);
    }

    public List<RecetteDTO> getAllByCategoryId(Integer categoryId) {
        LOGGER.debug("[RecipeCategoryService, getAllByCategoryId] categoryId = " + categoryId);

        RecipeCategory category = recipeCategoryRepository.findOneById(categoryId);

        if (category != null) {
            return RecetteParser.parseListToDTO(category.getRecipes());
        }
        return null;
    }
}

