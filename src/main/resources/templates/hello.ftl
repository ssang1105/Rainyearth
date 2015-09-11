<#--<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />-->


<@layout.extends name="layouts/base.ftl">
<!DOCTYPE html>
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <@layout.put block="head">


    <link href="/css/header.css" rel="stylesheet" type="text/css">
    <link href="/css/typeahead.css" rel="stylesheet" type="text/css">
    <link href="/css/upload.css" rel="stylesheet" type="text/css">
    <link href="/css/jquery.tagsinput.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/hello.css" rel="stylesheet" type="text/css">

    </@layout.put>

</head>

<body>

<@layout.put block="contents">
<nav class="navbar navbar-default navbar-fixed-top row-centered">
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
                <#if name??>
                    <input type="hidden" id="m_username" name="m_username" value="${name}"/>

                    <div class="btn btn-default"  id="profile_menu"  aria-haspopup="true" aria-expanded="true">
                    <#--<div class="circle" style="background-image: url(${profile_url})"> </div>-->
                    <#--<div class="circle" style="background-image: url('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCADWAKADASIAAhEBAxEB/8QAHQAAAQUBAQEBAAAAAAAAAAAAAAMEBQYHAggBCf/EAD8QAAEEAQIEAwYDBQYGAwAAAAEAAgMEEQUhBhIxQRNRYQcUIjJxgRWRsQhCwdHhIzNSYqHwFyQlRHKCNJLx/8QAGQEBAQEBAQEAAAAAAAAAAAAAAAEEAgMF/8QAJBEBAQACAQQCAwADAAAAAAAAAAECEQMSITFBBFETFCIyYXH/2gAMAwEAAhEDEQA/APVKEIQCEIQCEIQCEJC7br0az7FyaOCBnzPkdygfdAuhZjr/ALaOGdNDhUm99la7lLWO5R9iqxd/aEoNol1PS5X2R+6XZaD9VdDdULA9N/aFrvbH77pDwD87mP3bv1x3Vm0z216DPp5tXAYmh/IQw8xb5Ejy9U1RqyFEcN8Q0eIaMVqg5/K9geGvbhwBUuoBCEIBCEIBCEIBCEIBCEIBCFn/ALYuOWcG6ABBJy6nay2BoAJHm7dA+479oei8HxFlyXx7xGWVYjlx+vkF5k9pXtS1ji2wYR/ytLH/AMaOQkOHmfMqkaxqc2oXZbduaWaeV5c6R7sl31US6f8AtM910FX5e/L3lp64/mknSkvyz4T9eq+FwePMpMNLnODewyUHQdJ4vO04OOyWhsubJ8QAz2803JHXJzlDywkddlRqHAPtK1HhuzAx07n09o+TmwWgnP5ehXq7g3irTeKdOE+mzmRzABI1wAcD54HqvBEUmMFzQ5vRXD2a8aahwnrUdqrYeyuXNE8YGWvb6hS9x7oQofhTX6fEuiwajp8jXxSDBwc8ru4KmFyBCEIBCEIBCEIBCEIPjnBrS5xAAGST2Xij2zcUT8ScdXJHSNfWrv8ABgDOgaPL6lev+Mb34bwzqFnkLy2FwAAzuQvB96SSzenlfkvkeSfuVYGcjS7P1wm74HFxIBx2Vx4d4efqMoZuB+8r1W9ntTA8Z7nHyC8s+fHC6r2w4Ms+8YnGHNxlu46Jau3Y4ByTuVvH/DXSpYchrw7zBURd9nkVY80bi4AnAwuf2MXX6+TFJsl7sN6JMj5Vp0vAsrrD+Vh+LlAGOmMfrlIyeziy2nJl2JA/4fULv8+H25/Bn9M+a/DD6JWu8fGOxx0UvqfDF2gXc7CWgbkBRLa7oyQe69JlMvDzyxuPlvn7NfGsen6jNoVxriLbgYXg9HDsQvTq/Pbhu+/T9eqWmbmKZrsHvgr9AdOsNtafWsRnLZY2vH0IylcnCEIUAhCEAhCEAhCEFU9qkroPZ/rUrPmbAcHy9V4uZCBOT3Xtv2g0vxDgrWa/LzF1Z7gPUDI/ReLGsdI4NjbmR7sAD9Evh1i0jgmBsVUEDc7lXqu3OMqrcN0n0qEQmI5yBkeStFRzSd3D6L5XJerO6fV4504zaTgPK0jGy+ShsgOQF9YW8oAcuuXO2QrqrNGUkTBuGjKbW2ZZ0UjKwcuU0sgFu52UstddlZ1CpHM14e0HIx07LN+JNEipO54h8J7eS1O45oJw4eqpXGDM1S/G3TK74MrjlqvLnxlx2yqdpithzBjByF7v9nFs3uB9FncMOdWYHDGN8Lw1dBfYAG2Oi9y+zeKSHgPQo5m8rxUZkfZfTfLqyIQhRAhCEAhCEAhCEHEzWOhe2XHhlpDs9Md149GlQU+P56NeVlitFZd4cjDlpbkkL1rxDG6XQtQY13K4wPwf/UrznLTxrulWHchkka/mc0YzjovHlz1/P20cPH1Tr+rEpaZJ7u5sWQ/soODRtXuTuLrvuzT+8DlyukFUSxnPXsVCW9FllNiOxcsMa9jmsc13LykjqMdwseGVxuo3ZY9URsejatRsh/4xPO3/AAv6K06ZYf4IbKSXDzVU4W0G5pxmdavOszvkBAbkM5N87Huc/bAV1rwRslcOowmdu/O1wmvWkTrWoy8hirf3nn5KsHSdduvc+TVZ44+zW9ArZYiaXWHMbmRo+EeZVS1LSNVm1mKWpqj46OGmX43B7SMcwABxg4OPqVeO370ckn1swnr6np8mXzCy3OCe5H0T25A2xpcvijYsJPpsnlKncktubJJ4sIOznjDsevmnepVfCo2Wjr4bsfknV1ZJceiMu4W0GXiHiajptZuZZnjP/iOp+wyvb1KuypTgrxbMiY2Nv0AwvNXsFLKHE1N/hsmuWm8pa5pzHGc/ED2Ox+y9NrfjlMvD5meFx1v2EIQunAQhCAQhCAQhCDiaNs0L437te0tP0KwPUtOdS1NkLv8AtXuj6epC39Zx7StKMFpmowtxFN8Eu2wcOhP1H6Lx5sdyX6afj59NuN9q/prxgA4wpKWNj29AVXKMxa/Cn68ocwArFpvnjZJ8LImFwaAUzrv55n/RONUnDIC1pw52wPkmencrecOcPzU13dw0ryYvPa7ucKRdTiecljTlQltxZqBlaRyNIBwrFA8OiBz26pIUhLWihi+EAKv6jh7JmDfLCMfZTGpz8rThV+NxlkcusZ3288/C1ex3RWDWobZaA6lT8IHHdxx/NbMqX7L9MdU0iW5Js604cg8mNyAfuSVdFu4sdYvnc+XVn29BCEL0eIQhCAQhCAQhCAXMjGyMLJGtcw7EOGQV0hBheuVXaZrluDGAyQgf+J3H+hCcVp8MByrN7VdJeBFq0DcgART4H/1d/D8lRKs45MA7LDy49OT6XDn1YpS82K3EWP7jscKCj0GOpERUnmr8zsuIfzFx9cpHUnX6p8WCZhjcfkI6fdJ+LqphbI0wkO7+J/RcSdmzj4cs5uF26LFDcM75JXvPUl5wfqOimopxGwMB2HRVW3c1ONzQ0RtJ6czs/wAE+pGw1gdbexz+vw7BSxzyYZcd1TrU5vhO/VTfAHDLdeNp080sMMXKOaPGXE9t/RVaxJ4kmMZycAea3XgnSDo3D9eCRuLEn9rL6OPb7DAXtw4bvdi+RydM1PKXo1IqNOGrXbyxRNDGjrsEuhC2MAQhCAQhCAQhCAQhCAQhCCv8ealX0zhe5JbHM2YCuxv+Jzzyj9c/ZYWyT3e1yOPwnorL+0JxLEyXS9KhmIdBbilsY6bkco/Ik/cKt6hB48XM3Zw3CzfI9Rq+N4tST2eKzB3BTJ+kSPJMFlrB5OYCouLV56beWzG57RtzNGcfVB4lrk7Od+SzyX02TkuPin/4c+B/M+XxHeeML7ak8KElx3Uc7X4XfKXPd5AZTZ0k16Qc7SxnXlTX2lzuXc8ivS0Y5NSgAdLVHjRhwyC5u42XpDh/VIta0SjqVf8AurUTZAPIkbj7HIXmHiOX3Thy85uxELsY+i0v9njiiG5pM2g2Jm+91sTQgn543DJx9D1+q18HfGsXyP8AKNjQhC9mcIQhAIQhAIQhAIVZ4m440Hh6KQ3LrJbDP+3gIfIT5YHT74WN8Re2PU9WmdU05n4XXccZjPPMR6u6N+2/qrpLY2ziPizRuHo3/iV2NszW8wgYeaQ/+v8ANZBrXtu1Kew5mjaZDVrFwYJrJ5n7nGQOn6rH5b9yxemLHvA3Jke7Lnb9STuVGWHPfBPPNNmZj2OG+dg4fwXWtJupbjC9JqWm6ncndJPZlnLzM87lw3yB28loPDNsaroNWyN3OjAd9cLKdd1UsmrUIWAxWnk7nscAK5ey+6azXafMd2kjBWb5M3NtPxrrstQYwS4kaMd05fodOywSNjbv5JzeqB2HsUf41qo4iMAtd59ljbXEun16u0bGg/RNmtBk2CXkc9+8hy4ruKIRMdLLsELVU9osvgcOTRj+8mIYB91WNBuTaRfr3qVmWtNEGhkjTgsO4P2O6k+MrYuWGucC6GFwPKO5zgKrPlJuvY4csZGSPL1W7481iwfIy3k2LhH2zcQ07Bi1R9fVa7TuHYZLjzBA/XK2vhL2g6FxKGx1rHu9t3SvYw1zj/lPR323XjKiYTZd8bmkhSWjyNg1FgjnOM7g9Cvex4be6ULy7wn7UeItGuMhFgapp7djDYOXAeTX9QfrkLb+FfaPw/xC5kDLPul4gZr2fhOfIHof1XNxsWVc0IQoqvcVcX6Rw1A52oWAZgMiCPBeft2HqVh3FXtd1HXobcWnROp0GDB8Nx53g+bh/DCzqbUTZktSTyOvWZDzvkkJOTj/AFTanNbfWtsiY2IeGSGtGASBn+C71I4ttd1JQzxn+7yOPVxfk7ndc6Y+y+WWRldreVhIPLjf7pvTs3TppkbI7IJyCUrXNuTS7j3yOAxjBP8AvyVtQ2q1bbzKbDg1gbu4uGElWjqsoXA+V0p5Rs3buu6NV4qzOkfgY8/RcRxV4tNsSZJ6NOP9+iXaq7xO8vFOduQ0ANHoR/8AmVeNOtNZYj1Om4uiLg53nh2+/wB8qlcRSNk0uFsTdmylxP2CmuA7TBGa87xySDk5T23GD+ZXly47le3FdZN4pWG3aDJGHOQkZc4w4ZwmPBkUsNR0LiSGnbKmZYHE7DqvnV9CRGcnM4ZAACr3FOqeHy1K5zI/ZW6Ws5sL3EdAsp4kndXms2JTh7stiHf6rvjx6rpznemW1C65aa5/u9d+fDHxHzd/QfqmDCx0EUVgkSOd178vkm+mMfM2aZ5y2CQ8/oDuPz3TqoGWtXikc0ncFwA6HsPyX0JNTUfNyu7uvtL3T3rdso3I+ZSEIpnU48OkiwQSTumzHQMuY8J2z/L0XUhqm6CTg7Bd1z6PIzXbfkhimfE8SOHMTs5Oq0xhu4fbie3PRwJUfa92brErQC4E82RvjZIu92F0HxHYyNsJ3RrPDvtN1nh+2yB1qK/TBAME0mSG/wCU9R/qtt4R480TiciGpY8G9jLqs3wv+3+IfRePLggn1BxZJyhzsDfphPWW7NWzHJ7y0mPDm4O4x3B6hSzay6fP7KnZeyHlfluzgdvzXzRWW7Nl4ZzlpaRnoO6Qo1/diJp2mSFruRm+2/ol6tuV2rFrMtizkNHQK3/SekdTNp0VmBoeXMfy4GykPdLv4HZ5gc8w25uvXyUeJbAbqFcE/BISMfRLNE7tBldk/ERtn6qbKWq0LRqTeN8Dc9Xu9EpDTrfhNpklgu7/AAjp+nmm9SKxJUm5yRuep9ErpNMur2mOeN2fyS0qOZUqS0LMbud5BDhkb9O2/kmtWnLBC80JGvew5AIw4t8sKW02o3xHNL9iwLrTqUZvGN0nUlpSqsnC3HdvTj4eqUJZYiceIzALfr5rX9LtV79dk8Dw6N4yP5LzvL7wIpqc7y4cx5X/AKZV29lusTRGShaeQ4fE0E+XX/TCy83DJOrFq4ObK5dOTU9Ra0ROHZYV7QJGTcUOhruBMcbYyHDYPP8AQq8e0bjA0oDS06RosPGJJc/IPJv+Y+fZY/WbPdsy3JpWtZGckk9/T1Tg47P6rr5HJL/MLaTXjimsNc+QGZgEw7YB2A9fVSuijT/xIAMkIa7qSN9/omtWOuI5SJN8AZz6JfRIoBI94k3DSfm9CtNY6+ONCTUdmPb8fXPovhrQS6i0R2CBt8wSVeGF1sHxN8uPVFSqZNSHK/bmwrT0eTxVYNfnbM8ynGfhOwSMcdO1qbYonPYc5JJyAAuHxRx69YMr9iF80aCOSa3a8QAAEN/T+KndPRWtXqs1KXxZy4YO7Qhz6VS26aQmboGsIx90jp8cAfK50uTjOx+64t12OZXtTYZE5uGt+/Urr3oO78xrsq13D+yAa53cHODn9ElqNsV7AdA3ly07kYXEz5qUdSO43nhLcAOO4GexSmqSVI4YZIcyvIwC7zUIa6bZkbDeMgBc45JdsenklwbA4e5hz7vBG31RDqQbVsnwYyXE5OPTHZOZb9huiQtaTgvx+ie1t8EKbrUleYDxCcnoAEvotK24zgxSY5D1J8lzV1C2aUuHOHxHpsvujTWnNsucXn4D1+iW1KQo6ZZFn+7aBykbk+aUj0yyzVGnlZufNN9P94M5OHfL5+q7gbYfqTfm+bzS27PRxdpXIdRmfC0HDugOx38vomto2tPvMkMroT8re2Sc7Z8uq4LrBuuceY/GTjPkEjAyfUNVg94aeUOOGu+uEy8aXHt3NJKFy3YfPK4PL3cviPf/AFU23Rvd9HA94hDpX47f77qPs1ZRJyk4DXkf6J/qVeQUqg5hjrjJ8yn0d3LdP5akhFiI5J8kppGmu8Cw/wAaLZnp6KN8CT3Anm69s+qe060sej2XA7nA6/78lLSyk6unP5iWywk8nQEdyldI06wb7CWtxzZ+b1TWnXlHikHcYHX0S+jRT++5ydgT1VtK4NR7NQtSTyMYBGSN85KV0/T3xaNM8ywgOxvkd1Hshkks2w44+A4yU4hil/BJWh3SRoIz9UtTuRtQGvHIGyRuzgbdtk8hry2NGmfM9reXdnN1x06duyaU5fAfaBa1z2t+Y7huf6JTSorNxlhpyGuj/e/NLVp5rts+JDHI0O5GgdPTdMGiNkMgc4ubFMCwHfLSMj/fonOpzyhlSS4x8zOXBL24c0A9M/ZMrT6cltnhynwS3JBHxN8v1SEp2+WFmmN5YyXPOenbql573/SISI8ASd3D0SeoMoR0oQJJHdNsf1SzpKDdFjaIXEc/cj09FPZaShvuGmuIYwZz+96pXSLz/dbRxGPg8/ULmvaptoPArZxnqfVONLu1xTtctdo+H18x6pf+FtRun3JfFO7PlHYrqhbldf2c3Of8JS1HUYw8hteMYaOxSmkak38SA8CPr5eqtvfwW1HR2Zjed8QI5nfuFd1Zpn6qwgu2IGzV0NSxqkwEMYBB/dHkldO1CT8SYA1uAR+6P5JaejS4+eSeQNdLnn/w4TnVX2G1amTL8uT09U3sanYMrsENJkzkDBTvW9TsgQtDthF/D+qu7uIZA2BQj3k3x2CeF1gaE7+9yXjsPL+q5n1GxHTibkZGOyc2tRst0aEB27n/AMlNlM6brAjncfEznA+EHsutKnsCeQ5fsx37noV1BqdgVJSXZyT2XWjX5Q2w7kYcRnctHolpTCv4801jHOTynoOXuuKzJotNfnxA5z8DBzn8+6c1NQncJXtIbloB5Rjz8lFttzwPZyuOCOcpvupzVmDWzMzmWZ+5PYDZPdHktT3THBlziCNhhoTDRJi25K6SNkjg3OT0BJUnpF+Z15rIsgE4wwY7pSldWuSMp1mSBrxy5zj1KhrMLJm1nt+AgEHbqChCkIfT1GmvFzOJ2B2+idurR/goPxbSeaEKbd6jmOtEKTzg9T+qd6VWh90t/D0b/EIQlc5TsZ0oohIcM6sCU0xkQ1RmGD5sIQrUt7I+y6OC/KeTOSR08wnGn2mNmmnEWRGNx067DCEK2dk2jn34vFi5Y3fOSc4T7V70b5seGdo2/wAEIV13V1qF2IQxDwz+QS9+9G3Tag8M7n+KEKSeC+TZluM6e48h3z29UtplqJlG24RnPL5DzCEJYW9jKrdYyCYNj7D9FCssON+MdQWYIKEK3yqS0cRsfI6UOc0knlG2d+6eVLroLodXjY3BPKMeW6EKWI//2Q==')"> </div>-->
                        <div style="color:#5a6571; float: left; margin-top: 0.3em; margin-left:1em;">${name}</div>
                    </div>
                <#else>
                    <a href ="/login"><button class="btn btn-large btn-primary navbar_button">Login</button></a>

                    <#--<div id="navbar"><a style="color: #5a6571; text-decoration:none;" href="/login">Login</a></div>-->
                </#if>
            </div>
            <div class="nav pull-right">
                <#if name??>
                    <button data-toggle="modal" data-target="#myModal" class="btn btn-large btn-primary navbar_button">Upload</button>
                <#else>
                    <a href = "/login"><button data-toggle="modal" data-target="#myModal" class="btn btn-large btn-primary navbar_button">Upload</button></a>
                </#if>
            </div>


        </div> <#-- navbar collapse-->
    </div>
</nav> <#-- navbar -->
    <div class="my_container">
        <div class="container">
            <div class="row row-centered">
                <div class="col-md-10 col-centered" id="video" >
                  <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/3HWFmPeez-M"></iframe>
                  </div>
                </div>
            </div>
        </div>
    </div>



    <#if name??>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="container">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form method="POST" action="/video" autocomplete="off">
                            <div class="modal-body">
                                <div class="main row-centered">

                                    <div id="thumb_img" class="input-group margin-bottom-sm upload_input">
                                        <#--<img class="lazy" data-src="http://brantiffy.axisj.com/wp-content/uploads/2015/07/java_8_in_action1.jpg" width="200" height="200">-->
                                    </div>
                                    <div class="input-group margin-bottom-sm upload_input">
                                        <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                                        <input class="form-control" type="text" id="input_url" placeholder="URL (e.g., https://youtu.be/gRxrBDF0JrA)"  name="videoUrl" required/>
                                    </div>

                                    <ul class="nav nav-tabs">
                                        <li role="presentation" class="active"><a href="#">Basic Info</a></li>
                                        <li role="presentation" class="disabled"><a href="#">Advanced settings</a></li>
                                    </ul>

                                    <div class="input-group margin-bottom-sm upload_input">
                                        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                                        <input class="form-control" type="text" placeholder="Title" name="videoTitle" required/>
                                    </div>
                                    <div class="input-group upload_input">
                                        <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                        <input class="form-control" type="text" placeholder="Description"  name="videoDesc" value="" required />
                                    </div>
                                    <div class="input-group upload_input">
                                        <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                        <input class="form-control tags" id="input_tags" type="text" placeholder=""  name="videoTags" value=""  required />
                                    </div>
                                    <input type="hidden" name="uploadUser" value="${name}"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="col-xs-4 col-md-4 pull-right">
                                    <button id="edit_confirm" type="submit" class="btn btn-large btn-primary pull-right">Upload</button>
                                </div>
                            </div>
                        </form>
                    </div> <#-- modal content -->
                </div>
        </div>
    </div>
    </#if>
    </@layout.put>
</div>

    <@layout.put block="footer">
        <script src="/js/typeahead.min.js"></script>
        <script src="/js/jquery.lazyloadxt.js"></script>
        <script src="/js/jquery.tagsinput.min.js"></script>
        <script src="/js/hello.js"></script>

    </@layout.put>

</body>

</html>
</@layout.extends>
