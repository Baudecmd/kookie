package com.api.kookie.controllers.user;

import com.api.kookie.core.dto.CredentialDTO;
import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.exceptions.UnknownUserException;
import com.api.kookie.core.exceptions.WrongPasswordException;
import com.api.kookie.core.user.UserService;
import com.api.kookie.data.entity.User;
import com.api.kookie.data.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(produces = "content-type:application/json;charset=utf-8")
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
        LOGGER.debug("[UserController, users] liste users");
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
    }

    @PostMapping("/user/signup")
    public Map<String, String> signup(@RequestBody Map<String, String> arg) {
        HashMap<String, String> map = new HashMap<>();
        String username = arg.get("user");
        String password = arg.get("password");
        String email = arg.get("email");
        User userArrayList = userRepository.findByUsername(username);
        if (userArrayList != null) {
            User u = new User(username, passwordEncoder.encode(password));
            userRepository.save(u);
            map.put("ok", "ok");
        } else {
            map.put("erreur_id", "400");
            map.put("erreur_lib", "Email ou username déjà utilisé");
        }
        return map;


    }


}
