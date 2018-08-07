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
                <h1>Add tour</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>

            <form action="saveTour" id="add-tour" method="POST">

                <div class="margin_60 container">
                    <div class="row">
                        <s:if test="%{msg!=null}">
                            <h3><s:property value="msg"/></h3>
                        </s:if>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label>Tour Name </label>
                            <input class="form-control" name="tourName" id="first_name" type="text"  required="">
                        </div>                    
                        <div class="form-group">
                            <label>Category</label>
                            <select class="form-control" name="category">
                                <s:iterator value="%{catList}">
                                    <option value="<s:property value="id"/>"><s:property value="name"/></option>
                                </s:iterator>
                            </select>
                        </div>
                       <div class="form-group">
                            <label>Origin</label>
                            <select class="form-control" name="origin" required>
                                <s:iterator  value="%{locList}">
                                    <option value="<s:property value="value"/>"><s:property value="text"/></option>
                                </s:iterator>
                            </select>
                        </div>                    
                <div class="form-group">
                            <label>Destination</label>
                            <select class="form-control" name="destination" required >
                                <s:iterator value="%{locList}">
                                    <option value="<s:property value="value"/>"><s:property value="text"/></option>
                                </s:iterator>
                            </select>
                        </div>   

                        <div class="form-group">
                            <label>Quantity</label>
                            <input class="form-control" value="1"  type="number" min="1" max="20"  name="quantity" id="quantity" required>
                        </div>    
                        <div class="form-group">
                            <label>Duration</label>
                            <select class="form-control" id="duration" name="duration" required="">
                                <option value=""></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>                            
                                <option value="6">6</option>                            
                                <option value="7">7</option>
                                <option value="8">8</option>                           
                            </select>
                        </div>
                        <div id="dayDesc">
                        </div>
                        <div class="form-group">
                            <button href='#' id='btn' class="btn-primary">Choose product image</button>
                            <label id="product-image"></label>
                        </div>
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="xxbtn">&times;</span>
                                <select class="image-picker" name="image" data-limit="1">
                                    <s:iterator var="image" value="%{imageList}">
                                        <option data-img-src="<s:property value="%{#image}"/>" value="<s:property value="%{#image}"/>" ></option>
                                    </s:iterator>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <button href='#' id='btnS' class="btn-primary">Choose Slide image</button>
                            <label id="slide-image"></label>
                        </div>
                        <div id="secondModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="xbtn">&times;</span>                                  
                                <select class="image-picker2"  name="slideImages" data-limit='6'   multiple="multiple">
                                    <s:iterator var="image" value="%{imageList}">
                                        <option data-img-src="<s:property value="%{#image}"/>" value="<s:property value="%{#image}"/>" ></option>
                                    </s:iterator>                           
                                </select>
                            </div>
                        </div>
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
<script src="js/jquery.ddslick.js"></script>

<script src="js/image-picker.min.js"></script>

<!-- Specific scripts -->
<script src="js/jquery.validate.js"></script>
<script src='js/additional-methods.js'></script>
<script>
    $(function () {
        $('#duration').change(function () {
            var tempDesc = [];
            var length = $('#dayDesc').children().length;
            for (var i = 0; i < length; i++) {
                tempDesc[i] = $($('#dayDesc').children()[i]).find('textarea').val();
            }
            $('#dayDesc').empty();
            for (var i = 0; i < $(this).val(); i++) {
                var text = $('<textarea  name ="days" required>').addClass('form-control').text(tempDesc[i] == 'undefined' ? '' : tempDesc[i]);
                var day = $('<div>').addClass('form-group').append('<label>Day ' + (i + 1) + '</label>').append(text);
                $('#dayDesc').append(day);
            }
        });
        $(".image-picker").imagepicker();
        $(".image-picker").val('');
      $(".image-picker").data('picker').sync_picker_with_select();
      $(".image-picker2").imagepicker();
        var $modal = $('#myModal');
        var $modal2 = $('#secondModal');
        $('#btn').click(function (e) {
            e.preventDefault();
            $modal.css('display', 'block');
        });
        $('#btnS').click(function (e) {
            e.preventDefault();
            $modal2.css('display', 'block');
        });
        $('#xbtn').on('click', function () {
            $modal2.css('display', 'none');
        });
        $('#xxbtn').on('click', function () {
            $modal.css('display', 'none');
        });
        $(window).click(function (e) {
            if (e.target == $modal[0]) {
                $modal.css('display', 'none');
            } else if (e.target == $modal2[0]) {
                $modal2.css('display', 'none');
            }
        });
        $('#save-button').on('click', function (e) {
            if ($('.image-picker2').val() == null || $('.image-picker2').val().length < 1) {
                e.preventDefault();
                $('#slide-image').text('Please select at least 1 picture');
            } else {
                $('#slide-image').text('');
            }
            if ($('.image-picker').val() == null) {
                e.preventDefault();
                $('#product-image').text('Please select at least 1 picture');
            } else {
                $('#product-image').text('');
            }


        });
    });

</script>


</html>
