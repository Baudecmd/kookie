package com.api.kookie.data.utensil;

import com.api.kookie.data.entity.Utensil.Utensil;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UtensilRepository extends CrudRepository<Utensil, Integer> {

}
