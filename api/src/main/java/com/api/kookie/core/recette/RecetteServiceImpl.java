package com.api.kookie.core.recette;

import com.api.kookie.controllers.security.JwtUtils;
import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.UserDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;
import com.api.kookie.core.util.ProfileParser;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class RecetteServiceImpl implements RecetteService {
    @Autowired
    RecetteRepository recetteRepository;

    @Override
    public List<RecetteDTO> searchByString(String s) {
        ArrayList<Recette> recetteArrayList= (ArrayList<Recette>) recetteRepository.findAllByNom(s);
        return RecetteParser.parseListToDTO(recetteArrayList);
    }
}
