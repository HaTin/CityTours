<%@taglib prefix="s" uri="/struts-tags" %>        
<main>
    <div id="position">
        <div class="container">
            <ul>
                <li><a href="#">Home</a>
                </li>
                <li><a href="#">Profile</a>
                </li>

            </ul>
        </div>
    </div>
    <!-- End Position -->

    <div class="margin_60 container">
        <s:if test="%{#request.error!=null}">
            <h3 style="color:#e04f67;"><s:property value="#request.error"/></h3>
        </s:if>
            <s:elseif test="%{#request.success!=null}">
                        <h3><s:property value="#request.success"/></h3>
        </s:elseif>
        <div id="tabs" class="tabs">
            <nav>
                <ul>
                    <li><a href="#section-3" class="icon-profile"><span>Profile</span></a>
                    </li>
                    <li><a href="#section-4" class="icon-settings"><span>Settings</span></a>
                    </li>

                </ul>
            </nav>
            <div class="content">
                <section id="section-3">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <h4>Your profile</h4>
                            <ul id="profile_summary">
                                <li>Email <span><s:property value="#session.user.email"/></span>
                                </li>
                                <li>First name <span><s:property value="#session.user.firstName"/></span>
                                </li>
                                <li>Last name <span><s:property value="#session.user.lastName"/></span>
                                </li>
                                <li>Phone number <span><s:property value="#session.user.phone"/></span>
                                </li>

                            </ul>
                        </div>

                    </div>
                    <!-- End row -->

                    <div class="divider"></div>
     <form id="update-form" action="updateProfile" method="POST">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Edit profile</h4>
                        </div>
                   
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>First name</label>
                                    <input class="form-control" value="<s:property value="#session.user.firstName"/>" name="firstName" id="first_name" type="text">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Last name</label>
                                    <input class="form-control" value="<s:property value="#session.user.lastName"/>" name="lastName" id="last_name" type="text" >
                                </div>
                            </div>
                    </div>
                    <!-- End row -->

                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <label>Phone number</label>
                                <input class="form-control" value="<s:property value="#session.user.phone"/>" name="phone" id="phone" type="text">
                            </div>
                        </div>

                    </div>
                    <hr>
                    <button type="submit" class="btn_1 green">Update Profile</button>
                    </form>
                </section>                       
                <!-- End section 2 -->
                '
                <section id="section-4">
                    <form id="update-password" action="updatePassword" method="POST">
                    <div class="row">
                             <div class="col-md-12">
                            <h4>Change your password</h4>
                        </div>
                        <div class="col-md-6 col-sm-6">
                   
                            <div class="form-group">
                                <label>Old password</label>
                                <input class="form-control" name="old-password" id="old_password" type="password">
                            </div>
                               </div>
                                     <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <label>New password</label>
                                <input class="form-control" name="password" id="new_password" type="password">
                            </div>
                                 </div>
                                </div>
                        <div class="row">
                              <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <label>Confirm new password</label>
                                <input class="form-control" name="confirm" id="confirm_new_password" type="password" >
                            </div>
                              </div>
                        </div>
                        <br>
                            <button type="submit" class="btn_1 green">Update Password</button>
                            
                     

            
                    <!-- End row -->



                    <!-- End row -->
                           </form>
                </section>
 

            </div>
            <!-- End content -->
        </div>
        <!-- End tabs -->
    </div>
    <!-- end container -->
</main>
