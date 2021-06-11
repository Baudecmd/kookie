package com.api.kookie.controllers.recette;

import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.core.recette.RecetteService;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/recipesOptimization", produces = "application/json; charset=utf-8")
public class RecipesOptimizationController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecetteController.class);

    @Autowired
    UserRepository userRepository;
    @Autowired
    RecetteService recetteService;
    @Autowired
    ProfileRepository profileRepository;

    @GetMapping("/optimize_recipes_list")
    public List<StepDTO> optimize_session(@RequestParam List<Integer> ids, @RequestParam Integer profileId){
        Profile profile = profileRepository.findOneById(profileId);
        List<StepDTO> orderedSteps = recetteService.optimizeRecipes(ids, profile);
        return orderedSteps;
    }
}
