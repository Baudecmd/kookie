package com.api.kookie.core.util;

import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.data.entity.Profile;

import java.util.ArrayList;
import java.util.List;

public class ProfileParser {

    public static ProfileDTO toDTO(Profile profile) {
        ProfileDTO profileDTO = new ProfileDTO();
        if (profile != null) {
            profileDTO.setId(profile.getId());
            profileDTO.setUser(UserParser.toDTO(profile.getUser()));
            profileDTO.setFirstName(profile.getFirstName());
            profileDTO.setLastName(profile.getLastName());
        }
        return profileDTO;
    }

    public static Profile toEntity(ProfileDTO profileDTO) {
        Profile profile = new Profile();
        if (profileDTO != null) {
            profile.setId(profileDTO.getId());
            profile.setUser(UserParser.toEntity(profileDTO.getUser()));
            profile.setFirstName(profileDTO.getFirstName());
            profile.setLastName(profileDTO.getLastName());
        }
        return profile;
    }

    public static List<ProfileDTO> parseListToDTO(List<Profile> profiles) {
        List<ProfileDTO> listProfilesDTO = new ArrayList<>();
        for (Profile profile : profiles) {
            listProfilesDTO.add(toDTO(profile));
        }
        return listProfilesDTO;
    }

}
