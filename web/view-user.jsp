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
                <h1>User Management</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>
            <s:if test="%{list!=null}">
                <div class="margin_60 container">
                    <s:property value="#request.error"/>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Email</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <s:iterator value="list">
                                <tr>
                                    <th scope="row"><s:property value="%{id}"/></th>
                                    <td><s:property value="email"/></td>
                                    <td><s:property value="firstName"/> <s:property value="lastName"/></td>
                                    <td><s:property value="phone"/></td>
                                    <td><s:if test="status == 1">Normal</s:if><s:else>Banned</s:else></td>
                                    <s:url id="banLink" action="banUser">
                                        <s:param name="id" value="%{id}"/>
                                        <s:param name="page" value="%{page}"/>
                                    </s:url>
                                         <s:url id="restoreLink" action="restoreUser">
                                        <s:param name="id" value="%{id}"/>
                                        <s:param name="page" value="%{page}"/>
                                    </s:url>
                                            <td><s:if test="status == 1"><s:a href="%{banLink}">Ban</s:a></s:if><s:else><s:a href="%{restoreLink}">Restore</s:a></s:else></td>
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
                $('.pagination').append('<li><a href="viewUser.action?page=' + i + '">' + i + '</a></li>');
            }
        }
    });
</script>
<!-- Specific scripts -->

</html>
