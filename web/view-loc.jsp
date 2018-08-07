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
                <h1>Location Management</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>
            <s:if test="%{list!=null}">
                <div class="margin_60 container">
                            <s:if test="%{msg!=null}">
                            <h3><s:property value="msg"/></h3>
                        </s:if> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Location</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="list" >
                                <tr>
                                    <th scope="row"><s:property value="value"/></th>
                                    <td><s:property value="text"/></td>
                                    <s:url id="banLink" action="removeLocation">
                                        <s:param name="id" value="%{value}"/>
                                        <s:param name="page" value="%{page}"/>
                                    </s:url>
                                         <s:url id="editLink" action="newLocation">
                                        <s:param name="id" value="%{value}"/>
                                        <s:param name="page" value="%{page}"/>
                                    </s:url>
                                            <td><s:a href="%{banLink}">Remove</s:a> | <s:a href="%{editLink}">Edit</s:a></td>
                                    </tr>
                            </s:iterator>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div>
            </s:if>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</script><script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
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
                $('.pagination').append('<li><a href="viewLoc?page=' + i + '">' + i + '</a></li>');
            }
        }
    });
</script>
<!-- Specific scripts -->

</html>
