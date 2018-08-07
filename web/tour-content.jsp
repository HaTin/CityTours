<%-- 
    Document   : tour-content
    Created on : Mar 4, 2018, 8:01:52 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<main>
    <div id="position">
        <div class="container">
            <ul>
                <li><a href="homepage.jsp">Home</a>
                </li>
                <li><s:property value="tour.name"/></li>
            </ul>
        </div>
    </div>
    <div class="container margin_60">
        <div class="row">
            <div class="col-md-8" id="single_tour_desc">

                <div id="Img_carousel" class="slider-pro">
                    <div class="sp-slides" id="slides">                               
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="font-weight-bold text-uppercase">Information</h2>
                    </div>
                </div>
                <div class="row">             
                    <div class="col-md-12" >
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <td>
                                        <strong><i class="icon-barcode"></i> ID</strong>
                                    </td>
                                    <td>
                                        <strong><s:property value="tour.id"/></strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><i class="icon-clock-5"></i>Time</strong>
                                    </td>
                                    <td>
                                        <strong><s:property value="tour.time"/></strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><i class="icon-calendar-5"></i>Date</strong>
                                    </td>
                                    <td>
                                        <strong><s:property value="tour.date"/></strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><i class="icon-table"></i>Duration</strong>
                                    </td>
                                    <td>
                                        <strong><s:property value="tour.duration"/> days</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><i class="icon-location-5"></i>Origin</em></strong>
                                    </td>
                                    <td>
                                        <strong><s:property value="tour.origin"/></strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><i class="icon-adult"></i>Available Seat</strong>
                                    </td>
                                    <td>
                                        <s:if test="tour.quantity > 0">
                                            <strong><s:property value="tour.quantity"/></strong>
                                        </s:if>
                                        <s:else><strong>0</strong>
                                        </s:else>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>    
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="font-weight-bold text-uppercase">Schedule</h2>
                    </div>
                </div>

                <div class="row">                         
                    <div class="col-md-12" id="description">                                                                                                    
                    </div>
                </div>


            </div>
            <!--End  single_tour_desc-->

            <aside class="col-md-4">

                <div class="box_style_1 expose">
                    <h3 class="inner">- Booking -</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <span class="price"><strong class="pink">Adult: </strong>
                                <s:text name="{0,number,##0$}"><s:param value="tour.Price"/></s:text>
                                </span>
                            </div>
                            <div class="col-md-6">
                                <span class="price"><strong class="pink">Children: </strong><s:text name="{0,number,##0$}"><s:param value="tour.childPrice"/></s:text></span>
                            </div>
                        </div>
                        <hr>
                        <form id="addCartForm" action="addToCart" method="POST">
                        <s:hidden name = "id" value="%{tour.id}"/>
                        <s:hidden name = "childPrice" value="%{tour.childPrice}"/>
                        <s:hidden name = "adultPrice" value="%{tour.price}"/>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group" id="adult-form">                                        
                                    <label>Adults</label>
                                    <div class="numbers-row">
                                        <input type="text" value="<s:if test="%{#request.adult!=null}"><s:property value="#request.adult"/></s:if><s:else>1</s:else>" id="adults" class="qty2 form-control" name="adultQuantity" readonly="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group" id="child-form">
                                        <label>Children</label>
                                        <div class="numbers-row">
                                                <input type="text" value="<s:if test="%{#request.child!=null}"><s:property value="#request.child"/></s:if><s:else>0</s:else>" id="children" class="qty2 form-control" name="childQuantity" readonly="true">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>                             
                            <table class="table table_summary">
                                <tbody>
                                    <tr>
                                        <td>
                                            Adults
                                        </td>
                                        <td class="text-right" id="a-quantity">
                                            1
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Children
                                        </td>
                                        <td class="text-right" id="c-quantity">
                                            0
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Total amount
                                        </td>
                                        <td class="text-right" id="total">
                                                1x <s:text name="{0,number,##0$}"><s:param value="tour.Price"/></s:text>
                                        </td>
                                    </tr>
                                    <tr class="total">
                                        <td>
                                            Total cost
                                        </td>
                                        <td class="text-right" id="total-cost">
                                        <s:text name="{0,number,##0$}"><s:param value="tour.Price"/></s:text>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        <s:if test="%{tour.quantity > 0}">
                            <s:if test="%{tour.id in #session.cart.items.keys}">
                            <button class="btn_full" id="add" type="submit">Update cart</button>
                            </s:if>
                            <s:else>
                            <button class="btn_full" id="add" type="submit">Add to cart</button>
                            </s:else>
                        </s:if>
                        <s:else>
                            <div class="btn_full" style="background:#d9534f;">Not Available</div>
                        </s:else>
                            <div class="text-danger"><s:property value="%{msg}"/></div>
                    </form>
                </div>
                <!--/box_style_1 -->

                <div class="box_style_4">
                    <i class="icon_set_1_icon-90"></i>
                    <h4><span>Book</span> by phone</h4>
                    <a href="tel://004542344599" class="phone">+45 423 445 99</a>
                    <small>Monday to Friday 9.00am - 7.30pm</small>
                </div>
            </aside>
        </div>
        <!--End row -->
    </div>
</main>