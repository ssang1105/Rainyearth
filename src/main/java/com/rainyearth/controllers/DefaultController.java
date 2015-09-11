package com.rainyearth.controllers;

import com.rainyearth.social.FrontUserDetail;
import com.rainyearth.user.User;
import com.rainyearth.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class DefaultController {

	@Autowired
	private UserRepository userRepository;

	@RequestMapping(value = "/")
	public String home(@AuthenticationPrincipal FrontUserDetail userDetail, HttpSession session,Model model) {



		try {
			// NPE안나게 수정
			if(userDetail.getUsername() != null ) {
				model.addAttribute("email", userDetail.getUsername());
				model.addAttribute("name", userDetail.getUserAppId());
				model.addAttribute("profile_url", userDetail.getProfileUrl());
				session.setAttribute("login_user", userDetail.getUserAppId());
			}

		} catch (NullPointerException e){
			e.printStackTrace();
		} finally {
			return "hello";
		}

	}

	@RequestMapping(value = "/error")
	public String error(@RequestParam String message, Model model) {
		model.addAttribute("message", message);
		return "error";
	}

	@RequestMapping("/users")
	public @ResponseBody
	Iterable<User> getUserList() {
		return userRepository.findAll();
	}

}
