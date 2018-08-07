/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import dto.Tour;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class ViewTourAction {
     private int id;
     private Tour tour;
    private final String SUCCESS ="success";
    private final String FAIL = "fail";
    private String msg;
    public ViewTourAction() {
    }
    
    public String execute(){
        String url =FAIL;
        try {
            if(id>0){
            RegistrationDAO dao = new RegistrationDAO();
            tour = dao.getTour(id);
            if(tour!=null){
                url = SUCCESS;
            }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at view tour action "+e.getMessage());
        }
        return url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
}
