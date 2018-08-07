<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<section id="search_container">
    <div id="search">
        <form action="searchTour" id="search-tour" method="GET">
            <div class="tab-content">
                <div class="tab-pane active" id="tours">
                    <h3>Book tickets for top attractions around the world</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group location">                           
                                <label>Origin</label>                          
                                <select class="ddslick" id="origin" name="origin">
                                </select>
                                     <h4 class='text-danger hide'>Please select origin</h4>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group location">
                                <label>Destination</label>
                                <select class="ddslick" id="destination" name="destination">
                                </select>
                                  <h4 class='text-danger hide'>Please select destination</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tour type</label>
                                <select class="ddslick" id="category">
                                    <option value="2" data-imagesrc="img/icons_search/historic.png">International Travel</option>
                                    <option value="1" data-imagesrc="img/icons_search/historic.png" selected>Domestic Travel</option>                                   
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="icon-calendar-7"></i> Date</label>
                                <input class="date-pick form-control" data-date-format="dd-mm-yyyy" type="text" name="date">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <s:hidden name="page" value="1"/>
                    <button type="submit" class="btn_1 green"><i class="icon-search"></i>Search now</button>
                </div>
            </div>
        </form>
    </div>
</section>

