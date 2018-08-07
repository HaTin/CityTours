<%-- 
    Document   : homepage
    Created on : Feb 13, 2018, 2:11:50 PM
    Author     : dell
--%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
        <%@include file="hero.jsp" %>
        
        <main>
            <%@include file="tour.jsp" %>
            <%@include file="body.jsp" %>
        </main>
            <%@include file="footer.jsp" %>
    </body>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>

 <!-- Specific scripts -->
<script src="js/icheck.js"></script>
<script>
$('input').iCheck({
   checkboxClass: 'icheckbox_square-grey',
   radioClass: 'iradio_square-grey'
 });
 </script>
 <script src="js/bootstrap-datepicker.js"></script>
   <script src="js/jquery.ddslick.js"></script>
   <script src="js/app.js"></script>

 <script>

    $('input.date-pick').datepicker({
        setDate: 'today',
        startDate: 'newDate',
        autoclose :true
    });
      $('input.date-pick').datepicker('setDate', 'today');
  </script>

  
 
</html>
