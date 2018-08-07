/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import dto.Image;
import java.util.List;
import org.apache.struts2.ServletActionContext;


/**
 *
 * @author dell
 */
public class LoadImageAction {
        private int tourId;
        private List<Image> imageList;
    public LoadImageAction() {
     
    }
    public String execute() throws Exception {
        try {
            if(tourId > 0){
           RegistrationDAO dao = new RegistrationDAO();
           imageList= dao.getImageList(tourId);
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at image controller "+e.getMessage());
        }
        return "success";
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

  
}
