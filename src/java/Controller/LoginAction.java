/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.RegistrationDAO;
import dto.User;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class LoginAction extends ActionSupport {

    private String email;
    private String password;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public LoginAction() {

    }

    @Override
    public String execute() {
        String url = FAIL;
        try {
          if(email!=null && password!=null){
            RegistrationDAO dao = new RegistrationDAO();
            User user = dao.checkLogin(email, password);
            if (user != null) {
                Map session = ActionContext.getContext().getSession();
                session.put("user", user);
                url = SUCCESS;
            } else {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("error", "Invalid email or password");
            }
             }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at login controller " + e.getMessage());
        }
        return url;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
