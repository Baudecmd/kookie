package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecipeLevelDTO;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.core.util.RecipeLevelParser;
import com.api.kookie.data.entity.RecipeLevel;
import com.api.kookie.data.recette.RecipeLevelRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class RecipeLevelServiceImpl implements RecipeLevelService {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecipeLevelServiceImpl.class);

    @Autowired
    RecipeLevelRepository recipeLevelRepository;

    @Override
    public Boolean addRecipeLevel(RecipeLevelDTO recipeLevel) {
        LOGGER.debug("[RecetteService, addRecipeLevel] recipeLevel : " + recipeLevel);

        if (recipeLevel.getName() != null) {
            RecipeLevel savedRecipeLevel = recipeLevelRepository.save(RecipeLevelParser.toEntity(recipeLevel));
            return (savedRecipeLevel != null) ? true : false;
        }
        return true;
    }

    @Override
    public Boolean updateRecipeLevel(RecipeLevelDTO recipeLevel) {
        LOGGER.debug("[RecetteService, updateRecipeLevel] recipeLevel : " + recipeLevel);

        if (recipeLevel.getId() != null) {
            RecipeLevel savedRecipeLevel = recipeLevelRepository.save(RecipeLevelParser.toEntity(recipeLevel));
            return (RecipeLevelParser.toDTO(savedRecipeLevel) == recipeLevel) ? true : false;
        }
        return null;
    }

    @Override
    public Boolean deleteRecipeLevel(Integer recipeLevelId) {
        LOGGER.debug("[RecetteService, deleteRecipeLevel] recipeLevelId : " + recipeLevelId);

        RecipeLevel recipeLevel = recipeLevelRepository.findOneById(recipeLevelId);

        if (recipeLevel != null) {
            recipeLevelRepository.delete(recipeLevel);
            return true;
        }
        return null;

    }

    @Override
    public List<RecetteDTO> getAllRecipes(Integer recipeLevelId) {
        LOGGER.debug("[RecetteService, getAllRecipes] recipeLevelId : " + recipeLevelId);

        RecipeLevel recipeLevel = recipeLevelRepository.findOneById(recipeLevelId);

        if (recipeLevel != null) {
            return RecetteParser.parseListToDTO(recipeLevel.getRecipes());
        }
        return null;

    }
}
