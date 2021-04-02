package com.api.kookie.core.category;

import com.api.kookie.core.dto.CategoryDTO;
import com.api.kookie.core.util.CategoryParser;
import com.api.kookie.data.category.CategoryRepository;
import com.api.kookie.data.entity.Category;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class CategoryServiceImpl implements CategoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CategoryService.class);

    @Autowired
    CategoryRepository categoryRepository;

    public List<CategoryDTO> getAllCategories() {

        LOGGER.debug("[CategoryService, getAllCategories]");

        List<Category> categories = new ArrayList<>();
        categoryRepository.findAll().forEach(categories::add);
        return CategoryParser.parseListToDTO(categories);
    }
}
