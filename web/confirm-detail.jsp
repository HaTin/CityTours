<%@taglib prefix="s" uri="/struts-tags" %>
<main>
    <div id="position">
        <div class="container">
            <ul>
                <li><a href="#">Home</a>
                </li>
                <li><a href="#">Category</a>
                </li>
                <li>Confirm</li>
            </ul>
        </div>
    </div>
    <!-- End position -->

    <div class="container margin_60">
        <div class="row">
            <div class="col-md-12 add_bottom_15">

                <div class="form_title">
                    <h3><strong><i class="icon-ok"></i></strong>Thank you!</h3>
                </div>

                <div class="step">
                    <p>Dear <s:property value="%{#session.user.firstName}"/>,</p>
                    <p>
                        Thank you for booking with City Tour, We received your order, and we're processing it now.
                        Please see details below.
                    </p>
                </div>
                <!--End step -->

                <div class="form_title">
                    <h3><strong><i class="icon-tag-1"></i></strong>Booking summary</h3>
                    <h3>Order #<s:property value="orderId"/> </h3>
                    <h4>Order #<s:property value="orderId"/> was placed on <s:date name="%{date}" format="dd-MM-yyyy" /></h4>
                </div>
                <div class="step">
                    <s:iterator var="item" value="%{cart.items.values}"> 
                        <table class="table confirm">
                            <thead>
                                <tr>
                                    <th colspan="2">
                                        Tour no #<s:property value="#item.id"/>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <strong>Tour name</strong>
                                    </td>
                                    <td>
                                     <s:property value="#item.name"/>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <strong>Quantity</strong>
                                    </td>
                                    <td>
                                        Adult  x <s:property value="#item.adultQuantity"/>
                                        <s:if test="%{#item.childQuantity > 0}">
                                        , Children x <s:property value="#item.childQuantity"/>
                                        </s:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Departure Time</strong>
                                    </td>
                                    <td>
                                    <s:property value="#item.time"/> | <s:property value="#item.date"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Total</strong>
                                    </td>
                                    <td>
                                        <s:text name="{0,number,##0$}"><s:param value="%{#item.childQuantity*#item.childPrice + #item.adultQuantity*#item.price}"/></s:text>
                                    </td>
                                </tr>
                            
                            </tbody>
                        </table>
                    </s:iterator>
                    <div id="total-left"><strong>Total :   <s:text name="{0,number,##0$}"><s:param value="cart.total"/></s:text></strong></div>
                </div>
                <!--End step -->
            </div>
            <!--End col-md-8 -->


        </div>
        <!--End row -->
    </div>
    <!--End container -->
</main>