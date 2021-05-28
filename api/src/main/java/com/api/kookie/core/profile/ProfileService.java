package com.api.kookie.core.profile;

import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.exceptions.UsernameUnavailableException;

import java.util.List;

public interface ProfileService {

    ProfileDTO createProfile(ProfileDTO profile) throws UsernameUnavailableException;

    ProfileDTO getByProfileId(Integer profileId);

    Boolean addFavorite(Integer profileId, Long recetteId);

    List<RecetteDTO> getFavorites(Integer profileId);
}
