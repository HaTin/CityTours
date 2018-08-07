<%-- 
    Document   : 404
    Created on : Feb 15, 2018, 4:01:58 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
            <section id="hero">
            <div class="intro_title error">
                <h1 class="animated fadeInDown">404</h1>
                <p class="animated fadeInDown">Oops!! Page not found</p>
                <a href="homepage.jsp" class="animated fadeInUp button_intro">Back to home</a> <a href="all_tours_list.html" class="animated fadeInUp button_intro outline">View all tours</a>
            </div>
        </section>
        <%@include file="footer.jsp"%>
    </body>
</html>
