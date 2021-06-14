package com.api.kookie.core.opinion;

import com.api.kookie.core.dto.OpinionDTO;
import com.api.kookie.core.util.OpinionParser;
import com.api.kookie.data.entity.Opinion;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.entity.Recipe;
import com.api.kookie.data.opinion.OpinionRepository;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recipe.RecipeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class OpinionServiceImpl implements OpinionService {

    private static final Logger LOGGER = LoggerFactory.getLogger(OpinionServiceImpl.class);

    @Autowired
    OpinionRepository opinionRepository;

    @Autowired
    RecipeRepository recipeRepository;

    @Autowired
    ProfileRepository profileRepository;

    @Override
    public Boolean addOpinion(OpinionDTO opinion) {
        LOGGER.debug("[OpinionService, addOpinion] opinion : " + opinion.toString());

        Recipe recipe = recipeRepository.findOneById(opinion.getRecette().getId());
        Profile profile = profileRepository.findOneById(opinion.getProfile().getId());

        if (recipe != null && profile != null) {
            if (opinion.getId() == null) {
                Opinion savedOpinion = opinionRepository.save(OpinionParser.toEntity(opinion));
                recipe.getOpinions().add(savedOpinion);
                profile.getOpinions().add(savedOpinion);
                recipeRepository.save(recipe);
                profileRepository.save(profile);
                return true;
            }
            return false;
        }
        return null;
    }

    @Override
    public Boolean updateOpinion(OpinionDTO opinion) {
        LOGGER.debug("[OpinionService, updateOpinion] opinion : " + opinion.toString());

        Recipe recipe = recipeRepository.findOneById(opinion.getRecette().getId());
        Profile profile = profileRepository.findOneById(opinion.getProfile().getId());

        if (recipe != null && profile != null) {
            if (opinion.getId() != null) {
                opinionRepository.save(OpinionParser.toEntity(opinion));
                return true;
            }
            return false;
        }
        return null;
    }
}
