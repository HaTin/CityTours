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
public class CheckPhoneAction {

    private String phone;
    private boolean msg;

    public CheckPhoneAction() {
    }

    public String execute() {
        try {
            if (phone != null) {
                RegistrationDAO dao = new RegistrationDAO();
                setMsg(dao.checkPhone(phone));
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at check phone action " + e.getMessage());
        }
        return "success";
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isMsg() {
        return msg;
    }

    public void setMsg(boolean msg) {
        this.msg = msg;
    }

}
