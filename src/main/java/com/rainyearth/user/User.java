package com.rainyearth.user;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.persistence.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;

@Entity
@Table(name = "Users")
@DynamicInsert
@DynamicUpdate
public class User implements Serializable {

    static final Logger log = LoggerFactory.getLogger(User.class);

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "username")

	private String username;

	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password;

    @Lob
	@Column(name = "profile_url", length=16777215)
	private byte[] profile_url;

	@Column(name = "registered_date")
	private String registeredDate;

	@Column(name = "user_description")
	private String description;

	@Column(name = "gender")
	private String gender;

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "username", unique = true, nullable = false)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

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

	public byte[] getProfile_url() {
		return profile_url;
	}

	public void setProfile_url(byte[] profile_url) {
		this.profile_url = profile_url;
	}



	public static User fromVO(UserCreateRequestVO userCreateRequestVO) {

		DateTimeZone seoul = DateTimeZone.forID("Asia/Seoul");
		DateTime theTime = new DateTime(seoul);

		User user = new User();
		user.setUsername(userCreateRequestVO.getUsername());
		user.setEmail(userCreateRequestVO.getEmail());
		user.setRegisteredDate(theTime.toString());

        try {

            if(!StringUtils.isEmpty(userCreateRequestVO.getProfile_url())) {

                URL url = new URL(userCreateRequestVO.getProfile_url());

                user.setProfile_url(encodeToString(ImageIO.read(url), "png").getBytes());
                log.error("cccc" + encodeToString(ImageIO.read(url), "png"));

            } else{
                byte[] defaultImage = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAPFBMVEXx8PCqqqmnp6bPz8708/Otrazu7e3b2trr6uqkpKPV1NTk4+OysrHi4eGpqKi1tLTCwsG9vLzIx8fKycmjmqMNAAAFMElEQVR4nO2dCZqjIBBGBUtx33L/u47Enulk0okKv1LY9U7g+1iqKBCSRBAEQRAEQRAEQRAEQRAEQRAEQRDig74J/Sl4ZqmiNVWVWqrKtMWlNGcZcxv7JlNKW5TKmn68mYtIUlJU4+L1Tbe4jlWRxC5JiZmaJ7lHtG4mE7Xj3DvH7K3fIpmNJt7OmrdN+dnv7lg2bR76U52gelq1+8tUR9iMZJpus2HXmNgUqRjW++dTXx2KqByp7vcJzop9TD2V2t2CVrGNRpEqtV9wVlRVJIpktk8xz3RxzDdkMkfBOV+NQZFad8FZMYKxWLxPQzegmyK0wCo74+CL4hBaYI3UT3BWTEMrfMRvEC7wHorkEOlfGrFnbEjeffSumPJVrBuAoFJNHVrkLalrMvNMx3ayqf2nmYWMaSPSDTEKLfrGcyQSqgnnRmRpSAbVhHMjsszAaQQajhwNQaFigWPAmBf2SDgu9ydcJ5276RRa55ViBAoqNfJbJ9ZQQaXYDURkrLDwixeYZcWDIbsFBjIa3g3ZRUTqoYJKsVsHA5PSBXapKYEFlWJniB2G80BkZ1iCDUsxPJtfYHj9cXh9Q7Agw2hx/Yh//awNuwCel8DsDD13Rv9HD+wMoWUaW6hhZ3j9FfDlqxhJDTZkV4nCba0tMNxgK7ABsedXL82hpSg9MjwYffmqPjZc8AsWfkcSX2F5SPHy+4dJjpxMe4YTDTT35pd3W6gCGnLcAp5jPq7cVvKL95bLn6cBDkSewxC5gGK4dFooUBGR7XH2HNRN9cAxGlpgh4Z4xgrL9c8IJ5A1oh5Da7wHk9YwTWgWMPszjAUhQZ9ruP+i9T+t37WhJT7iHxL5BsMFQEjkPM9YvMumDAulz/gGDNah4gu/VWIW+vPX8aubcqyTvuA1EtmPwjs+02kV+uM34VE4ZVkmfYVa15GoWf8C/IDrmW9+Z7vf4vhHd8Y7I30idTJk+3PsDxQO/VQz/BHoPVTvr/CXMd0x5JLZRJHNPLL34ALLowmf2VlZ5FxBfAO1uwxjifWP0J6QEdsg/GLaWpbqGJ6e2cbWc8OMi9wrXN5w81o4jnXvD7RbA0YTUcr9CJmNgkpx3dVeY/NtLvoW+lPd2JHVRJjRJPuS7+jS7jv5Zj9LdHn33sVFhEuL3YWMmEoYFoddtgi2ZB5JHaoYMbViftvtZ7nFMhbJcW+mm/PTGHoqFWnnXNXv0ggcjde5KD2a0AKfoXpYee1hVTEb+NZNKW+HDa89rDqWQ5tzlKTcDE5Xsf/gqAbDzpEoXXuNZJdjNqacXi6x3RPUfA+Sik1npboanOPDR8duqMLPOkT11MDb75+jaqY6ZG+lvK62vJXjJVk2VR2ot9rJEzi5fJDMgkytlKT9KX6LY5+e+/CVnTz1WXpfkvrEqdV2z0MmzxXH7qTOSmT6wybPFUfVH/+CGeWV1wsd3pJNdXA7GvA1NA6Ow4HrK0rOCQ8ritlw1LyaVwz8LDqrjqjoUDGENnvggFfaqAZfMuuHHtE5ueNDY8cBf8Js+2bneSDnVOytHiiAt4Ps2K4+F5hiwbEFLRnqDEfwPOYdqCfMsM86YIH8nwG+xAsL4qwR8lIWPIhf3eBXr2IB3ILSoi95xlJ6HxjDPVN1DP6PX0HvtzoC75/BoHeUHYHvgbE5I8W8h3cYvtkp+BWnI/CMF+jLc/H4HvoTw/CIoRiKYXjEUAx/gSHXQuI3viVFSpXmDODfTDIpZxBFYeKNv6AgCIIgCIIgCIIgCIIgCIIgCIIgbOQPjhtTsLz54x0AAAAASUVORK5CYII=".getBytes();
                user.setProfile_url(defaultImage);
                //
            }
        }  catch (Exception e) {
            log.error("Exception while reading the Image " + e);
        }

		return user;
	}

	public String getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(String theTime) {
		this.registeredDate =theTime.toString();
	}

    public static byte[] encodeImage(byte[] imageByteArray) {
        return Base64.encodeBase64URLSafe(imageByteArray);
    }

    public static String encodeToString(BufferedImage image, String type) {
        String imageString = null;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();



        try {
            ImageIO.write(image, type, bos);
            byte[] imageBytes = bos.toByteArray();

            imageString = Base64.encodeBase64String(imageBytes);
            StringBuilder sb = new StringBuilder();
            sb.append("data:image/png;base64,");
            sb.append(imageString);
            imageString  = sb.toString();


            bos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imageString;
    }

}
