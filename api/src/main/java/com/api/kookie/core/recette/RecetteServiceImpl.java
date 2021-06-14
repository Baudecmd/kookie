package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.core.util.StepParser;
import com.api.kookie.data.entity.*;
import com.api.kookie.data.entity.Ustensil.Ustensil;
import com.api.kookie.data.entity.ingredient.Ingredient;
import com.api.kookie.data.entity.ingredient.IngredientLine;
import com.api.kookie.data.ingredient.IngredientLineRepository;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.recette.RecipeCategoryRepository;
import com.api.kookie.data.step.StepRepository;
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

    @Autowired
    IngredientLineRepository ingredientLineRepository;

    @Autowired
    StepRepository stepRepository;

    @Override
    public RecetteDTO getOneById(Integer recipeId) {
        LOGGER.debug("[RecetteServiceImpl, getOneById] recipeId = " + recipeId);

        Recette recette = recetteRepository.findOneById(recipeId);
        List<IngredientLine> ingredientLines = (List<IngredientLine>) ingredientLineRepository.saveAll(recette.getIngredientLines());
        List<Step> steps = (List<Step>) stepRepository.saveAll(recette.getSteps());
        recette.setIngredientLines(ingredientLines);
        recette.setSteps(steps);

        return RecetteParser.toDTO(recette);
    }

    @Override
    public List<RecetteDTO> getAllRecipes() {
        LOGGER.debug("[RecetteServiceImpl, getAllRecipes]");
        return RecetteParser.parseListToDTO(recetteRepository.findAll());
    }

    @Override
    @Transactional
    public RecetteDTO createRecipe(RecetteDTO recipeDTO) {
        LOGGER.debug("[RecetteServiceImpl, createRecipe] recipe = " + recipeDTO.toString());

        Recette recipe = RecetteParser.toEntity(recipeDTO);
        List<IngredientLine> ingredientLines = (List<IngredientLine>) ingredientLineRepository.saveAll(recipe.getIngredientLines());
        List<Step> steps = (List<Step>) stepRepository.saveAll(recipe.getSteps());
        recipe.setIngredientLines(ingredientLines);
        recipe.setSteps(steps);

        return RecetteParser.toDTO(recetteRepository.save(recipe));
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
            ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
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
            ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
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
        //TODO: Uncomment this fucking line
        //newList.sort(Comparator.comparing(o -> o.getIngredientLine().getIngredient().getName()));
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
            recipes.add(recetteRepository.findOneById(integer));
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
