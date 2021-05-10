package com.api.kookie.data.opinion;

import com.api.kookie.data.entity.ingredient.Ingredient;
import org.springframework.data.repository.CrudRepository;

public interface OpinionRepository extends CrudRepository<Ingredient, Integer> {
}
