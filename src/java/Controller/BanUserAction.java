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
public class BanUserAction {

    private int id;
    private int page;

    public BanUserAction() {
    }
    
    public String execute() {
        try {
            if (id > 0) {
                RegistrationDAO dao = new RegistrationDAO();
                boolean check = dao.banUser(id);
                if (!check) {
                    ServletActionContext.getRequest().setAttribute("error", "There some thing wrong please try again");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at ban user action " + e.getMessage());
        }
        return "success";
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getPage() {
        return page;
    }
    
    public void setPage(int page) {
        this.page = page;
    }
    
}
