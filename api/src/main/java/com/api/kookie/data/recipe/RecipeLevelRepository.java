package com.api.kookie.data.recipe;

import com.api.kookie.data.entity.RecipeLevel;
import org.springframework.data.repository.CrudRepository;

public interface RecipeLevelRepository extends CrudRepository<RecipeLevel, Integer> {
    RecipeLevel findOneById(Integer recipeLevelId);
}
