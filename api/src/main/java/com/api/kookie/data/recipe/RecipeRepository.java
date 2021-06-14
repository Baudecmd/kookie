package com.api.kookie.data.recipe;

import com.api.kookie.data.entity.Recipe;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Integer> {

    List<Recipe> findAllByName(String s);

    List<Recipe> findAll();

    Recipe findOneById(Integer recetteId);

    List<Recipe> findAllByCategoryId(Integer categoryId);
}
