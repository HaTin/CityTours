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
                <h1>Add Tour Date</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>

            <form action="updateDate" id="set-date" method="GET">

                <div class="margin_60 container">
                    <div class="row">
                        <s:if test="%{msg!=null}">
                            <h3><s:property value="msg"/></h3>
                        </s:if>
                    </div>

                    <div class="col-md-6 col-sm-6">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><i class="icon-calendar-7"></i> Select a date</label>
                                    <input class="date-pick form-control" data-date-format="dd-mm-yyyy" value="<s:property value="%{tour.date}"/>" type="text" name="date">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label><i class=" icon-clock"></i> Time</label>
                                    <input class="time-pick form-control" name="time" value="<s:property value="%{tour.time}"/>" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Adult Price </label>
                            <input class="form-control" name="adultPrice" value="<s:text name="{0,number,##}"><s:param value="%{tour.price}"/></s:text>" id="adultPrice" type="text" >
                            </div>      
                            <div class="form-group">
                                <label>Child Price </label>
                                <input class="form-control" name="childPrice" value="<s:text name="{0,number,##}"><s:param value="%{tour.childPrice}"/></s:text>" id="childPrice" type="text" >
                            </div>
                            <div class="form-group">
                                <label>Remain </label>
                                <input class="form-control" name="remain" value="<s:property value="tour.quantity"/>" id="childPrice" type="text" >
                        </div>
                        <s:hidden name="id" value="%{id}"/>
                        <s:hidden name="page" value="%{page}"/>
                        <s:hidden name="tourId" value="%{tourId}"/>
                        <input type="submit" id="save-button" class="btn_1 green" value="Save">

                    </div>
                </div>
            </form>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</script><script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-timepicker.js"></script>
<!-- Specific scripts -->
<script src="js/jquery.validate.js"></script>
<script src='js/additional-methods.js'></script>
<script>
    $(function () {
        $('input.date-pick').datepicker({
            startDate: 'newDate',
            autoclose: true
        });
        $('input.time-pick').timepicker({
            minuteStep: 15,
            showInpunts: false
        });
        $('#set-date').validate({
            onkeyup: false,
            onfocusout: false,
            rules: {
                'adultPrice': {
                    required: true,
                    money: true
                },
                'childPrice': {
                    required: true,
                    money: true,
                    price: true,
                },
                'remain': {
                    required: true,
                    money: true,
                }
            }
        })
    });

</script>
<script>


</script>

</html>
