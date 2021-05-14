package com.api.kookie.core.ustensil;

import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.Ustensil.Ustensil;

import java.util.List;

public interface UstensilService {
    List<Ustensil> getAllUstensil();

}
