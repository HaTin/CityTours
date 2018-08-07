<%@taglib uri="/struts-tags" prefix="s"%>
<div class="container margin_60">

    <div class="main_title">
        <h2>Vietnam <span>New</span> Tours</h2>
        <p>Discover and experience the attractive tours around Vietnam</p>
    </div>
    <div class="row">
        <s:iterator value="%{list}">
            <div class="col-md-4 col-sm-6 wow zoomIn" data-wow-delay="0.1s">
                <div class="ribbon_3 new"><span>New</span></div>
                <div class="tour_container">
                    <div class="img_container">
                        <s:url var="view" action="viewTour">
                            <s:param name="id" value="id"/>
                        </s:url>
                        <s:a href="%{view}">
                            <img src="<s:property value="imgPath"/>" alt="Image" height="200px" width="400px">
                            <div class="short_info">
                                <span class="price"><sup>$</sup><s:text name="{0,number}"><s:param value="price"/></s:text></span>
                            </div>
                        </s:a>
                    </div>
                    <div class="tour_title">
                        <h3><strong><s:property value="name"/></strong> </h3>
                        <div class="rating">
                            <span><s:property value="date"/> |  <s:property value="duration"/> days<span class="seat"><s:property value="quantity"/> seats</span>
            
                                    </span> 
                        </div>

                    </div>

                </div>

            </div>
        </s:iterator>
    </div>

</div>