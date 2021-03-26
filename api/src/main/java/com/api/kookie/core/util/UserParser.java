package com.api.kookie.core.util;

import com.api.kookie.core.dto.UserDTO;
import com.api.kookie.models.User;

import java.util.ArrayList;
import java.util.List;

public class UserParser {

    public static UserDTO toDTO(User user) {
        UserDTO userDTO = new UserDTO();
        if (user != null) {
            userDTO.setId(user.getId());
            userDTO.setEmail(user.getEmail());
            userDTO.setUsername(user.getUsername());
        }
        return userDTO;
    }

    public static User toEntity(UserDTO userDTO) {
        User user = new User();
        if (userDTO != null) {
            user.setId(userDTO.getId());
            user.setEmail(userDTO.getEmail());
            user.setUsername(userDTO.getUsername());
        }
        return user;
    }

    public static List<UserDTO> parseListToDTO(List<User> users) {
        List<UserDTO> listUserDTOs = new ArrayList<>();
        for (User user : users) {
            listUserDTOs.add(toDTO(user));
        }
        return listUserDTOs;
    }
}
