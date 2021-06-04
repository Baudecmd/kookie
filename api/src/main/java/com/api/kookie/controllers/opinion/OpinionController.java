package com.api.kookie.controllers.opinion;

import com.api.kookie.core.dto.OpinionDTO;
import com.api.kookie.core.opinion.OpinionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/opinion", produces = "application/json; charset=utf-8")
public class OpinionController {

    private static final Logger LOGGER = LoggerFactory.getLogger(OpinionController.class);

    @Autowired
    OpinionService opinionService;

    @PostMapping("/add")
    public ResponseEntity<Boolean> addOpinion(@RequestBody OpinionDTO opinion) {
        LOGGER.debug("[OpinionController, addOpinion] opinionDTO : " + opinion.toString());

        if (opinion == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(false);
        } else {
            Boolean added = opinionService.addOpinion(opinion);
            if (added != null) {
                if (added) {
                    return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(true);
                } else {
                    return ResponseEntity.status(HttpStatus.CONFLICT).contentType(MediaType.APPLICATION_JSON).body(false);
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(false);
            }
        }
    }

    @PostMapping("/update")
    public ResponseEntity<Boolean> updateOpinion(@RequestBody OpinionDTO opinion) {
        LOGGER.debug("[OpinionController, updateOpinion] opinionDTO : " + opinion.toString());

        if (opinion == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).contentType(MediaType.APPLICATION_JSON).body(false);
        } else {
            Boolean added = opinionService.updateOpinion(opinion);
            if (added != null) {
                if (added) {
                    return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(true);
                } else {
                    return ResponseEntity.status(HttpStatus.CONFLICT).contentType(MediaType.APPLICATION_JSON).body(false);
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).contentType(MediaType.APPLICATION_JSON).body(false);
            }
        }
    }


}
