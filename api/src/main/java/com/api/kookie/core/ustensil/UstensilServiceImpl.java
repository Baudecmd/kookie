package com.api.kookie.core.ustensil;

import com.api.kookie.core.dto.UstensilDTO;
import com.api.kookie.core.util.UstensilParser;
import com.api.kookie.data.entity.Utensil.Utensil;
import com.api.kookie.data.utensil.UtensilRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class UstensilServiceImpl implements UstensilService {

    @Autowired
    UtensilRepository utensilRepository;

    @Override
    public List<UstensilDTO> getAllUstensil() {
        return UstensilParser.parseListToDTO((List<Utensil>) utensilRepository.findAll());
    }
}
