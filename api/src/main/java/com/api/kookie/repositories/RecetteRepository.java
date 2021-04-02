package com.api.kookie.repositories;

import com.api.kookie.models.Recette;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RecetteRepository extends CrudRepository<Recette, Integer> {

}
