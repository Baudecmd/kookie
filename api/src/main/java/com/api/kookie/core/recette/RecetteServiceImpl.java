package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;
import com.api.kookie.core.dto.StepDTO;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.core.util.StepParser;
import com.api.kookie.data.entity.*;
import com.api.kookie.data.entity.ingredient.IngredientLine;
import com.api.kookie.data.ingredient.IngredientLineRepository;
import com.api.kookie.data.profile.ProfileRepository;
import com.api.kookie.data.recipe.RecipeCategoryRepository;
import com.api.kookie.data.recipe.RecipeRepository;
import com.api.kookie.data.step.StepRepository;
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
    RecipeRepository recipeRepository;

    @Autowired
    ProfileRepository profileRepository;

    @Autowired
    RecipeCategoryRepository recipeCategoryRepository;

    @Autowired
    IngredientLineRepository ingredientLineRepository;

    @Autowired
    StepRepository stepRepository;

    @Override
    public RecetteDTO getOneById(Integer profileId, Integer recipeId) {
        LOGGER.debug("[RecetteServiceImpl, getOneById] profileId = " + profileId + " recipeId = " + recipeId);

        RecetteDTO recipe = RecetteParser.toDTO(recipeRepository.findOneById(recipeId));
        Profile profile = profileRepository.findOneById(profileId);
        ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                .map(Recipe::getId).collect(Collectors.toCollection(ArrayList::new));
        recipe.setIsFavorite(favoritesRecettesId.contains(favoritesRecettesId));

        return recipe;
    }

    @Override
    public List<RecetteDTO> getAllRecipes(Integer profileId) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecipes] profileId = " + profileId);

        Profile profile = profileRepository.findOneById(profileId);
        ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                .map(Recipe::getId).collect(Collectors.toCollection(ArrayList::new));
        List<RecetteDTO> recipes = RecetteParser.parseListToDTO(recipeRepository.findAll());
        for (RecetteDTO r : recipes) {
            r.setIsFavorite(favoritesRecettesId.contains(favoritesRecettesId));
        }
        return recipes;
    }

    @Override
    @Transactional
    public RecetteDTO createRecipe(RecetteDTO recipeDTO) {
        LOGGER.debug("[RecetteServiceImpl, createRecipe] recipe = " + recipeDTO.toString());

        Recipe recipe = RecetteParser.toEntity(recipeDTO);
        List<IngredientLine> ingredientLines = (List<IngredientLine>) ingredientLineRepository.saveAll(recipe.getIngredientLines());
        List<Step> steps = (List<Step>) stepRepository.saveAll(recipe.getSteps());
        recipe.setIngredientLines(ingredientLines);
        recipe.setSteps(steps);
        Recipe savedRecipe = recipeRepository.save(recipe);
        RecipeCategory category = recipeCategoryRepository.findOneById(savedRecipe.getCategory().getId());
        category.getRecipes().add(savedRecipe);
        recipeCategoryRepository.save(category);
        Profile profile = profileRepository.findOneById(savedRecipe.getCreator().getId());
        profile.getCreatedRecettes().add(savedRecipe);
        profileRepository.save(profile);
        return RecetteParser.toDTO(savedRecipe);
    }

    @Override
    public List<RecetteDTO> searchByString(String s) {
        ArrayList<Recipe> recipeArrayList = (ArrayList<Recipe>) recipeRepository.findAllByName(s);
        return RecetteParser.parseListToDTO(recipeArrayList);
    }

    @Override
    public List<RecetteThumbnailDTO> getAllRecipesThumbnails(Integer profileId) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecettesThumbnails] profileId = " + profileId);

        Profile profile = profileRepository.findOneById(profileId);

        List<Recipe> recipes = recipeRepository.findAll();
        List<RecetteThumbnailDTO> thumbnails = new ArrayList<>();

        if (recipes != null && profile != null) {
            ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                    .map(Recipe::getId).collect(Collectors.toCollection(ArrayList::new));
            for (Recipe r : recipes) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getName());
                thumbnailDTO.setImage(r.getImage());
                int sumNotes = r.getOpinions().stream().map(Opinion::getNote).reduce(0, Integer::sum);
                if (r.getOpinions().size() != 0) thumbnailDTO.setNote(sumNotes / r.getOpinions().size());
                thumbnailDTO.setIsFavorite(favoritesRecettesId.contains(favoritesRecettesId));
                thumbnails.add(thumbnailDTO);
            }
        }
        return thumbnails;
    }

    @Override
    public List<RecetteThumbnailDTO> getAllRecipesThumbnailsByCategoryId(Integer categoryId, Integer profileId) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecipesThumbnailsByCategoryId] categoryId = " + categoryId + " profileId=" + profileId);

        Profile profile = profileRepository.findOneById(profileId);
        RecipeCategory recipeCategory = recipeCategoryRepository.findOneById(categoryId);

        List<RecetteThumbnailDTO> thumbnails = new ArrayList<>();

        if (recipeCategory.getRecipes() != null && recipeCategory != null) {
            ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                    .map(Recipe::getId).collect(Collectors.toCollection(ArrayList::new));
            for (Recipe r : recipeCategory.getRecipes()) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getName());
                thumbnailDTO.setImage(r.getImage());
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

    public List<Recipe> getAllRecipesByIdList(List<Integer> ids){
        List<Recipe> recipes = new ArrayList<>();
        for(Integer integer: ids){
            recipes.add(recipeRepository.findOneById(integer));
        }
        return recipes;
    }

    public List<StepDTO> getAllStepsDTOs(List<Integer> ids) {
        List<StepDTO> steps = new ArrayList<>();
        List<Recipe> recipes = getAllRecipesByIdList(ids);
        for(Recipe recipe: recipes){
            steps.addAll(StepParser.parseListToDTO(recipe.getSteps()));
        }
        return steps;
    }
}
