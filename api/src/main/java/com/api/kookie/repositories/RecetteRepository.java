package com.api.kookie.repositories;

import com.api.kookie.models.Recette;
import com.api.kookie.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecetteRepository extends CrudRepository<Recette, Integer> {

}
