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
                <h1>Add Location</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>

            <form action="addLocation" id="set-date" method="POST">

                <div class="margin_60 container">
                    <div class="row">
                        <s:if test="%{msg!=null}">
                            <h3><s:property value="msg"/></h3>
                        </s:if>
                    </div>

                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label>Category</label>
                            <select class="form-control" name="catId" >
                                <s:iterator var="location" value="%{list}">
                                    <option value="<s:property value="id"/>"><s:property value="name"/></option>
                                </s:iterator>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Location Name</label>
                            <input class="form-control"  name="locName" id="locName" type="text"  required>
                        </div>      
                        <input type="submit" id="save-button" class="btn_1 green" value="Save">
                    </div>
                </div>
            </form>
        </main>
        <%@include file="footer.jsp" %>
    </body>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<!-- Specific scripts -->
<script src="js/jquery.validate.js"></script>
<script src='js/additional-methods.js'></script>
<script>
    $(function () {
        $('#set-date').validate({
            onkeyup: false,
            onfocusout: false
        })
    });

</script>
<script>


</script>

</html>
