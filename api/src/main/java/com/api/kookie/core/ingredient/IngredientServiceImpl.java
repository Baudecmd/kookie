package com.api.kookie.core.ingredient;

import com.api.kookie.core.dto.IngredientDTO;
import com.api.kookie.core.util.IngredientParser;
import com.api.kookie.data.entity.ingredient.Ingredient;
import com.api.kookie.data.ingredient.IngredientRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = false)
public class IngredientServiceImpl implements IngredientService {

    private static final Logger LOGGER = LoggerFactory.getLogger(IngredientService.class);

    @Autowired
    IngredientRepository ingredientRepository;

    public boolean createIngredient(IngredientDTO ingredientDTO) {

        LOGGER.debug("[IngredientService, createIngredient] ingredientDTO = " + ingredientDTO.toString());

        Ingredient ingredient = ingredientRepository.save(IngredientParser.toEntity(ingredientDTO));

        return ingredient != null;
    }

    public List<IngredientDTO> getAllIngredients() {

        LOGGER.debug("[IngredientService, getAllIngredients]");

        List<Ingredient> ingredients = new ArrayList<>();
        ingredientRepository.findAll().forEach(ingredients::add);
        return IngredientParser.parseListToDTO(ingredients);
    }

    public List<IngredientDTO> getAllIngredientsByCategoryId(Integer categoryId) {

        LOGGER.debug("[IngredientService, getAllIngredientsByCategoryId]");

        List<IngredientDTO> ingredients = IngredientParser.parseListToDTO(ingredientRepository.findAllByCategoryId(categoryId));
        return ingredients;
    }


}
