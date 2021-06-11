package com.api.kookie.core.recette;

import java.util.List;

public class OptimizationListBody {

    public List<Integer> recipesIds;
    public Integer profileId;

    public OptimizationListBody(List<Integer> recipesIds, Integer profileId) {
        this.recipesIds = recipesIds;
        this.profileId = profileId;
    }
}
