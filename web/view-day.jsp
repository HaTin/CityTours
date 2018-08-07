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
            <div class="margin_60 container">
                <form action="addDesc" method="POST">
                    <div class="form-group">
                        <label>Add New Day</label>
                        <s:hidden name="id" value="%{id}"/>
                        <textarea class="form-control" name="desc" type="text"  required=""></textarea>
                    </div> 
                    <input type="submit" id="save-button" class="btn_1 green" value="Save">
                    <hr>
                </form>
                <s:if test="%{list!=null}">
                    <s:if test="%{msg!=null}">
                        <h3><s:property value="msg"/></h3>
                    </s:if> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Day</th>
                                <th scope="col">Description</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="list" status="counter">                               
                                <tr>                      
                                    <th scope="row">Day <s:property value="#counter.count"/></th>
                                    <td> 
                                        <form action="updateDesc" method="POST">
                                            <s:hidden name="id" value="%{id}"/>
                                            <s:hidden name="desId" value="%{desId}"/>
                                            <textarea class="form-control" name="desc" value="" required=""><s:property value="desc"/></textarea>
                                            <input type="submit" id="save-button" class="btn_1 green" value="Update">
                                        </form>
                                    </td>
                                    <s:url id="banLink" action="removeDesc">
                                        <s:param name="desId" value="%{desId}"/>
                                        <s:param name="id" value="%{id}"/>
                                    </s:url>
                                    <td><s:a href="%{banLink}">Remove</s:a></td>
                                        </form
                                    </tr>

                            </s:iterator>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </s:if>
                <s:else>
                    <h3>Please add day description </h3>
                </s:else>
            </div>


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
