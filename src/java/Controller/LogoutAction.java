/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class LogoutAction {

    public LogoutAction() {
    }

    public String execute() {
        try {
            Map session = ActionContext.getContext().getSession();
            if (session.get("user") != null) {
                session.remove("user");
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at log out action" +e.getMessage());
        }
        return "success";
    }

}
