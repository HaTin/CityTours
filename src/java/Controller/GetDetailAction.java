/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class GetDetailAction {
    private int tourId;
    private List<String> detail;
    public GetDetailAction() {
        
    }
    
    public String execute() {
         try {          
             if(tourId>0){
            RegistrationDAO dao = new RegistrationDAO();
            detail = dao.getTourDetail(tourId);          
             }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at get detail controller " + e.getMessage());
        }
         return "success";
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public List<String> getDetail() {
        return detail;
    }

    public void setDetail(List<String> detail) {
        this.detail = detail;
    }

   
    
}
