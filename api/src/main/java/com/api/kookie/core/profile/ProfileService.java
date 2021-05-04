package com.api.kookie.core.profile;

import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.exceptions.UsernameUnavailableException;
import com.api.kookie.data.entity.Profile;

public interface ProfileService {

    ProfileDTO createProfile(ProfileDTO profile) throws UsernameUnavailableException;

    Profile getByProfileId(Integer profileId);
}
