<%-- 
    Document   : cart
    Created on : Mar 4, 2018, 7:56:33 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>        
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
        <section id="hero_2">
            <div class="intro_title animated fadeInDown">
                <h1>Hello <s:property value="#session.user.firstName"/></h1>
                <!-- End bs-wizard -->
            </div>

                <!-- End intro-title -->

    </section>
    <%@include file="profile-detail.jsp" %>
    <%@include file="footer.jsp" %>
</body>
</script><script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>

<!-- Specific scripts -->
<script src="js/tabs.js"></script>
<script src="js/jquery.validate.js"></script>
<script src='js/additional-methods.js'></script>
<script>
    $(function () {
        $('#update-form').validate({
            onkeyup : false,
            onfocusout : false,
            rules: {
                firstName: {
                    required: true,
                    minlength: 2,
                    lettersonly: true
                },
                lastName: {
                    required: true,
                    minlength: 2,
                    lettersonly: true
                },
                phone : {
                    required : true,
                    digits : true,
                    minlength : 9,
                    maxlength : 11,
//                    remote :{
//                        url : 'checkPhone',
//                        type : 'post',
//                        data : {
//                            phone : function(){ return $('#update-form :input[name="phone"]').val();}
//                        }
//                    }
                }
            },
            messages : {
                phone : {
                    digits : 'please enter valid phone number.',
                  //  remote : 'Phone is already taken'
                }
            }
        });
        $('#update-password').validate({
                onkeyup : false,
                 onfocusout : false,
            rules :{
                'old-password' :{
                    required : true,
                    remote : {
                        url : 'checkPassword',
                        type :'post',
                        data :{ 
                             password :  function (){ return $('#old_password').val();}
                            }
                    }
                },
               password : {
                    required : true,
                    minlength : 6,
                    maxlength : 18,
                    notEqualTo : '#old_password'
                },
             confirm : {
                    required : true,
                    minlength : 6,
                    maxlength : 18,
                    equalTo : '#new_password'
                }
            },
            messages : {
                confirm :{ equalTo : 'Re-password does not match'},
               'old-password': {remote : 'Current password is incorrect'}
            }
        })
    });
</script>
<script>
    new CBPFWTabs(document.getElementById('tabs'));
</script>
<script>

</script>

</html>
