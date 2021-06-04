package com.api.kookie.core.opinion;

import com.api.kookie.core.dto.OpinionDTO;

public interface OpinionService {
    Boolean addOpinion(OpinionDTO opinion);

    Boolean updateOpinion(OpinionDTO opinion);
}
