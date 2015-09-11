package com.rainyearth.controllers;

import com.rainyearth.exceptions.DuplicateEmailException;
import com.rainyearth.exceptions.DuplicateUsernameException;
import com.rainyearth.response.ProfileUpdateResponse;
import com.rainyearth.user.User;
import com.rainyearth.user.UserRepository;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by SW on 2015. 8. 12..
 */
@Controller
public class ProfileController {

    static final Logger log = LoggerFactory.getLogger(ProfileController.class);

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/profile/*", method = RequestMethod.GET)
    public String redirectToProfilePage( HttpServletRequest request, HttpSession session, Model model, ModelMap modelMap){
        // 나중에 서버에 올리면 바꾸어야 해
        String param = request.getRequestURI().substring(9); // /profile/*
        User request_user =  userRepository.findByUsername(param);
        String login_user = session.getAttribute("login_user").toString();

//        byte[] decoded = Base64.decodeBase64(request_user.getProfile_url());

        // 프로필 이미지가 없으면 npe남.
        // base64 인코딩 디코딩문제 해결하면 될듯.
        if(login_user.equals(request_user.getUsername())){
            model.addAttribute("is_login", "OK");
        }


        modelMap.put("user", request_user);
//        model.addAttribute("decoode_url", decoded.toString());

        return "profile";
    }

    @RequestMapping(value = "/profile/*", method = RequestMethod.POST, produces = "application/json")
    public @ResponseBody Object updateProfile( HttpServletRequest request, HttpSession session, Model model, ModelMap modelMap) throws Exception {
        // ********************* 나중에 서버에 올리면 바꾸어야 해 *********************  //
        String login_user = session.getAttribute("login_user").toString();
        ProfileUpdateResponse profileUpdateResponse = new ProfileUpdateResponse();
        profileUpdateResponse.setIs_update(false);

        User current_user = userRepository.findByUsername(login_user);

        try {

            byte[] edit_profile_url = request.getParameter("profile_url").getBytes();
            String edit_username = request.getParameter("user_name");
            String edit_email = request.getParameter("email");
            String edit_desc = request.getParameter("desc");
            String edit_gender = request.getParameter("gender");

            // 현재 로긴한 유저의 이름과 수정하려 유저의 이름과 다를때만 검사, 아니면 그냥 같아도 update
            // DB에 이미 존재 하는 username인 경우
            if (    (!current_user.getUsername().equals(edit_username)) &&
                    userRepository.findByUsername(edit_username).getId() > 0) {
                throw new DuplicateUsernameException("Already registered username");
            }
            // 현재 로긴한 유저의 email과 수정하려 유저의 email과 다를때만 검사, 아니면 그냥 같아도 update
            // DB에 이미 존재 하는 email인 경우
            else if (   (!current_user.getEmail().equals(edit_email)) &&
                        userRepository.findByEmail(edit_email).getId() > 0) {

                throw new DuplicateEmailException("Already registered email address");
            }
            else{
                current_user.setProfile_url(edit_profile_url);
                current_user.setUsername(edit_username);
                current_user.setEmail(edit_email);
                current_user.setDescription(edit_desc);
                current_user.setGender(edit_gender);
                userRepository.save(current_user);
                session.setAttribute("login_user", edit_username);
            }

        }
        catch (Exception e){
            profileUpdateResponse.setError_msg(e.getMessage());
            profileUpdateResponse.setIs_update(false);
            log.error("ProfileUpdateException " + e.getMessage());
            return profileUpdateResponse;
        }

        profileUpdateResponse.setError_msg("none error");
        profileUpdateResponse.setIs_update(true);
        return profileUpdateResponse;

    }
}
