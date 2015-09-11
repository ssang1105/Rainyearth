$(document).ready(function(){

    // 조건1. 6~12개
    // 조건2. 소문자, 숫자, _ , -숫자만 허용.
    var username_pattern = new RegExp(/^[a-z0-9_-]{6,12}$/);
    // email 정규표현식
    var email_pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    //조건1. 6~12 영문 대소문자
    //조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
    var password_pattern = new RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/);

    // 모든 무자열에 대한 유효성 검사
    var desc_pattern = new RegExp(/^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{0,20}$/);

    $("#input_username").focusout(function () {
        buttonEnableTest()
        if (!isValidUsername($(this).val())) {
            $('#username_error').show(300);
        }
    }).keyup(function () {
        buttonEnableTest()
        if (isValidUsername($(this).val())) {
            $('#username_error').hide(300);
        }
    });
    $("#input_mail").focusout(function () {
        buttonEnableTest()
        if (!isValidEmailAddress($(this).val())) {
            $('#mail_error').show(300);
        }
    }).keyup(function () {
        buttonEnableTest()
        if (isValidEmailAddress($(this).val())) {
            $('#mail_error').hide(300);

        }

    });

    $("#input_password").focusout(function () {
        buttonEnableTest()
        if (!isValidPassword($(this).val())) {
            $('#password_error').show(300);
        }
    }).keyup(function () {
        buttonEnableTest()
        if (isValidPassword($(this).val())) {
            $('#password_error').hide(300);
        }
    });

    $("#input_description").focusout(function () {
        buttonEnableTest()
        if (!isValidDesc($(this).val())) {
            $('#desc_error').show(300);
        }
    }).keyup(function () {
        buttonEnableTest()
        if (isValidDesc($(this).val())) {
            $('#desc_error').hide(300);
        }
    });

    function isValidUsername(username) {
        return username_pattern.test(username);
    };

    function isValidEmailAddress(emailAddress) {
        return email_pattern.test(emailAddress);
    };

    function isValidPassword(password) {
        return password_pattern.test(password);
    };

    function isValidDesc(desc) {
        return desc_pattern.test(desc);
    };

    function buttonEnableTest() {

        var username_test = false;
        var password_test = false;
        var email_test = false;
        var desc_test = false;

        if($('#input_username').length == 0 || isValidUsername($('#input_username').val()) == true){
            username_test = true;
            //console.log("username test " + username_test);
        }
        if($('#input_password').length == 0 || isValidUsername($('#input_password').val()) == true) {
            password_test = true;
            //console.log("password test " + password_test);
        }
        if($('#input_mail').length == 0 || isValidEmailAddress($('#input_mail').val()) == true){
            email_test = true;
            //console.log("email test " + email_test)
        }
        if($('#input_description').length == 0 || isValidDesc($('#input_description').val()) == true){
            desc_test = true;
            //console.log("description test " + desc_test);
        }

        if (
                username_test == true &&
                password_test == true &&
                email_test == true &&
                desc_test == true
            )
            $("#edit_confirm").prop("disabled", false);
        else
            $('#edit_confirm').prop("disabled", true);
    }


});

