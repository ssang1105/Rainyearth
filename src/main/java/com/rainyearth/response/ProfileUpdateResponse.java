package com.rainyearth.response;

/**
 * Created by SW on 2015. 8. 19..
 */
public class ProfileUpdateResponse {

    private boolean is_update;
    private String error_msg;


    public boolean is_update() {
        return is_update;
    }

    public void setIs_update(boolean is_update) {
        this.is_update = is_update;
    }
    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }
}
