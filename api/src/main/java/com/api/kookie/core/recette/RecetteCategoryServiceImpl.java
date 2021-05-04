package com.api.kookie.core.recette;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.util.RecetteCategoryParser;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.data.entity.RecetteCategory;
import com.api.kookie.data.recette.RecetteCategoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class RecetteCategoryServiceImpl implements RecetteCategoryService {


    private static final Logger LOGGER = LoggerFactory.getLogger(RecetteCategoryServiceImpl.class);

    @Autowired
    RecetteCategoryRepository recetteCategoryRepository;

    public List<CategoryDTO> getAllCategories() {

        LOGGER.debug("[RecetteCategoryService, getAllCategories]");

        List<RecetteCategory> categories = new ArrayList<>();
        recetteCategoryRepository.findAll().forEach(categories::add);
        return RecetteCategoryParser.parseListToDTO(categories);
    }

    public List<RecetteDTO> getAllByCategoryId(Integer categoryId) {

        LOGGER.debug("[RecetteCategoryService, getAllByCategoryId] categoryId = " + categoryId);

        RecetteCategory category = recetteCategoryRepository.findOneById(categoryId);

        if (category != null) {
            return RecetteParser.parseListToDTO(category.getRecettes());
        }
        return null;
    }
}

