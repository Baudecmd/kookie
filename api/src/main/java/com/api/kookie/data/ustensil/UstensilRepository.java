package com.api.kookie.data.ustensil;

import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.Ustensil.Ustensil;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UstensilRepository extends CrudRepository<Ustensil, Integer> {

}
