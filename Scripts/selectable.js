$(document).ready(function(){
    $('.tab tr').click(function () {

        $('.tab tr').not(this).removeClass('clicked');
    $(this).toggleClass("clicked");
});

});

$(document).ready(function () {
  

    $('.li').click(function () {

        $('.li').not(this).removeClass('clicked');
        $(this).toggleClass("clicked");
    });

});





//$(document).ready(function () {
//$('#loginbtn').click(function(e) {
//    $.Dialog({
//       'title': 'Login',
//        'content': ' <table ><tr><td><label>UserName: </label></td> <td><div id="username" runat="server" class="input-control text"><input type="text" /><button class="btn-clear"></button></div></td></tr><tr><td><label>Password: </label></td> <td><div id="Div1" runat="server" class="nput-control password"><input type="password" /></div></td></tr><tr><td></td> <td></td></tr></table>',
//        'draggable': false,
//        'overlay': true,
//        'closeButton': true,
//        'buttonsAlign': 'right',
//        'keepOpened': true,
//        'position': {
//            'zone': 'center'
//        },
//        'buttons': {
//            'button1': {
//                'action': function () {
//                    var s = $("#username input").val();
//                    $(" #Login1 #Login1_UserName").val(s.toString());
//                    $("#Label1").text(s);
//                    alert(s);
//                    document.getElementById("Login1_Login1_LoginButton").click();
//            }
//        }
//    });

//    });

//});




$(document).ready(function () {
    if (getCurrentUserRole() != 1)
    {
         $('a[id*="lnkBtnChgPrty"]').click(function (e) {

        if ($('span[id*="lblpriority"]').text() == 'Not Urgent') {
            $.Dialog({

                'title': 'Are you sure?',
                'content': ' Changing the priority of this complaint to <b>"Urgent"</b> will automatically escalate the complaint </br>to the corresponding Manager/Director <br></br> Press the <b>"Confirm"</b> link to verify this action.  ',
                'buttons': {
                    //                'Yes': {
                    //                    'action': function () {
                    //                        // eval($('.lnkBtnAddRmrk').attr('href
                    //                        jQuery.ajax({
                    //                            url: 'ComplaintDetailsControl.ascx/lnkBtnAddRmrk_Click',
                    //                            type: "POST",
                    //                            data: "{" + args + "}",
                    //                            contentType: "application/json; charset=utf-8",
                    //                            dataType: "json",
                    //                            success:  
                    //                                alert(args)
                    //                            

                    //                        });

                    //                                                      
                    //                        
                    //                    }


                    //                },
                    'Ok': {
                        'action': function () {



                        }


                    }

                }
            });

        }
    });
    }
    });



    $('input[id*="btnResolve"]').click(function (e) {

        if ($('span[id*="lblpriority"]').text() == 'Not Urgent') {
            $.Dialog({

                'title': 'Are you sure?',
                'content': ' Before this complaint can be marked as <b>"Resolved"</b> the Manager/Director of the Department corresponding to the <b>Category</b> of the complaint  </br>must login to the system with their respective credentials and confirm this action.  ',
                'buttons': {
                    //                'Yes': {
                    //                    'action': function () {
                    //                        // eval($('.lnkBtnAddRmrk').attr('href
                    //                        jQuery.ajax({
                    //                            url: 'ComplaintDetailsControl.ascx/lnkBtnAddRmrk_Click',
                    //                            type: "POST",
                    //                            data: "{" + args + "}",
                    //                            contentType: "application/json; charset=utf-8",
                    //                            dataType: "json",
                    //                            success:  
                    //                                alert(args)
                    //                            

                    //                        });

                    //                                                      
                    //                        
                    //                    }


                    //                },
                    'Ok': {
                        'action': function () {



                        }


                    }

                }
            });

        }
    });





});




function getCurrentUserRole() {
    $().SPServices({
        operation: "GetRolesAndPermissionsForCurrentUser",
        async: false,
        completefunc: function (xData, Status) {
            if (Status == "success") {
                $(xData.responseXML).find("[nodeName=Role]").each(function () {
                    if ($(this).attr("Name") == "Manager" || $(this).attr("Name") == "Director") {
                        // THE USER IS ASSIGNED THE FULL CONTROL ROLE
                        return false;
                    }
                    //                    if ($(this).attr("Name") == "Approver") {
                    //                         THE USER IS ASSIGNED THE APPROVER ROLE
                    //                    }
                });
            }
        }
    });
    return 1;
}


//$(document).ready(function () {
//    $('#loginbtn').click(function () {
//        //$("#loginForm").load('login.aspx #loginForm1');
//       // 
//        $('#loginForm').find("input[type=text], UserName1").val("");
//        $('#loginForm').find("input[type=password], UserName1").val("");
//        $('#loginForm').find("[id*='Validator']").css('visibility', ' hidden');
//        $.blockUI({ message: $('#loginForm'), onOverlayClick: $.unblockUI });

//        $('#loginForm').parent().appendTo($("form:first"));
//        alert("afdafdaf");

//        $('#loginbtn').click(function () {
//        
//        
//        
//        
//        
//         });
//    });
//});


$(document).ready(function () {
//    $('#lnkBtnChgPrty').click(function () {


//        $.blockUI({ message: $('<Button >ewrw</Button>')});
//    }); 
//        // $('.lnkBtnAddRmrk').trigger('click');
//       // eval($('.lnkBtnAddRmrk').attr('href'));
//       // alert('hjvhj');
//        $('#no').click(function () {
//            $.unblockUI();
//            return false;
//        
    //  });



//    $('#lnkBtnChgPrty').click(function () {
//        $.blockUI({ message: $('#question'), css: { width: '275px'} });
//    });
//    $('#question').parent().appendTo($("form:first"));

//    $('#yes').click(function () {
//        // update the block message 
//        $.blockUI({ message: "<h1>Remote call in progress...</h1>" });

////        $.ajax({
////            url: 'wait.php',
////            cache: false,
////            complete: function () {
////                // unblock when remote call returns 
////                $.unblockUI();
////            }
////        });
//    });

//    $('#no').click(function () {
//        $.unblockUI();
//        return false;
//    });


});




function update()
{
    new Ajax.Updater('loginForm', 'http://localhost:2916/login.aspx', { method: 'get' });
    
}


//ADD CONTACT

$(document).ready(function () {
    $('#lnkAdCntct').click(function () {


        $('#divAduser').css('display', ' none');

        
        $('#divTel').css('display', 'inline');


    });


    $('#lnkAdEmail').click(function () {


        $('#divAduser').css('display', ' none');

        
        $('#divEmail').css('display', 'inline');

    });



    $("[id*='Done']").click(function () {


        $('#divAduser').css('display', ' inline');

      
        $('#divEmail').css('display', 'none');
        $('#divTel').css('display', 'none');



    });


//    $('#MainContent_email').click(function () {


//         
//        $('#divEmail').css('display', 'inline');
//        $('#divTel').css('display', 'none');
//    });

//    $('#MainContent_tel').click(function () {



//        $('#divEmail').css('display', 'none');
//        $('#divTel').css('display', 'inline');
//    });
});



function loadXMLDoc() {
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById('#loginForm').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "TextFile1.txt", true);
    xmlhttp.send();
};