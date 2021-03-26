package com.api.kookie.data.ingredient;

import com.api.kookie.data.entity.Ingredient;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IngredientRepository extends CrudRepository<Ingredient, Integer> {

    @Query(value = "SELECT * FROM ingredient WHERE category_id = :categoryId", nativeQuery = true)
    List<Ingredient> findAllByCategoryId(Integer categoryId);
}
