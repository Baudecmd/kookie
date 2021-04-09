package com.api.kookie.controllers.user;

import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;
import com.api.kookie.core.user.UserService;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.entity.User;
import com.api.kookie.data.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    @Autowired
    UserRepository userRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/users")
    public List<User> liste_users() {
        return (List<User>) userRepository.findAll();
    }


    @PostMapping("/user/auth")
    public ResponseEntity<?> auth(@RequestBody CredentialDTO credential) {
        LOGGER.debug("[UserController, auth] credentialDTO = " + credential.toString());

        try {
            ProfileDTO profile = userService.login(credential);
            return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(profile);

        } catch (UnknownUserException | WrongPasswordException e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).contentType(MediaType.APPLICATION_JSON).body(e.getMessage());
        }

        /*HashMap<String, String> map = new HashMap<>();
        String username = arg.get("user");
        String password = arg.get("password");
        User u = userRepository.findByUsername(username);
        if (u != null && passwordEncoder.matches(password, u.getPassword())) {
            map.put("key", JwtUtils.createToken((int) u.getId()));
        } else {
            map.put("erreur_id", "404");
            map.put("erreur_lib", "pas le bon username ou mot de passe");
        }
        return map;*/
    }

    @PostMapping("/user/signup")
    public Map<String, String> signup(@RequestBody Map<String, String> arg) {
        HashMap<String, String> map = new HashMap<>();
        String username = arg.get("user");
        String password = arg.get("password");
        String email = arg.get("email");
        ArrayList<User> userArrayList = (ArrayList<User>) userRepository.findByUsernameOrEmail(username, email);
        if (userArrayList.size() == 0) {
            User u = new User(email, username, passwordEncoder.encode(password), new Profile());
            userRepository.save(u);
            map.put("ok", "ok");
        } else {
            map.put("erreur_id", "400");
            map.put("erreur_lib", "Email ou username déjà utilisé");
        }
        return map;


    }


}
