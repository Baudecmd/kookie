package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.core.util.StepParser;
import com.api.kookie.data.entity.Opinion;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recette.RecetteRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional(readOnly = true)
public class RecetteServiceImpl implements RecetteService {

    private static final Logger LOGGER = LoggerFactory.getLogger(RecetteServiceImpl.class);

    @Autowired
    RecetteRepository recetteRepository;

    @Autowired
    ProfileRepository profileRepository;

    @Override
    public List<RecetteDTO> searchByString(String s) {
        ArrayList<Recette> recetteArrayList = (ArrayList<Recette>) recetteRepository.findAllByNom(s);
        return RecetteParser.parseListToDTO(recetteArrayList);
    }

    @Override
    public List<RecetteThumbnailDTO> getAllRecettesThumbnails(Integer profileId) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecettesThumbnails] profileId = " + profileId);

        Profile profile = profileRepository.findOneById(profileId);

        List<Recette> recettes = recetteRepository.findAll();
        List<RecetteThumbnailDTO> thumbnails = new ArrayList<>();

        if (recettes != null && profile != null) {
            ArrayList<Long> favoritesRecettesId = profile.getFavoriteRecettes().stream().map(Recette::getId).collect(Collectors.toCollection(ArrayList::new));
            for (Recette r : recettes) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getNom());
                int sumNotes = r.getOpinions().stream().map(Opinion::getNote).reduce(0, Integer::sum);
                thumbnailDTO.setNote(sumNotes / r.getOpinions().size());
                thumbnailDTO.setFavorite(favoritesRecettesId.contains(r.getId()));
                thumbnails.add(thumbnailDTO);
            }
        }
        return thumbnails;
    }

    @Override
    public List<StepDTO> optimizeRecipes(List<Integer> ids, Profile profile) {
        List<StepDTO> steps = getAllStepsDTOs(ids);
        //TODO: organiser les étapes
        return null;
    }

    public List<Recette> getAllRecipesByIdList(List<Integer> ids){
        List<Recette> recipes = new ArrayList<>();
        for(Integer integer: ids){
            recipes.add(recetteRepository.findOneById((long) integer));
        }
        return recipes;
    }

    public List<StepDTO> getAllStepsDTOs(List<Integer> ids) {
        List<StepDTO> steps = new ArrayList<>();
        List<Recette> recipes = getAllRecipesByIdList(ids);
        for(Recette recipe: recipes){
            steps.addAll(StepParser.parseListToDTO(recipe.getSteps()));
        }
        return steps;
    }
}
