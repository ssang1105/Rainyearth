$(document).ready(function(){


    var current_profile_url = $("#m_profile_url").val();
    console.log(current_profile_url);
    var current_username = $('#m_username').val();
    var current_email = $('#m_email').val();
    var current_desc = $('#m_desc').val();
    var current_gender = $('#m_gender').val();


    var clicked_gender;

    $("#gender_buttons label input").click( function(){
        clicked_gender = $(this).text()
    });

    $('.btn-default').click(function() {
        var parent = '#' + $(this).attr('id');
        clicked_gender = $(parent).find('input').val();
    });







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


    $('#image-preview').click(function(){
        $('#image-label').css("z-index",-15)

    });

    $('#edit_button').click(function(){
        $('#image-preview').css('background-image', 'url(' + current_profile_url  + ')');
        $('#input_description').val(current_desc);
        $('#input_username').val(current_username);
        $('#input_mail').val(current_email);

        if(current_gender == "male"){
            $( "#input_male" ).addClass('active');
        }
        else if (current_gender == "female"){
            $( "#input_female" ).addClass('active');
        }



    })

    $('#edit_confirm').click(function(){
        var edit_profile_url = $('#image-preview').css('background-image');
        var edit_username = $('#input_username').val();;
        var edit_email =  $('#input_mail').val();
        var edit_description  = $('#input_description').val();
        var edit_gender = clicked_gender;

        if(edit_description==null) edit_description = " ";
        if(edit_gender==null) edit_gender = " ";

       $.post( "/profile/"+current_username, {
           profile_url : edit_profile_url,
           user_name: edit_username,
           email: edit_email,
           desc : edit_description,
           gender : edit_gender
       })
                .done(function( data ) {
                    swal({
                        title: "Editing...",
                        text: "Your profile is editing",
                        timer : 1500,
                        showConfirmButton: false,
                        showLoaderOnConfirm: true
                    }, function(){
                        var obj = jQuery.parseJSON(JSON.stringify(data));

                        // 성공일 경우
                        if(obj._update == true){
                            swal({
                                title: "Editing success!",
                                text: "Your profile is edited",
                                timer: 2000,
                                type: "success",
                                showConfirmButton: false
                            }), function(){
                                // 현재 모달창 닫거나 refresh가 아닌 바뀐 username으로 get redirect
                            }

                        }
                        else {
                            swal({
                                title: "Cancelled",
                                text: obj.error_msg,
                                type: "error",
                                showConfirmButton: true
                            }), function(){
                                // 현재 모달창 닫거나 refresh가 아닌 바뀐 username으로 get redirect
                            }
                        }
                    });
                });
    });






});

$.uploadPreview({
    input_field: "#image-upload",
    preview_box: "#image-preview",
    label_field: "#image-label"
});


