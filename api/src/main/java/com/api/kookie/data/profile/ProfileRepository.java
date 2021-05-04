package com.api.kookie.data.profile;

import com.api.kookie.data.entity.Profile;
import org.springframework.data.repository.CrudRepository;

public interface ProfileRepository extends CrudRepository<Profile, Integer> {

    Profile findOneByUser_Username(String username);

    Profile findOneByProfileId(Integer profileId);
}
