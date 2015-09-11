package com.rainyearth.video;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VideoRepository extends CrudRepository<Video, Long> {

    Video findByUploadUser(String username);
    Video findByTags(String tags);

}
