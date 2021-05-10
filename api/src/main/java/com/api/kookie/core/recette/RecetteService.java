package com.api.kookie.core.recette;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.dto.RecetteThumbnailDTO;

import java.util.List;

public interface RecetteService {
    List<RecetteDTO> searchByString(String s);

    List<RecetteThumbnailDTO> getAllRecettesThumbnails(Integer profileId);
}
