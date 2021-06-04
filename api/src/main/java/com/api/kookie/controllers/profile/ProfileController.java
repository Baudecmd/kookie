package com.api.kookie.controllers.profile;

import com.api.kookie.core.dto.ProfileDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.exceptions.UsernameUnavailableException;
import com.api.kookie.core.profile.ProfileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/profile", produces = "content-type=utf-8")
public class ProfileController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProfileController.class);

    @Autowired
    ProfileService profileService;

    @PostMapping("/create")
    public ResponseEntity<?> createProfile(@RequestBody ProfileDTO profile) {
        LOGGER.debug("[ProfileController, createProfile] profile : " + profile.toString());

        try {
            ProfileDTO profileDTO = profileService.createProfile(profile);
            return ResponseEntity.status(HttpStatus.CREATED).contentType(MediaType.APPLICATION_JSON).body(profileDTO);
        } catch (UsernameUnavailableException e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).contentType(MediaType.APPLICATION_JSON).body(e.getMessage());
        }
    }

    @GetMapping("/favorite/add")
    public ResponseEntity<Boolean> addFavorite(@RequestParam Integer profileId, @RequestParam Long recetteId) {
        LOGGER.debug("[ProfileController, addFavorite] profileId : " + profileId + " recetteId : " + recetteId);

        if (profileId == null || recetteId == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(false);
        } else {
            Boolean added = profileService.addFavorite(profileId, recetteId);
            if (added != null) {
                if (added) {
                    return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(true);
                } else {
                    return ResponseEntity.status(HttpStatus.CONFLICT).contentType(MediaType.APPLICATION_JSON).body(false);
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(false);
            }
        }
    }

    @GetMapping("/favorite/all")
    public ResponseEntity<List<RecetteDTO>> getFavorites(@RequestParam Integer profileId) {
        LOGGER.debug("[ProfileController, addFavorite] profileId : " + profileId);

        if (profileId == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(null);
        } else {
            List<RecetteDTO> recettes = profileService.getFavorites(profileId);
            if (recettes != null) {
                return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(recettes);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(null);
            }
        }
    }
}
