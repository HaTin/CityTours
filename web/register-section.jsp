<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<section id="hero" class="login">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <div id="login">
                    <div class="text-center"><img src="img/logo_sticky.png" alt="Image" data-retina="true" ></div>
                    <hr>
                    <form id="register-form" method="POST"  action="register">
                        <div class="form-group">
                            <div class="alert-danger"></div>
                            <label>First Name</label>
                            <input type="text" class=" form-control" id="firstname" name="firstName" placeholder="First Name" value="<s:property value="firstName"/>">
                        </div>
                        <div class="form-group">
                            <div class="alert-danger"></div>
                            <label>Last Name</label>
                            <input type="text" class=" form-control" id="lastname"  name="lastName" placeholder="Last Name" value="<s:property value="lastName"/>">
                        </div>
                        <div class="form-group">
                            <s:if test="%{#request.emailErr!=null}">
                                <div class="alert-danger"><s:property value="#request.emailErr"/></div>    
                            </s:if>
                            <div class="alert-danger"></div>
                            <label>Email</label>
                            <input type="text" class=" form-control"  id="email" name="email" placeholder="Email" value="<s:property value="email"/>">
                        </div>
                        <div class="form-group">
                            <div class="alert-danger"></div>
                            <label>Password</label>
                            <input type="password" class=" form-control"  id="password" name="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <div class="alert-danger"></div>
                            <label>Confirm password</label>
                            <input type="password" class=" form-control" name="confirm" id="confirm" placeholder="Confirm password">
                        </div>
                        <div class="form-group">
                             <s:if test="%{#request.phoneErr!=null}">
                                <div class="alert-danger"><s:property value="#request.phoneErr"/></div>    
                            </s:if>
                            <div class="alert-danger"></div>
                            <label>Phone</label>
                            <input type="text" class=" form-control" id="phone" placeholder="Phone" name="phone" value="<s:property value="phone"/>">
                        </div>
                        <div id="pass-info" class="clearfix"></div>
                        <button class="btn_full" id="btnRegister">Create an account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
