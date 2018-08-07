    <%@taglib prefix="s" uri="/struts-tags" %>                
<div class="container margin_60">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <s:if test="%{#request.list.size > 0}">
                            <s:iterator value="#request.list">
                                <div class="strip_all_tour_list wow fadeIn" data-wow-delay="0.1s">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                            <div class="img_list">
                                                <a href="viewTour?id=<s:property value="%{id}"/>"><img src="<s:property value="%{imgPath}"/>" alt="Image">
                                                    <div class="short_info"><i class="icon-calendar-5"></i><s:property value="%{date}"/></div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="clearfix visible-xs-block"></div>
                                        <div class="col-lg-7 col-md-7 col-sm-7">
                                            <div class="tour_list_desc">

                                                <p style="font-size: 20px; color: black;font-weight: bold">
                                                    <s:property value="%{name}"/>
                                                <p>
                                                <div class="row">  
                                                    <div class="col-lg-8 col-md-8 col-sm-8">
                                                        <h4> <i class="icon-barcode"></i> <s:property value="%{id}"/></h4>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                                        <h4> <i class="icon-clock-1"></i><s:property value="%{time}"/></h4>
                                                    </div>
                                                </div>
                                                <div class="row">  
                                                    <div class="col-lg-8 col-md-8 col-sm-8">
                                                        <h4> <i class="icon-table"></i>Number of days : <s:property value="%{duration}"/></h4>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                                        <h4> <s:if test="%{quantity > 0}">
                                                               <i class="icon-adult"></i>Available :  <s:property value="%{quantity}"/>
                                                        </s:if>
                                                              <s:else><i class="icon-adult"></i> Full</s:else></h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2">
                                            <div class="price_list">
                                                <div><sup>$</sup><s:text name="{0,number,##}"><s:param value="%{price}"/></s:text><small>*Per person</small>
                                                    <p><a href="viewTour?id=<s:property value="%{id}"/>" class="btn_1">Details</a>
                                                    </p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </s:iterator>
                            <!--End strip -->
                        </s:if>
                        <s:else>
                            <h1>No result found ! Please try again</h1>
                        </s:else>
                      

                    </div>
                    <!-- End col lg-9 -->
                </div>
                <!-- End row -->
            </div>