package com.rainyearth;

import com.rainyearth.security.CustomLoginFailureHandler;
import com.rainyearth.security.UserDetailsService;
import com.rainyearth.social.SocialUsersDetailService;
import org.h2.server.web.WebServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.embedded.EnableEmbeddedRedis;
import org.springframework.embedded.RedisServerPort;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.social.security.SpringSocialConfigurer;

@EnableEmbeddedRedis
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 864000)
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http
                .headers()
                .frameOptions()
                .disable()
                .and()
				.csrf().disable()
                .anonymous()
			.and()
                .formLogin()
				.loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
				.defaultSuccessUrl("/", true)
				.loginProcessingUrl("/login/authenticate")
				.failureHandler(new CustomLoginFailureHandler())
            .and()
                .logout()
                .deleteCookies("SESSION")
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
			.and()
				.authorizeRequests()
				.antMatchers(
                        "/auth/**",
                        "/login",
                        "/error",
                        "/signup",
                        "/hello",
                        "/css/**",
                        "/js/**"

                ).permitAll()
				.antMatchers(
						"/video",
						"/video/*",
						"/profile",
						"/profile/*"
						)
				.hasRole("USER")
			.and()
				.apply(new SpringSocialConfigurer());
	}

	@Bean
	public SocialUserDetailsService socialUsersDetailService() {
		return new SocialUsersDetailService(userDetailsService);
	}


	/**
	 * AuthenticationManager를 LoginController에서 사용하기 위해서는 반드시, @Bean으로 등록되어야지 한다.
	 */
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	/**
	 * UserDetailService와 PasswordEncoder를 이용해서, AuthenticationProvider를 구성한다.
	 */
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
		daoAuthenticationProvider.setUserDetailsService(userDetailsService);
		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
		daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
		return daoAuthenticationProvider;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(daoAuthenticationProvider());
	}

	/**
	 * UserDetailsService를 구성해준다. Bean Name은 반드시 BeanIds.USER_DETAILS_SERVICE로 등록되어야한다.
	 */

	@Override
	protected UserDetailsService userDetailsService() {
		return userDetailsService;
	}
//
	@Bean
	public JedisConnectionFactory connectionFactory(@RedisServerPort int port) {
		JedisConnectionFactory connection = new JedisConnectionFactory();
		connection.setPort(port);
		return connection;
	}



//    @Bean
//    public ServletRegistrationBean h2servletRegistration() {
//        ServletRegistrationBean registration = new ServletRegistrationBean(new WebServlet());
//        registration.addUrlMappings("/h2console/*");
//        return registration;
//    }
}
