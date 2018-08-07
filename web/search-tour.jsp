<%-- 
    Document   : homepage
    Created on : Feb 13, 2018, 2:11:50 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
        <%@include file="hero.jsp" %>
        <main>
            <div id="position">
                <div class="container">
                    <ul>
                        <li><a href="#">Home</a>
                        </li>
                        <li><a href="#">Search</a>
                        </li>
                    </ul>
                </div>
            </div>
            <%@include file="result.jsp" %>
                    <div class="text-center">
                        <ul class="pagination">
                        </ul>
                    </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="js/functions.js"></script>
    
    <!-- Specific scripts -->
    <script>

    </script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script>
        $('input.date-pick').datepicker({
            startDate: 'newDate',
            autoclose: true
        });
        $('input.date-pick').datepicker('setDate', 'today');
    </script>
    <script src="js/jquery.ddslick.js"></script>
    <script src="js/app.js"></script>
    <script>
        $(function () {
            var totalRecord = '<s:property value="total"/>';
            var rows = '<s:property value="rows"/>';
            var page = '<s:property value="page"/>';
            var totalPage = Math.ceil(totalRecord / rows);
            for (var i = 1; i <= totalPage; i++) {
                if (i == page) {
                    $('.pagination').append('<li class="active"><a class="non-active" href="">' + i + '</a>');
                } else {
                    $('.pagination').append('<li><a href="searchTour?page=' + i 
                            + '&origin=<s:property value="origin"/>&destination=<s:property value="destination"/>&date=<s:property value="date"/>">' + i + '</a></li>');
                }
            }
        });
    </script>
</html>
