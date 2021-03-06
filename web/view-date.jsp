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
                <h1>Tour Info Management</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>

            <div class="margin_60 container">
                <s:if test="%{msg!=null}">
                    <h3><s:property value="msg"/></h3>
                </s:if> 
                <s:if test="%{list!=null}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Child Price</th>
                                <th scope="col">Adult Price</th>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Remain Quantity</th>
                                <th scope="col">Action</th>                              
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="list" >
                                <tr>
                                    <th scope="row"><s:property value="id"/></th>
                                    <td>
                                        <s:text name="{0,number,##0 $}"><s:param value="%{childPrice}"></s:param></s:text>
                                            <td>                            
                                        <s:text name="{0,number,##0 $}"><s:param value="%{price}"></s:param></s:text>
                                            </td>
                                            <td>
                                                   <s:property value="date"/>
                                            </td>
                                            <td>
                                                <s:property value="time"/>
                                            </td>
                                    
                                    <td><s:property value="quantity"/></td>
                                    <s:url id="banLink" action="removeTourDate">
                                        <s:param name="id" value="%{id}"/>
                                        <s:param name="page" value="%{page}"/>
                                        <s:param name="tourId" value="%{tourId}"/>
                                    </s:url>
                                    <s:url id="editLink" action="editTourDate">
                                        <s:param name="id" value="%{id}"/>
                                        <s:param name="page" value="%{page}"/>                          
                                        <s:param name="tourId" value="%{tourId}"/>
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
                </s:if>
                <s:else>
                    <h3>Result not found !</h3>
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
        var tourId = '<s:property value="tourId"/>';
        var url = '&tourId='+tourId;
        for (var i = 1; i <= totalPage; i++) {
            if (i == page) {
                $('.pagination').append('<li class="active"><a class="non-active" href="">' + i + '</a>');
            } else {
                $('.pagination').append('<li><a href="viewDate.action?page=' + i + url + '">' + i + '</a></li>');
            }
        }
    });
</script>
<!-- Specific scripts -->

</html>
