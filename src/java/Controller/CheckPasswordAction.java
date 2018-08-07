/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionContext;
import dao.RegistrationDAO;
import dto.User;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class CheckPasswordAction {

    private String password;
    private boolean check;

    public CheckPasswordAction() {
    }

    public String execute() {
        try {
            if (password != null) {
                Map session = ActionContext.getContext().getSession();
                User user = (User) session.get("user");
                if (user != null) {
                    RegistrationDAO dao = new RegistrationDAO();
                    String oldPassword = dao.checkPassword(user.getId());

                    if (getPassword().equals(oldPassword)) {
                        check = true;
                    } else {
                        check = false;
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at check password action " + e.getMessage());
        }
        return "success";
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }

}
