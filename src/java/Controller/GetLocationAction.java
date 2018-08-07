/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import dto.Location;
import java.util.List;
import org.apache.struts2.ServletActionContext;


/**
 *
 * @author dell
 */
public class GetLocationAction {
    private List<Location> locList;
    private int id;
    private String text;
    public GetLocationAction() {
       
    }
    
    public String execute() {
           try {
               if(id>=0 && text !=null){
            RegistrationDAO dao = new RegistrationDAO();
               setLocList(dao.getLocation(getId(),getText()));
               }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at get location action "+e.getMessage());
        }
       return "success";
    }

    public List<Location> getLocList() {
        return locList;
    }

    public void setLocList(List<Location> locList) {
        this.locList = locList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

 
}
