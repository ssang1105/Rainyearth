package com.rainyearth.user;

import com.rainyearth.exceptions.DuplicateEmailException;
import com.rainyearth.exceptions.DuplicateUsernameException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public User create(UserCreateRequestVO userCreateRequestVO) throws DuplicateEmailException, DuplicateUsernameException {
		User user = User.fromVO(userCreateRequestVO);

		if(existUserByEmail(user.getEmail())) {
			throw new DuplicateEmailException("Already registered email address");
		}

		if(existUserByUsername(user.getUsername())) {
			throw new DuplicateUsernameException("Already registered username");
		}

		user.setPassword(passwordEncoder.encode(userCreateRequestVO.getPassword()));
		userRepository.save(user);

		return user;
	}

	public boolean existUserByEmail(String email) {
		User user = findByEmail(email);

		return user != null ? true : false;
	}
	public boolean existUserByUsername(String username) {
		User user = findByUsername(username);
		return user != null ? true : false;
	}

	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
}
