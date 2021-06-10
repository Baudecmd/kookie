package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.core.util.StepParser;
import com.api.kookie.data.entity.Opinion;
import com.api.kookie.data.entity.Profile;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.RecipeCategory;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.recette.RecipeCategoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
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

    @Autowired
    RecipeCategoryRepository recipeCategoryRepository;

    @Override
    public RecetteDTO getOneById(Long recipeId) {
        LOGGER.debug("[RecetteServiceImpl, getOneById] recipeId = " + recipeId);

        return RecetteParser.toDTO(recetteRepository.findOneById(recipeId));
    }

    @Override
    public List<RecetteDTO> searchByString(String s) {
        ArrayList<Recette> recetteArrayList = (ArrayList<Recette>) recetteRepository.findAllByNom(s);
        return RecetteParser.parseListToDTO(recetteArrayList);
    }



    @Override
    public List<RecetteThumbnailDTO> getAllRecipesThumbnails(Integer profileId) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecettesThumbnails] profileId = " + profileId);

        Profile profile = profileRepository.findOneById(profileId);

        List<Recette> recettes = recetteRepository.findAll();
        List<RecetteThumbnailDTO> thumbnails = new ArrayList<>();

        if (recettes != null && profile != null) {
            ArrayList<Long> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                    .map(Recette::getId).collect(Collectors.toCollection(ArrayList::new));
            for (Recette r : recettes) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getNom());
                int sumNotes = r.getOpinions().stream().map(Opinion::getNote).reduce(0, Integer::sum);
                if (r.getOpinions().size() != 0) thumbnailDTO.setNote(sumNotes / r.getOpinions().size());
                thumbnailDTO.setIsFavorite(favoritesRecettesId.contains(favoritesRecettesId));
                thumbnails.add(thumbnailDTO);
            }
        }
        return thumbnails;
    }

    @Override
    public List<RecetteThumbnailDTO> getAllRecipesThumbnailsByCategoryId(Integer id) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecipesThumbnailsByCategoryId] id = " + id);

        Profile profile = profileRepository.findOneById(15);
        RecipeCategory recipeCategory = recipeCategoryRepository.findOneById(id);

        List<RecetteThumbnailDTO> thumbnails = new ArrayList<>();

        if (recipeCategory.getRecipes() != null && recipeCategory != null) {
            ArrayList<Long> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                    .map(Recette::getId).collect(Collectors.toCollection(ArrayList::new));
            for (Recette r : recipeCategory.getRecipes()) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getNom());
                int sumNotes = r.getOpinions().stream().map(Opinion::getNote).reduce(0, Integer::sum);
                if (r.getOpinions().size() != 0) thumbnailDTO.setNote(sumNotes / r.getOpinions().size());
                thumbnailDTO.setIsFavorite(favoritesRecettesId.contains(favoritesRecettesId));
                thumbnails.add(thumbnailDTO);
            }
        }
        return thumbnails;
    }

    private List<StepDTO> organizeSteps(List<StepDTO> steps){
        List<StepDTO> newList = new ArrayList<>();
        steps.forEach(stepDTO -> {
            if(stepDTO.isPreparationStep()){
                newList.add(stepDTO);
            }
        });
        steps.removeAll(newList);
        newList.addAll(steps);
        newList.sort(Comparator.comparing(o -> o.getIngredientLine().getIngredient().getName()));
        return newList;
    }

    @Override
    public List<StepDTO> optimizeRecipes(List<Integer> ids, Profile profile) {
        List<StepDTO> steps = getAllStepsDTOs(ids);
        steps = organizeSteps(steps);
        return steps;
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
