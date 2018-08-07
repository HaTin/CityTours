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
                <form action="manageTour" method="GET">
                    <div class="form-inline text-center">
                        <input class="form-control" name="tourName" type="text"  required />
                        <s:hidden name="page" value="1"/>
                        <button type="submit" class="btn_1 green">Search</button>
                    </div>     
                </form>
                <s:if test="%{msg!=null}">
                    <h3><s:property value="msg"/></h3>
                </s:if> 
                <s:if test="%{list!=null}">

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tour Name</th>
                                <th scope="col">Number of days</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Images</th>
                                <th scope="col">Action</th>                              
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="list" >
                                <tr>
                                    <th scope="row"><s:property value="infoID"/></th>
                                        <s:url id="viewDate" action="viewDate">
                                            <s:param name="page" value="1"/>
                                            <s:param name="tourId" value="%{infoID}"/>
                                        </s:url>
                                    <td><s:a href="%{viewDate}"><s:property value="name"/></s:a></td>
                                        <s:url id="day" action="viewDay">
                                            <s:param name="id" value="%{infoID}"/>
                                        </s:url>
                                    <td>                            
                                        <s:a href="%{day}"><s:property value="duration"/></s:a>
                                        </td>
                                        <td>
                                        <s:property value="quantity"/>
                                    </td>
                                    <s:url id="viewImage" action="viewImage">
                                        <s:param name="tourId" value="%{infoID}"/>                                      
                                    </s:url>
                                    <td><s:a href="%{viewImage}"><i class="icon-picture"></i></s:a></td>
                                        <s:url id="banLink" action="removeTour">
                                            <s:param name="id" value="%{infoID}"/>
                                            <s:param name="page" value="%{page}"/>
                                        </s:url>
                                        <s:url id="editLink" action="editTour">
                                            <s:param name="id" value="%{infoID}"/>
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
        var tourName = '<s:property value="tourName"/>';
        var url = tourName != '' ? '&tourName=' + tourName : ''
        for (var i = 1; i <= totalPage; i++) {
            if (i == page) {
                $('.pagination').append('<li class="active"><a class="non-active" href="">' + i + '</a>');
            } else {
                $('.pagination').append('<li><a href="manageTour?page=' + i + url + '">' + i + '</a></li>');
            }
        }
    });
</script>
<!-- Specific scripts -->

</html>
