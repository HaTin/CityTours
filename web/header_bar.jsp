<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s"  uri="/struts-tags"%>

<header>

    <div id="top_line">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6"><i class="icon-phone"></i><strong>0045 043204434</strong></div>

                <div class="col-md-6 col-sm-6 col-xs-6">


                    <ul id="top_links">

                        <s:if test="%{#session.user!=null}">     
                            <li>
                                <a href="profile.jsp"  id="access_link"><s:property value="#session.user.lastName" />
                                    <s:property value="#session.user.firstName" />
                                </a>
                            </li>
                            <li><a id="logout" class="log-out" href="logout">Log out</a></li>
                        </s:if>   
                        <s:else>
                            <li>
                                <a href="login.jsp"  id="access_link">Sign in</a>
                            </li>
                            <li><a href="register.jsp" id="wishlist_link">Sign up</a></li>
                        </ul>                            
                    </div> 
                </s:else>
            </div>
        </div><!-- End row -->
    </div><!-- End container-->
</div><!-- End top line-->

<div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-3">
            <div id="logo_home">
                <h1><a href="home" title="City tours travel template">City Tours travel template</a></h1>
            </div>
        </div>
        <nav class="col-md-9 col-sm-9 col-xs-9">
            <s:if test="%{#session.user.role == 'admin'}">
                <div class="main-menu">
                    <div id="header_menu">
                        <img src="img/logo_sticky.png" width="160" height="34" alt="City tours" data-retina="true">
                    </div>
                    <a href="#" class="open_close" id="close_in"><i class="icon_set_1_icon-77"></i></a>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="show-submenu">Tour<i class="icon-down-open-mini"></i></a>
                            <ul>
                                <li><a href="manageTour?page=1">All tours </a></li>
                                <li><a href="addTour">Add Tour</a></li>      
                                <li><a href="setDate">Set Date</a></li>    
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="show-submenu">Image<i class="icon-down-open-mini"></i></a><ul>
                                <li><a href="upload-image.jsp">Upload Image</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="show-submenu">User<i class="icon-down-open-mini"></i></a>
                            <ul>
                                <s:url id="viewuser" action="viewUser">
                                    <s:param name="page" value="1"/>                                                           
                                </s:url>
                                <li><s:a href="%{viewuser}">View Users</s:a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);" class="show-submenu">Location <i class="icon-down-open-mini"></i></a>
                                <ul>
                                <s:url id="viewLoc" action="viewLoc">
                                    <s:param name="page" value="1"/>                                                           
                                </s:url>
                                <li><s:a href="%{viewLoc}">All Location</s:a></li>   
                                  <li><a href="newLocation">Add Location</a></li>                                     
                                </ul>
                            </li>

                        </ul>
                    </div>
            </s:if>
            <ul id="top_tools">
                <li>

                </li>
                <li>
                    <div class="dropdown dropdown-cart">
                        <a href="cart.jsp"  ><i class=" icon-basket-1"></i>
                            <s:if test="%{#session.cart != null}">
                                Cart (<s:property value="%{#session.cart.items.size}"/>) 
                            </s:if>
                            <s:else>
                                Cart(0)
                            </s:else>
                        </a>
                    </div><!-- End dropdown-cart-->
                </li>
            </ul>
        </nav>
    </div>
</div><!-- container -->
</header><!-- End Header -->