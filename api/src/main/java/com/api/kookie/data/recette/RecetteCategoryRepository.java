package com.api.kookie.data.recette;

import com.api.kookie.data.entity.RecetteCategory;
import org.springframework.data.repository.CrudRepository;

public interface RecetteCategoryRepository extends CrudRepository<RecetteCategory, Integer> {
    RecetteCategory findOneById(Integer categoryId);
}
