<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="hero" class="login">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <div id="login">
                    <div class="text-center"><img src="img/logo_sticky.png" alt="Image" data-retina="true" ></div>
                    <s:if test="%{#request.error!=null}">
                        <div class="alert-danger" ><s:property value="#request.error"/></div>
                    </s:if>
                    <s:if test="%{#request.requireLogin!=null}">
                        <div class="alert-danger" ><s:property value="#request.requireLogin"/></div>
                    </s:if>
                    <form action="login" method="POST">         
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class=" form-control " placeholder="Email" name="email" required="true" value="<s:property value="email"/>" >
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class=" form-control" name="password" placeholder="Password"  required="true">
                        </div>                                    
                        <input type="submit" class="btn_full" value="Sign In"/>
                        <a href="register.jsp" class="btn_full_outline">Register</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
