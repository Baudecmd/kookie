package com.api.kookie.data.recette;

import com.api.kookie.data.entity.RecipeCategory;
import org.springframework.data.repository.CrudRepository;

public interface RecipeCategoryRepository extends CrudRepository<RecipeCategory, Integer> {
    RecipeCategory findOneById(Integer categoryId);
}
