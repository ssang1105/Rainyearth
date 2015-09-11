/**
 * Created by SW on 2015. 7. 28..
 */



$(document).ready(function(){

    //$(".my_container").backstretch("../resources/images/bg_1.jpg");

    var username = $("#m_username").val();


    var states = ['#Alabama', '#Alaska', '#Arizona', '#Arkansas', '#California',
        '#Colorado', '#Connecticut', '#Delaware', '#Florida', '#Georgia', '#Hawaii',
        '#Idaho', '#Illinois', '#Indiana', '#Iowa', '#Kansas', '#Kentucky', '#Louisiana',
        '#Maine', '#Maryland', '#Massachusetts', '#ASDF', '#Minnesota',
        '#Mississippi', '#Missouri', '#Montana', '#Nebraska', '#Nevada', '#New Hampshire',
        '#New Jersey', '#AWQERA', '#New York', '#North Carolina', '#North Dakota',
        '#Avqwre', '#Oklahoma', '#Oregon', '#Pennsylvania', '#Rhode Island',
        '#South Aqwez', '#South Dakota', '#ZAWE', 'Texas', 'Utah', 'Vermont',
        'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    ];


    var states = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        // `states` is an array of state names defined in "The Basics"
        local: states
    });



    $('#scrollable-dropdown-menu .typeahead').typeahead(null, {
        name: 'states',
        limit: 10,
        source: states
    });

    // 프로필 메뉴 redirect
    $('#profile_menu').click(function(){
        document.location.href = "/profile/" + username;
    });

    $('#input_url').keyup(function(){
        if($('#input_url').val().indexOf("youtu.be") != -1){
            //if(!$('#thumb_img').has("#youtube_image"))
                $('#thumb_img').prepend('<img id="youtube_image" class="lazy" data-src="http://brantiffy.axisj.com/wp-content/uploads/2015/07/java_8_in_action1.jpg" width="200" height="200"/>');
            //else
            //    $('#youtube_image').attr('src',"http://brantiffy.axisj.com/wp-content/uploads/2015/07/java_8_in_action1.jpg");
        }
    })

    // tag 입력할때 탭으로 구분
    $('#input_tags').tagsInput({
        width:'auto',
        height : '70px',
        'delimiter': [',',';'],   // Or a string with a single delimiter. Ex: ';'
        'placeholderColor' : '#666666',
        'defaultText':'Add tags',
    });


});

$(window).resize(function (){
});

$.fn.center = function () {
    this.css("position","absolute");
    this.css("left", ( $(window).width() - this.width() ) / 2 + "px");
    return this;
}

