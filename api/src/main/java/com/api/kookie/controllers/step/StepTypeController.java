package com.api.kookie.controllers.step;

import com.api.kookie.core.dto.StepTypeDTO;
import com.api.kookie.core.step.StepTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "stepType", produces = "application/json; charset=utf-8")
public class StepTypeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(StepTypeController.class);

    @Autowired
    StepTypeService stepTypeService;

    @GetMapping("/all")
    public ResponseEntity<List<StepTypeDTO>> getAllStepTypes() {
        LOGGER.debug("[StepTypeController, getAllStepTypes]");

        return ResponseEntity.status(HttpStatus.OK).body(stepTypeService.getAllStepTypes());
    }
}
