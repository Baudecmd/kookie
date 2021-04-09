package com.api.kookie.core.user;

import com.api.kookie.controllers.security.JwtUtils;
import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;
import com.api.kookie.core.util.ProfileParser;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public ProfileDTO login(CredentialDTO credential) throws UnknownUserException, WrongPasswordException {

        LOGGER.debug("[UserService, login] credential = " + credential.toString());

        Profile profile = profileRepository.findOneByUser_Username(credential.getUsername());

        ProfileDTO profileDTO = ProfileParser.toDTO(profile);

        if (!profileDTO.equals(new ProfileDTO())) {
            if (passwordEncoder.matches(credential.getPassword(), profile.getUser().getPassword())) {
                profileDTO.getUser().setToken(JwtUtils.createToken((int) profileDTO.getUser().getId()));
                return profileDTO;
            } else throw new WrongPasswordException();
        } else {
            throw new UnknownUserException();
        }
    }

    @Override
    public Boolean usernameAlreadyExists(String username) {

        LOGGER.debug("[UserService, usernameAlreadyExists] username = " + username);

        return userRepository.existsUserByUsername(username);
    }

    @Override
    public Boolean emailAlreadyExists(String email) {

        LOGGER.debug("[UserService, emailAlreadyExists] email = " + email);

        return userRepository.existsUserByEmail(email);
    }

}
