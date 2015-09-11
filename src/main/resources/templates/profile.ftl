<@layout.extends name="layouts/base.ftl">
    <@layout.put block="head">
    <link href="/css/login.css" rel="stylesheet" type="text/css">
    <link href="/css/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/header.css" rel="stylesheet" type="text/css">
    <link href="/css/typeahead.css" rel="stylesheet" type="text/css">
    <link href="/css/profile.css" rel="stylesheet" type="text/css">

    </@layout.put>
<body>
    <@layout.put block="contents">

    <nav class="navbar navbar-inverse navbar-fixed-top row-centered">
        <div class="container">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="/">
                    <img alt="Rainyearth" src="/images/logo62.png">
                </a>
            </div>

            <div class="collapse navbar-collapse"  id="bs-example-navbar-collapse-1">

                <div class="nav col-centered" id="search_bar" >
                    <div id="custom-search-input">
                        <div class="input-group col-md-12">
                            <div id="scrollable-dropdown-menu">
                                <input class="typeahead"  placeholder="">
                            </div>
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="nav pull-right">
                    <div id="navbar"><a style="color: white; text-decoration:none;" href="/logout">Logout</a></div>
                </div>
            </div>
        </div>
    </nav>

    <div class="my_container">
        <div class="container">
            <div class="row profile_from">
                <div class="col-md-4" style="text-align:center">
                    <div class="profile-header-img">
                        <#--<img class="img-circle" src="${user.profile_url}" />-->
                    </div>
                </div>
                <div class="col-md-8 user_info">
                        <input type="hidden" id="m_username" name="username" value="${user.username}"/>
                        <div class="userName_editButton" id="user_name">${user.username}</div>
                        <#if is_login??>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="container">
                                    <div class="row col-xs-12 col-sm-12">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Edit Profile</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="main row-centered">
                                                        <div class="input-group margin-bottom-sm col-centered">
                                                            <div id="image-preview" class="img-circle">
                                                                <label for="image-upload" id="image-label">Choose Image</label>
                                                                <input  type="file" name="image" id="image-upload" />
                                                            </div>
                                                        </div>

                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                                                            <input class="form-control" type="text" id="input_username" placeholder="Username"  name="username" value="${user.username!""}" required/>
                                                        </div>
                                                            <p class="error_message" id="username_error">Username must contain at least six characters including only lower letters, numbers or underscores.</p>

                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                                                            <input class="form-control" id="input_mail" type="email" placeholder="Email address" name="email" value="${user.email!""}" required />
                                                            <#--<input type="hidden" id="m_profile_url" name="profile_url" value="${decoode_url}"/>-->
                                                            <input type="hidden" id="m_email" name="email" value="${user.email}"/>
                                                            <#if user.description??>
                                                            <input type="hidden" id="m_desc" name="desc" value="${user.description}"/>
                                                            </#if>
                                                            <#if user.gender??>
                                                            <input type="hidden" id="m_gender" name="gender" value="${user.gender}"/>
                                                            </#if>
                                                        </div>
                                                            <p class="error_message" id="mail_error">Invalid Email</p>

                                                        <div class="input-group margin-bottom-sm">
                                                            <span class="input-group-addon"><i class="fa fa fa-pencil fa-fw"></i></span>

                                                            <#if user.description??>
                                                            <input class="form-control" id="input_description" placeholder="User description" name="description"  value="${user.description}" />
                                                            <#else>
                                                            <input class="form-control" id="input_description" placeholder="User description" name="description"  value="" />
                                                            </#if>

                                                        </div>
                                                            <p class="error_message" id="desc_error">Description must be less than 40 characters!</p>
                                                        <div class="input-group margin-bottom-sm col-centered">
                                                            <div id="gender_buttons" class="btn-group" data-toggle="buttons">
                                                                <label id="input_male" class="btn btn-default">
                                                                    <input type="radio" name="gender" value="male" /> Male
                                                                </label>
                                                                <label id="input_female" class="btn btn-default">
                                                                    <input type="radio" name="gender" value="female" /> Female
                                                                </label>

                                                            </div>
                                                        </div>
                                                        <#--<div class="input-group">-->
                                                            <#--<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>-->
                                                            <#--<input class="form-control" type="password" placeholder="Password"  name="password" value="" required />-->
                                                        <#--</div>-->
                                                        <#--<div class="input-group">-->
                                                            <#--<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>-->
                                                            <#--<input class="form-control" type="password" placeholder="Confrim Password"  name="c_password" value="" required />-->
                                                        <#--</div>-->
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="col-xs-4 col-md-4 pull-right">
                                                        <button id="edit_confirm" type="submit" class="btn btn-large btn-primary pull-right">Edit</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                        <button id="edit_button" data-toggle="modal" data-target="#myModal" class="btn btn-large btn-primary userName_editButton">Edit Profile</button>
                        </#if>
                        <br>

                    <br>

                    <#if user.description??>
                    <div id="user_desc">${user.description}</div>
                    <#else>
                    <div id="user_desc"></div>
                    </#if>

                    <br>
                    <div class="upload_number">
                        <div>posts : </div>
                        <div id="user_upload_num">user upload number</div>
                    </div>
                </div>
            </div>
            <hr>
            <#-- 자바스크립트로 동적으로 추가하자 -->
            <div class="upload_videos"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
            <div class="col-md-4"><img class="img-responsive img-circle" src="https://farm2.staticflickr.com/1109/809710325_4289dc484e.jpg" alt="Greece-1173 - Temple of Athena by Dennis Jarvis, on Flickr"></div>
        </div>
    </div>

    </@layout.put>





</body>
    <@layout.put block="footer">
        <script src="/js/sweetalert.min.js"></script>
        <script src="/js/typeahead.min.js"></script>
        <script src="/js/jquery.uploadPreview.min.js"></script>
        <script src="/js/expression.test.js"></script>
        <script src="/js/profile.js"></script>

    </@layout.put>
</html>
</@layout.extends>