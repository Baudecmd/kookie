package com.api.kookie.data.recette;

import com.api.kookie.data.entity.RecipeLevel;
import org.springframework.data.repository.CrudRepository;

public interface RecipeLevelRepository extends CrudRepository<RecipeLevel, Integer> {
    RecipeLevel findOneById(Integer recipeLevelId);
}
