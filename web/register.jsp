<%-- 
    Document   : register
    Created on : Feb 13, 2018, 11:11:04 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
   <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
        <main>
            <%@include file="register-section.jsp" %>
        </main>
            <%@include file="footer.jsp" %>
            
            
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/additional-methods.js"></script>
<script>
    $(function(){
        $('#register-form').validate({
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
                'phone' : {
                    required : true,
                    digits : true,
                    minlength : 9,
                    maxlength : 11,
                    remote :{
                        url : 'checkPhone',
                        type : 'post',
                        data : {
                            phone : function(){ return $('#register-form :input[name="phone"]').val();}
                        }
                    }
                },
                email : {
                    required : true,
                    email : true,
                    remote :{
                        url : 'checkEmail',
                        type : 'post',
                        data : {    
                            phone : function(){ return $('#register-form :input[name="email"]').val();}
                        }
                    }
                },
              password : {
                    required : true,
                    minlength : 6,
                    maxlength : 18,
                },
             confirm : {
                    required : true,
                    minlength : 6,
                    maxlength : 18,
                    equalTo : '#password'
                }
            },
            messages : {
                phone : {
                    digits : 'Please enter valid phone number.',
                    remote : 'Phone is already existed'
                },
                email :{
                    remote : 'Email is already existed'
                },
                confirm : {
                    equalTo : 'Re-password does not match'
                }
            }
        });
    });
    


</script>
</html>
