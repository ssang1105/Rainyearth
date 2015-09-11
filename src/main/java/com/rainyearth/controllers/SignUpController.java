package com.rainyearth.controllers;

import com.rainyearth.social.FrontUserDetail;
import com.rainyearth.user.User;
import com.rainyearth.user.UserCreateRequestVO;
import com.rainyearth.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

@Controller
public class SignUpController {

	static final Logger log = LoggerFactory.getLogger(SignUpController.class);

	@Autowired
	private ProviderSignInUtils providerSignInUtils;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String redirectRequestToRegistrationPage(WebRequest request, ModelMap modelMap) {
        try {
            Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
            UserProfile userProfile = connection.fetchUserProfile();
            UserCreateRequestVO userCreateRequestVO = UserCreateRequestVO.fromSocialUserProfile(userProfile,connection);
            modelMap.put("user", userCreateRequestVO);
        } catch (NullPointerException e){
            e.printStackTrace();
        } finally {
			return "signup";
		}

	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registrationUser(@ModelAttribute UserCreateRequestVO userCreateRequestVO, WebRequest request,Model model) throws Exception {
		try {
			User user = userService.create(userCreateRequestVO);
			providerSignInUtils.doPostSignUp(user.getEmail(), request);
			FrontUserDetail frontUserDetail = new FrontUserDetail(user);

			Authentication authentication = new UsernamePasswordAuthenticationToken(frontUserDetail, null, frontUserDetail.getAuthorities());

			SecurityContextHolder.getContext().setAuthentication(authentication);

			// log.trace("UserID", frontUserDetail.getUsername()); // User ID
			// authentication : login 유저 정보


			return "redirect:/";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return String.format("redirect:/error?message=%s", e.getMessage());
		}
	}
}
