package com.api.kookie.controllers;

import com.api.kookie.models.User;
import com.api.kookie.repositories.UserRepository;
import com.api.kookie.security.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/users")
    public List<User> liste_users(){
        return (List<User>) userRepository.findAll();
    }


    @PostMapping("/user/auth")
    public Map<String, String> auth(@RequestBody Map<String, String> arg){
        HashMap<String, String> map = new HashMap<>();
        String username=arg.get("user");
        String password=arg.get("password");

        User u = userRepository.findByIdAndPassword(username,password);
        if(u != null){
            map.put("key",JwtUtils.createToken((int) u.getId()));
        }
        else{
             map.put("erreur_id","404");
             map.put("erreur_lib","pas le bon username ou mot de passe");
        }

        return map;
    }

    @PostMapping("/user/signup")
    public Map<String, String>  signup(@RequestBody Map<String, String> arg){
                                       HashMap<String, String> map = new HashMap<>();
        String username=arg.get("user");
        String password=arg.get("password");
        String email=arg.get("email");

        ArrayList<User> userArrayList= (ArrayList<User>) userRepository.findByUsernameOrEmail(username,email);

        if(userArrayList.size()==0) {
            User u = new User(email,username,password);
            userRepository.save(u);
            map.put("ok","ok");
        }else{
            map.put("erreur_id","400");
            map.put("erreur_lib","Email ou username déjà utilisé");
        }
        return map;


    }




}
