<@layout.extends name="layouts/base.ftl">
		<@layout.put block="head">
        <link href="/css/login.css" rel="stylesheet" type="text/css">
        <link href="/css/signup.css" rel="stylesheet" type="text/css">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
		</@layout.put>
    <body>
		<@layout.put block="contents">

            <div class="container">
                <div class="row col-xs-12 col-sm-12">
                    <form class="form-signin mg-btm" method="POST" action="/signup" autocomplete="off">
                        <#if user??>
                                <div class="circle" style="background-image: url(${user.profile_url})"> </div>
                        </#if>

                        <div class="main">
                            <#if user??>
                            <div class="input-group margin-bottom-sm">
                                <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                                <input class="form-control" type="text" id="input_username" placeholder="Username"  name="username" value="${user.username!""}" required/>
                            </div>
                                    <p class="error_message" id="username_error">Username must contain at least six characters including only lower letters, numbers or underscores.</p>
                            <div class="input-group margin-bottom-sm">
                                <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                                <input class="form-control" id="input_mail" type="email" placeholder="Email address" name="email" value="${user.email!""}" required />
                                <input type="hidden" name="profile_url" value="${user.profile_url}"/>
                            </div>
                                   <p class="error_message" id="mail_error">Invalid Email</p>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                <input class="form-control" id="input_password" type="password" placeholder="Password"  name="password" value="" required />
                            </div>
                                    <p class="error_message" id="password_error">Passwords must contain at least six characters, including letters and numbers.</p>

                            <#else>
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                                    <input class="form-control" id="input_username" type="text"  placeholder="Username"  name="username" required/>
                                </div>
                                <p class="error_message" id="username_error">Username must contain at least six characters including only lower letters, numbers or underscores.</p>
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                                    <input class="form-control" id="input_mail" type="email" placeholder="Email address" name="email" required/>
                                </div>
                                     <p class="error_message" id="mail_error">Invalid Email</p>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                    <input class="form-control" id="input_password" type="password" placeholder="Password"  name="password" value="" required />
                                </div>
                                    <p class="error_message" id="password_error">Passwords must contain at least six characters, including letters and numbers.</p>
                            </#if>
						</div>
                        <div class="login-footer">
                            <div class="row">
                                <div class="col-xs-4 col-md-4 pull-right">
                                    <button id="edit_confirm" type="submit" class="btn btn-large btn-primary pull-right" disabled>Signup</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

		</@layout.put>
    </body>
		<@layout.put block="footer">
        <script src="/js/expression.test.js"></script>
        <script src="/js/login.js"></script>
		</@layout.put>
    </html>
</@layout.extends>