<%-- 
    Document   : tour-detail
    Created on : Mar 1, 2018, 6:13:28 PM
    Author     : dell
--%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>
        <section class="parallax-window" data-parallax="scroll" data-image-src="" data-natural-width="1400" data-natural-height="470">
            <div class="parallax-content-2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <h1><s:property value="tour.name"/></h1>       
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div id="price_single_main">
                                from/per person <span><sup>$</sup><s:text name="{0,number,##0}"><s:param value="tour.Price"/></s:text></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>       
        <%@include file="tour-content.jsp"  %>
        <%@include file="footer.jsp" %>
    </body>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/common_scripts_min.js"></script>
    <script src="js/functions.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.ddslick.js"></script>
    <script src="js/app.js"></script> 
    <script src="js/jquery.sliderPro.min.js"></script>
    <script>
        $(function () {
            $.ajax({
                data: {
                    tourId: <s:property value="tour.infoID"/>
                },
                url: 'getTourDetail',
                type: 'GET',
                success: function (data) {
                    for (var i in data) {
                        var thead = "<thead><tr><th><h4 class='text-uppercase font-weight-bold pink'>Day " + (parseInt(i)+1) + "</h4></th></tr></thead>";
                        var tbody = "<tbody><tr><td>" + data[i] + "</td></tr></tbody>";
                        var table = $('<table>').append(thead).append(tbody).addClass("table table-striped");
                        $('#description').append(table);
                    }
                },
                error: function (e) {
                    console.log("error detail");
                }
            });
        })
    </script>
    <script>
        $(function () {
            $.ajax({
                data: {
                    tourId: <s:property value="tour.infoID"/>
                },
                url: 'getImageList',
                type: 'POST',
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].isMain == 1) {
                            $('.parallax-slider').attr('src', data[i].imgPath);
                        } else {
                            var image = $('<img>').attr('alt', 'Image').attr('data-src', data[i].imgPath).attr('height', 500).attr('width', 960)
                            var div = $('<div>').addClass('sp-slide').append(image);
                            $('#slides').append(div);
                        }
                    }
                    $('#Img_carousel').sliderPro({
                        width: 960,
                        height: 500,
                        fade: false,
                        arrows: true,
                        buttons: false,
                        fullScreen: false,
                        responsive: true,
                        startSlide: 0,
                        mediumSize: 500,
                        thumbnailArrows: true,
                        autoplay: true
                    });
                },
                error: function (e) {
                    console.log("error detail");
                }
            });
        })
    </script>
    <script>
        $(function () {
            var seat = parseInt('<s:property value="tour.quantity"/>');
            var adultPrice = parseFloat("<s:property value="tour.price"/>");
            var childPrice = parseFloat("<s:property value="tour.childPrice"/>");
            var $inputAdult = $('#adults');
            var $inputChild = $('#children');
            $('#a-quantity').text($inputAdult.val());
            $('#c-quantity').text($inputChild.val());
            
            var setOrder = function () {
                $('#a-quantity').text($inputAdult.val());
                $('#c-quantity').text($inputChild.val());
                var totalA = '' + $inputAdult.val() + 'x $' + adultPrice;
                var totalC =$inputChild.val() > 0 ? ' + ' + $inputChild.val() + 'x $' + childPrice : '';
                $('#total').text(totalA + totalC);
                var totalCost = adultPrice * $inputAdult.val() + childPrice * $inputChild.val();
                $('#total-cost').text(totalCost+"$");
            }
            setOrder();
            var checkInput = function () {
                if ($('#adults').val() == 0)
                    $('#adults').val(1)
            }
            var processForm = function () {
                checkInput();
                setOrder();
            }
            $('#adult-form .button_inc').click(processForm);
            $('#child-form .button_inc').click(processForm);
            $('#add').click(function(e){
                e.preventDefault();
                if((parseInt($inputAdult.val())+parseInt($inputChild.val())) > seat){
                    $('#addCartForm').children().last().text('Only ' +seat +' seats left please select approriate number');
                }       else{
                $('#addCartForm').submit();
            }
            });
        });
    </script>
</html>
