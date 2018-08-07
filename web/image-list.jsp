<%-- 
    Document   : cart
    Created on : Mar 4, 2018, 7:56:33 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>        
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <body>
        <%@include file="header_bar.jsp" %>

        <section id="hero_2">
            <div class="intro_title animated fadeInDown">
                <h1>View Slide Image</h1>
                <!-- End bs-wizard -->
            </div>
        </section>
        <main>


            <div class="margin_60 container">
                <s:if test="%{msg!=null}">
                    <h3><s:property value="msg"/></h3>
                    <hr>
                </s:if> 

                <form action="addImage" method="POST">
                    <div class="form-group">
                        <h4>Add New Image</h4>
                        <s:hidden id="hidden" name="img"/>
                        <s:hidden name="tourId" value="%{tourId}"/>
                        <div id="img-show"></div>
                        <hr>
                        <div class="form-inline">
                            <button id="select-image" class="btn btn-danger">Choose Image</button> 
                            <button id="btnsubmit"  type="submit" class="btn btn-success" style="display: none">Upload</button>     
                        </div>
                    </div>
                </form>
                <s:if test="%{list!=null}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="list" >
                                <tr>
                                    <th scope="row"><s:property value="id"/></th>

                                    <td><form action="updateImage" method="GET">
                                            <button href="#" class="bt">
                                                <img src="<s:property value="imgPath"/>" width="100" height="50">
                                                <s:hidden name="tourId" value="%{tourId}"/>
                                                <s:hidden name="id" value="%{id}"/>
                                                <s:hidden name="path" value="%{imgPath}"/>
                                            </button>
                                            <input type="submit" value="update">
                                        </form>
                                    </td>
                                    <s:url id="banLink" action="removeImage">
                                        <s:param name="id" value="%{id}"/>         
                                        <s:param name="tourId" value="%{tourId}"/>                                        
                                    </s:url>
                                    <td><s:a href="%{banLink}">Remove</s:a></td>
                                    </tr>
                            </s:iterator>
                        </tbody>
                    </table>

                </div>
                <div id="myModal" class="modal">
                    <div class="modal-content">
                        <span class="close" id="xxbtn">&times;</span>
                        <select class="image-picker" name="image" data-limit="1">
                            <s:iterator var="image" value="%{imageList}">
                                <option data-img-src="<s:property value="%{#image}"/>" value="<s:property value="%{#image}"/>" ></option>
                            </s:iterator>
                        </select>
                    </div>
                </s:if>
            </div>

        </main>
        <%@include file="footer.jsp" %>
    </body>
</script><script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<script src="js/image-picker.min.js"></script>
<script>
    $(function () {
        var $modal = $('#myModal');
        $('.bt').on('click', function (e) {
            var img = $($(this).children()[0]);
            var path = $($(this).children()[3]);
            e.preventDefault();
            $modal.css('display', 'block');
            $(".image-picker").imagepicker({
                selected: function () {
                    img.attr('src', $(this).val());
                    path.attr('value', $(this).val())
                    $modal.css('display', 'none');
                }
            });
        });
        $('#select-image').on('click', function (e) {
            if ($('tbody').children().length > 5) {
                $('#img-show').text('You have reached 6 images');
                e.preventDefault();
                return;
            } else {
                e.preventDefault();
                $modal.css('display', 'block');
                $(".image-picker").imagepicker({
                    selected: function () {
                        var img = $('<img>').attr('src', $(this).val()).css('width', '400px').css('height', '200px');
                        $('#img-show').html(img);
                        $('#hidden').val($(this).val());
                        $modal.css('display', 'none');
                        $('#btnsubmit').css('display', 'inline-block');
                    }
                });
            }
        });
        $('#xxbtn').on('click', function () {
            $modal.css('display', 'none');
        });
        $(window).click(function (e) {
            if (e.target == $modal[0]) {
                $modal.css('display', 'none');
            }
        });
    });
</script>
<!-- Specific scripts -->

</html>
