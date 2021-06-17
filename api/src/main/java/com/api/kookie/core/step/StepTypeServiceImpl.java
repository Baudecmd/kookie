package com.api.kookie.core.step;

import com.api.kookie.core.dto.StepTypeDTO;
import com.api.kookie.core.util.StepTypeParser;
import com.api.kookie.data.entity.StepType;
import com.api.kookie.data.step.StepTypeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class StepTypeServiceImpl implements StepTypeService {

    private static final Logger LOGGER = LoggerFactory.getLogger(StepTypeServiceImpl.class);

    @Autowired
    StepTypeRepository stepTypeRepository;

    @Override
    public List<StepTypeDTO> getAllStepTypes() {
        LOGGER.debug("[StepTypeServiceImpl, getAllStepTypes]");

        List<StepType> stepTypes = new ArrayList<>();
        stepTypeRepository.findAll().forEach(stepTypes::add);
        return StepTypeParser.parseListToDTO(stepTypes);
    }
}
