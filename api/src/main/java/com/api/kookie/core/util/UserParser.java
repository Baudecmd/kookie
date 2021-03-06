package com.api.kookie.core.util;

import com.api.kookie.core.dto.UserDTO;
import com.api.kookie.data.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserParser {

    public static UserDTO toDTO(User user) {
        UserDTO userDTO = new UserDTO();
        if (user != null) {
            userDTO.setId(user.getId());
            userDTO.setUsername(user.getUsername());
        }
        return userDTO;
    }

    public static User toEntity(UserDTO userDTO) {
        User user = new User();
        if (userDTO != null) {
            user.setId(userDTO.getId());
            user.setUsername(userDTO.getUsername());
            user.setPassword(userDTO.getPassword());
        }
        return user;
    }

    public static List<UserDTO> parseListToDTO(List<User> users) {
        List<UserDTO> listUsersDTO = new ArrayList<>();
        for (User user : users) {
            listUsersDTO.add(toDTO(user));
        }
        return listUsersDTO;
    }
}
