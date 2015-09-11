package com.rainyearth.video;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by SW on 2015. 8. 29..
 */
@Service
public class VideoService {

    static final Logger log = LoggerFactory.getLogger(VideoService.class);
    @Autowired
    private VideoRepository videoRepository;

    public Video create(VideoCreateRequestVO videoCreateRequestVO){
        Video video = Video.fromVO(videoCreateRequestVO);

        log.error("Video Upload User : " + video.getUploadUser());
        log.error("Video ID : " + video.getVideoId());
        log.error("Video URL : " + video.getVideoUrl());

        videoRepository.save(video);

        return video;
    }


    public Video findByUploadUser(String username) {
        return videoRepository.findByUploadUser(username);
    }
    public Video findByTags(String tag) {
        return videoRepository.findByTags(tag);
    }
}
