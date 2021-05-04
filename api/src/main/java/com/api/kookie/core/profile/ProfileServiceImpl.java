package com.api.kookie.core.profile;

import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.exceptions.UsernameUnavailableException;
import com.api.kookie.core.user.UserService;
import com.api.kookie.core.util.ProfileParser;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recette.RecetteRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Autowired
    private RecetteRepository recetteRepository;

    @Override
    @Transactional
    public ProfileDTO createProfile(ProfileDTO profile) throws UsernameUnavailableException {
        LOGGER.debug("[ProfileService, createProfile] profile = " + profile.toString());

        ProfileDTO profileDTO = new ProfileDTO();
        Boolean usernameAlreadyExists = userService.usernameAlreadyExists(profile.getUser().getUsername());
        if (!usernameAlreadyExists) {
            String password = profile.getUser().getPassword();
            profile.getUser().setPassword(passwordEncoder.encode(profile.getUser().getPassword()));
            profileDTO = ProfileParser.toDTO(profileRepository.save(ProfileParser.toEntity(profile)));
            if (!profileDTO.equals(new ProfileDTO())) {
                CredentialDTO credential = new CredentialDTO();
                credential.setUsername(profile.getUser().getUsername());
                credential.setPassword(password);
                profileDTO = userService.login(credential);
            }
        } else throw new UsernameUnavailableException();
        return profileDTO;
    }

    @Override
    public ProfileDTO getByProfileId(Integer profileId) {
        LOGGER.debug("[ProfileService, getByProfileId] profileId = " + profileId);
        return ProfileParser.toDTO(profileRepository.findOneById(profileId));
    }

    @Override
    @Transactional
    public Boolean addFavorite(Integer profileId, Integer recetteId) {
        LOGGER.debug("[ProfileService, addFavorite] profileId = " + profileId + ", recetteID = " + recetteId);
        Profile profile = profileRepository.findOneById(profileId);
        Recette recette = recetteRepository.findOneById(recetteId);
        if (profile != null && recette != null) {
            List<Recette> favorites = profile.getFavoriteRecettes();
            favorites.add(recette);
            profile.setFavoriteRecettes(favorites);
            Profile updatedProfile = profileRepository.save(profile);
            return (profile.equals(updatedProfile)) ? true : false;
        }
        return null;
    }

    @Override
    public List<RecetteDTO> getFavorites(Integer profileId) {
        LOGGER.debug("[ProfileService, getFavorites] profileId = " + profileId);
        Profile profile = profileRepository.findOneById(profileId);
        if (profile != null) {
            return RecetteParser.parseListToDTO(profile.getFavoriteRecettes());
        }
        return null;
    }
}
