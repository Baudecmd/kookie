package com.api.kookie.core.recette;

import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;
import com.api.kookie.data.entity.Recette;

import java.util.List;

public interface RecetteService {
List<RecetteDTO> searchByString(String s);
}
