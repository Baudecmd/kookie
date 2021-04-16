package com.api.kookie.core.profile;

import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.exceptions.UsernameUnavailableException;

public interface ProfileService {

    ProfileDTO createProfile(ProfileDTO profile) throws UsernameUnavailableException;
}
