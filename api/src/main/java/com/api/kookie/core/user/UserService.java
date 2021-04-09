package com.api.kookie.core.user;

import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;

public interface UserService {

    ProfileDTO login(CredentialDTO credential) throws UnknownUserException, WrongPasswordException;

    Boolean usernameAlreadyExists(String username);

    Boolean emailAlreadyExists(String email);

}
