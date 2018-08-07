<%-- 
    Document   : cart
    Created on : Mar 4, 2018, 7:56:33 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
         <section id="hero_2">
            <div class="intro_title animated fadeInDown">
                <h1>Place your order</h1>
                <!-- End bs-wizard -->
            </div>
            <!-- End intro-title -->
        </section>
        <%@include file="cart-detail.jsp" %>
        <%@include file="footer.jsp" %>
    </body>
            <script src="js/common_scripts_min.js"></script>
        <script src="js/functions.js"></script>
        <script>
    $(function () {
        $('.adult .dec').on('click',function(e){    
            if($(this).parent().children().first().val()==0){
                $(this).parent().children().first().val(1)
            }
        });              
    });
</script>
</html>
