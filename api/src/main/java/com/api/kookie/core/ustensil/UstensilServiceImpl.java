package com.api.kookie.core.ustensil;

import com.api.kookie.core.dto.RecetteDTO;
import com.api.kookie.core.util.RecetteParser;
import com.api.kookie.data.category.CategoryRepository;
import com.api.kookie.data.entity.Category;
import com.api.kookie.data.entity.Recette;
import com.api.kookie.data.entity.Ustensil.Ustensil;
import com.api.kookie.data.recette.RecetteRepository;
import com.api.kookie.data.ustensil.UstensilRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
        import java.util.ArrayList;
        import java.util.List;

@Service
@Transactional(readOnly = true)
public class UstensilServiceImpl implements UstensilService {

    @Autowired
    UstensilRepository ustensilRepository;

    @Override
    public List<Ustensil> getAllUstensil() {
        return (List<Ustensil>) ustensilRepository.findAll();
    }
}
