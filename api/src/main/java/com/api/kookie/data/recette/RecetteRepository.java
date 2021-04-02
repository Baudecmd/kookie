package com.api.kookie.data.recette;

import com.api.kookie.data.entity.Recette;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RecetteRepository extends CrudRepository<Recette, Integer> {

}
