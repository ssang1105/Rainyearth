package com.rainyearth.video;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by SW on 2015. 8. 28..
 */
@Entity
@Table(name = "Videos")
@DynamicInsert
@DynamicUpdate
public class Video implements Serializable{

    static final Logger log = LoggerFactory.getLogger(Video.class);

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "video_url")
    private String videoUrl;

    @Column(name = "video_title")
    private String videoTitle;

    @Column(name = "video_desc")
    private String videoDesc;

    @Column(name = "video_tags")
    private String[] tags;

    private String uploadUser;

    @Column(name = "registered_date")
    private String registeredDate;

    @Column(name = "clicked_number")
    private long clickedNumber;

    @Column(name = "like_number")
    private long like;



    @Column(name = "video_id")
    private String videoId;


    public String[] getVideoTags() {
        return tags;
    }

    public void setVideoTags(String[] tags) {
        this.tags = tags;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getVideoTitle() {
        return videoTitle;
    }

    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle;
    }

    public String getVideoDesc() {
        return videoDesc;
    }

    public void setVideoDesc(String videoDesc) {
        this.videoDesc = videoDesc;
    }

    public long getLike() {
        return like;
    }

    public void setLike(long like) {
        this.like = like;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "username", nullable = false)
    public String getUploadUser() {
        return uploadUser;
    }

    public void setUploadUser(String uploadUser) {
        this.uploadUser = uploadUser;
    }

    public String getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(String registeredDate) {
        this.registeredDate = registeredDate;
    }

    public long getClickedNumber() {
        return clickedNumber;
    }

    public void setClickedNumber(long clickedNumber) {
        this.clickedNumber = clickedNumber;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public String[] getTags() {
        return tags;
    }

    public void setTags(String[] tags) {
        this.tags = tags;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public static Video fromVO(VideoCreateRequestVO videoCreateRequestVO){
        DateTimeZone seoul = DateTimeZone.forID("Asia/Seoul");
        DateTime theTime = new DateTime(seoul);

        //https://youtu.be/gRxrBDF0JrA 이런 양식
        String inputUrl = videoCreateRequestVO.getVideoUrl();

        String videoId = inputUrl.substring(inputUrl.indexOf("youtu.be") + 9, inputUrl.length());
        StringBuffer videoUrl = new StringBuffer("https://www.youtube.com/embed/");
        videoUrl.append(videoId);

        Video video= new Video();
        video.setVideoTitle(videoCreateRequestVO.getVideoTitle());
        video.setVideoDesc(videoCreateRequestVO.getVideoDesc());
        video.setVideoUrl(videoUrl.toString());
        video.setVideoId(videoId);
        video.setVideoTags(videoCreateRequestVO.getVideoTags());
        video.setRegisteredDate(theTime.toString());
        video.setUploadUser(videoCreateRequestVO.getUploadUser());



        return video;
    }
}
