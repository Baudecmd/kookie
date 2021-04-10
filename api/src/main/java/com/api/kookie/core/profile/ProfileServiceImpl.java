package com.api.kookie.core.profile;

import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.user.UserService;
import com.api.kookie.core.util.ProfileParser;
import com.api.kookie.data.profile.ProfileRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class ProfileServiceImpl implements ProfileService {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProfileService.class);

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ProfileRepository profileRepository;

    @Override
    @Transactional
    public ProfileDTO createProfile(ProfileDTO profile) {

        LOGGER.debug("[ProfileService, createProfile] profile = " + profile.toString());

        ProfileDTO profileDTO = new ProfileDTO();
        Boolean usernameAlreadyExists = userService.usernameAlreadyExists(profile.getUser().getUsername());
        if (!usernameAlreadyExists) {
            profile.getUser().setPassword(passwordEncoder.encode(profile.getUser().getPassword()));
            profileDTO = ProfileParser.toDTO(profileRepository.save(ProfileParser.toEntity(profile)));
        }
        return profileDTO;
    }
}
