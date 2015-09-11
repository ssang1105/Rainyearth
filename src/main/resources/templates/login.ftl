<@layout.extends name="layouts/base.ftl">
<!DOCTYPE html>
<html>
    <@layout.put block="head">
        <link href="/css/login.css" rel="stylesheet" type="text/css">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    </@layout.put>

<body>

    <@layout.put block="contents">
        <div class="container">
            <div class="row col-xs-12 col-sm-12">
                <form class="form-signin mg-btm" method="POST" action="/login/authenticate" autocomplete="off">
                    <h3 class="heading-desc">Login to Rainyearth</h3>

                    <div class="row margin-bottom-sm omb_socialButtons row-centered">
                        <div class="col-xs-4 col-sm-4 col-centered" onclick="document.facebook.submit();">
                            <a href="#" class="btn btn-lg btn-block btn-facebook omb_btn-facebook">
                                <i class="fa fa-facebook fa-2x"></i>
                            </a>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-centered" onclick="document.twitter.submit();">
                            <a href="#" class="btn btn-lg btn-block btn-twitter omb_btn-twitter">
                                <i class="fa fa-twitter fa-2x"></i>
                            </a>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-centered">
                            <a href="#" class="btn btn-lg btn-block btn-google omb_btn-google" onclick="document.google.submit();">
                                <i class="fa fa-google-plus fa-2x"></i>
                            </a>
                        </div>

                    </div>

                    <div class="row omb_row-sm-offset-3 omb_loginOr">
                        <div class="col-xs-12 col-sm-12">
                            <div class="omb_spanOr">OR</div>
                            <hr class="omb_hrOr">
                        </div>
                    </div>



                    <div class="main">
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                            <input class="form-control" type="text" placeholder="Email address" name="email">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                            <input class="form-control" type="password" placeholder="Password" name="password">
                        </div>
                        <span class="help-block"></span>

                        <span class="clearfix"></span>
                    </div>

                    <div class="login-footer">
                        <div class="row">
                            <div class="col-xs-8 col-md-8">
                                <div class="left-section">
                                    <#--<%--<a href="">Forgot your password?</a>--%>-->
                                    <a href="/signup">Create a new account</a>
                                </div>
                            </div>
                            <div class="col-xs-4 col-md-4 pull-right">
                                <button type="submit" class="btn btn-large btn-danger pull-right">Login</button>
                                <#--<%--<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>--%>-->
                            </div>
                        </div>

                    </div>


                </form>
            </div>
        </div>

    <form action="/auth/facebook" name="facebook">
        <input type="hidden" name="scope" value="email,user_about_me"/>
    </form>
    <form action="/auth/twitter" name="twitter">
        <input type="hidden" name="scope" value="email"/>
    </form>
    <form action="/auth/google" name="google">
        <input type="hidden" name="scope" value="email"/>
    </form>

    </@layout.put>


</body>
    <@layout.put block="footer">
    </@layout.put>
</html>
</@layout.extends>