package com.rainyearth.user;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.util.StringUtils;

public class UserCreateRequestVO {

	private String email;

	private String password;

	private String username;

	private String profile_url;

	private String registeredDate;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username= username;
	}

	public String getProfile_url() {
		return profile_url;
	}

	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}

	public String getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(String registeredDate) {
		this.registeredDate = registeredDate;
	}

	public static UserCreateRequestVO fromSocialUserProfile(UserProfile userProfile, Connection connectionUser){

		DateTimeZone seoul = DateTimeZone.forID("Asia/Seoul");
		DateTime theTime = new DateTime(seoul);

		UserCreateRequestVO userCreateRequestVO = new UserCreateRequestVO();
		userCreateRequestVO.setEmail(StringUtils.isEmpty(userProfile.getEmail()) ? "" : userProfile.getEmail());
		userCreateRequestVO.setUsername(StringUtils.isEmpty(userProfile.getUsername()) ? "" : userProfile.getUsername());
		userCreateRequestVO.setRegisteredDate(theTime.toString());

		if(connectionUser.getApi().toString().contains("Facebook"))
			userCreateRequestVO.setProfile_url(connectionUser.getImageUrl() + "?type=large");
		else if(connectionUser.getApi().toString().contains("Twitter"))
			userCreateRequestVO.setProfile_url(connectionUser.getImageUrl().replace("_normal.jpg",".jpg"));


		userCreateRequestVO.setProfile_url(userCreateRequestVO.getProfile_url());
		return userCreateRequestVO;
	}
}
