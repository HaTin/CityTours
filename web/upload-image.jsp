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
                <h1>Upload Image</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>
            <form action="uploadImage" id="upload" enctype="multipart/form-data" method="POST">                
                <div class="margin_60 container">
                    <div class="row">
                        <s:if test="%{#request.msg!=null}">
                            <h3><s:property value="#request.msg"/></h3>
                        </s:if>
                    </div>
                    <s:fielderror/>
                    <h4>Upload Image (Allow size : < 4mb)</h4>
                    <div class="form-inline upload_1">
                        <div class="form-group">
                            <input type="file" name="file" id="js-upload-files" accept="image/*">
                        </div>
                        <button type="submit" class="btn_1 green" id="js-upload-submit">Upload file</button>
                    </div>


                </div>
            </form>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</script><script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<!-- Specific scripts -->

</html>
