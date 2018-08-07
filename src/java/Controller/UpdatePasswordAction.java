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
public class UpdatePasswordAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String password;

    public UpdatePasswordAction() {
    }

    public String execute() {
        String url = FAIL;
        try {
            if(password!=null){
            Map session = ActionContext.getContext().getSession();
            User user = (User) session.get("user");
            if (user != null) {
                RegistrationDAO dao = new RegistrationDAO();
                boolean check = dao.updatePassword(user.getId(), password);
                if (check) {
                    ServletActionContext.getRequest().setAttribute("success", "Password has been update succesfully");
                    url = SUCCESS;
                }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update password action " + e.getMessage());
            ServletActionContext.getRequest().setAttribute("error", "There is something wrong please try again");
        }
        return url;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
