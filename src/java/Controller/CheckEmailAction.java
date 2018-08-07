/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class CheckEmailAction {
    private String email;
    private boolean check;
    public CheckEmailAction() {
    }
    
    public String execute() {
        try {
            if(email!=null){
                RegistrationDAO dao = new RegistrationDAO();
                setCheck(dao.checkEmail(email));
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at check email action "+e.getMessage());
        }
        return "success";
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }
    
    
}
