package com.rainyearth.response;

/**
 * Created by SW on 2015. 8. 29..
 */
public class VideoUploadResponse {

    private boolean is_upload;

    private String error_msg;

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public boolean is_upload() {
        return is_upload;
    }

    public void setIs_upload(boolean is_upload) {
        this.is_upload = is_upload;
    }
}
