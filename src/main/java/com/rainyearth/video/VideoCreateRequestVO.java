package com.rainyearth.video;

/**
 * Created by SW on 2015. 8. 29..
 */
public class VideoCreateRequestVO {

    private String videoUrl;

    private String videoTitle;

    private String videoDesc;

    private String[] videoTags;

    private String uploadUser;

    private String registeredDate;

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

    public String[] getVideoTags() {
        return videoTags;
    }

    public void setVideoTags(String[] videoTags) {
        this.videoTags = videoTags;
    }

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

}
