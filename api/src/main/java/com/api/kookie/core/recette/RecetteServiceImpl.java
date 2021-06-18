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
import com.api.kookie.data.recipe.RecipeRepository;
import com.api.kookie.data.recipe.RecipeCategoryRepository;
import com.api.kookie.data.step.StepRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

import static java.util.Comparator.comparingInt;
import static java.util.stream.Collectors.collectingAndThen;
import static java.util.stream.Collectors.toCollection;

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
                .map(Recipe::getId).collect(toCollection(ArrayList::new));
        recipe.setIsFavorite(favoritesRecettesId.contains(favoritesRecettesId));

        return recipe;
    }

    @Override
    public List<RecetteDTO> getAllRecipes(Integer profileId) {
        LOGGER.debug("[RecetteServiceImpl, getAllRecipes] profileId = " + profileId);

        Profile profile = profileRepository.findOneById(profileId);
        ArrayList<Integer> favoritesRecettesId = profile.getFavoriteRecettes().stream()
                .map(Recipe::getId).collect(toCollection(ArrayList::new));
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

        return RecetteParser.toDTO(recipeRepository.save(recipe));
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
                    .map(Recipe::getId).collect(toCollection(ArrayList::new));
            for (Recipe r : recipes) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getName());
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
                    .map(Recipe::getId).collect(toCollection(ArrayList::new));
            for (Recipe r : recipeCategory.getRecipes()) {
                RecetteThumbnailDTO thumbnailDTO = new RecetteThumbnailDTO();
                thumbnailDTO.setId(r.getId());
                thumbnailDTO.setName(r.getName());
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
        //TODO: Uncomment this line
        //newList.sort(Comparator.comparing(o -> o.getIngredientLine().getIngredient().getName()));
        return newList;
    }

    private List<StepDTO> removeDuplicate(List<StepDTO> steps){
        Set<String> nameSet = new HashSet<>();
        List<StepDTO> stepsDistinct = steps.stream()
                .filter(e -> nameSet.add(e.getName()))
                .collect(Collectors.toList());


        return stepsDistinct;
    }

    @Override
    public List<StepDTO> optimizeRecipes(List<Integer> ids, Profile profile) {
        List<StepDTO> steps = getAllStepsDTOs(ids);
        steps = organizeSteps(steps);

        return removeDuplicate(steps);
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
