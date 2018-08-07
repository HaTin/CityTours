<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<main>
    <div id="position">
        <div class="container">
            <ul>
                <li><a href="#">Home</a>
                </li>
                <li><a href="#">Category</a>
                </li>
                <li>Place your order</li>
            </ul>
        </div>
    </div>
    <!-- End position -->

    <div class="container margin_60">
        <s:if test="%{#request.errorCheckout != null}">
            <h3 style="color:red;"><s:property value="#request.errorCheckout"/></h3>
        </s:if>
        <div class="row">
            <s:if test="%{#session.cart.items.size > 0}">

                <div class="col-md-8">
                    <table class="table table-striped cart-list add_bottom_30">
                        <thead>
                            <tr>
                                <th>
                                    Item
                                </th>
                                <th>
                                    Adults
                                </th>
                                <th>
                                    Children
                                </th>
                                <th>
                                    Total
                                </th>
                                <th>
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator var="item" value="%{#session.cart.items.values}">                
                            <form action="updateCart" theme="simple" method="GET">
                                <tr>
                                    <s:hidden name="id" value="%{#item.id}"/>
                                    <s:hidden name="adultQuantity" value="%{#item.adultQuantity}"/>
                                    <s:hidden name="childQuantity" value="%{#item.childQuantity}"/>
                                    <td>
                                        <div class="thumb_cart">
                                            <img src="<s:property value="%{#item.imgPath}"/>" alt="Image" height="80">                         
                                        </div>
                                        <span class="item_cart">#<s:property value="%{#item.id}"/> <s:property value="%{#item.name}"/>
                                        </span>
                                    </td>
                                    <td align="center">
                                        <span><s:property value="%{#item.adultQuantity}"/></span>
                                    </td>
                                    <td align="center">        
                                        <span><s:property value="%{#item.childQuantity}"/></span>                               
                                    </td>
                                    <td>
                                        <strong><s:text name="{0,number,##0$}"><s:param value="%{#item.childQuantity*#item.childPrice + #item.adultQuantity*#item.price}"/></s:text></strong>
                                        </td>
                                        <td class="options">
                                        <s:url var="removeLink" action="removeItem">
                                            <s:param name="cartId" value="%{#item.id}"/>
                                        </s:url>
                                        <s:a href="%{removeLink}"><i class=" icon-trash"></i></s:a>
                                            <button type="submit" class="updateBtn"><i class="icon-ccw-2"></i></button>                                      
                                        </td>                                     
                                    </tr>
                                </form>
                        </s:iterator>
                        </tbody>
                    </table>


                </div>
                <!-- End col-md-8 -->

                <aside class="col-md-4">
                    <div class="box_style_1">
                        <h3 class="inner">- Summary -</h3>
                        <table class="table table_summary">
                            <tbody>          
                                <tr class="total">
                                    <td>
                                        Total cost
                                    </td>
                                    <td class="text-right">
                                        <s:text name="{0,number,##0$}"><s:param value="%{#session.cart.total}"/></s:text>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <a class="btn_full" href="checkout">Check out</a>
                        </div>
                        <div class="box_style_4">
                            <i class="icon_set_1_icon-57"></i>
                            <h4>Need <span>Help?</span></h4>
                            <a href="tel://004542344599" class="phone">+45 423 445 99</a>
                            <small>Monday to Friday 9.00am - 7.30pm</small>
                        </div>
                    </aside>
                                 
                    <!-- End aside -->
            </s:if>
                    
            <s:else>
                <div class="col-md-12">
                    <h1 class="font-weight-bold">Your shopping cart is empty.</h1>
                    <h3  id="cart-empty"><i class="icon-clock-1"></i>Once you add an activity to your cart, we will save your cart for 30 minutes.</h3>
                </div>
            </s:else>
        </div>
        <!--End row -->


    </div>


    <!--End container -->
</main> 

