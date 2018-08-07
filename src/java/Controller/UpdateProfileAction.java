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
public class UpdateProfileAction {

    private String firstName;
    private String lastName;
    private String phone;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public UpdateProfileAction() {
    }

    public String execute() {
        String url = FAIL;
        try {
            if (firstName != null && lastName != null && phone != null) {
                Map session = ActionContext.getContext().getSession();
                User user = (User) session.get("user");
                if (user != null) {
                    RegistrationDAO dao = new RegistrationDAO();
                    boolean check = dao.updateUserProfile(user.getId(), firstName, lastName, phone);
                    if (check) {
                        user.setFirstName(firstName);
                        user.setLastName(lastName);
                        user.setPhone(phone);
                        session.put("user", user);
                        ServletActionContext.getRequest().setAttribute("success", "Profile has been update succesfully");
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update profile action " + e.getMessage());
            ServletActionContext.getRequest().setAttribute("error", "Phone is already existed,Please choose another");
        }
        return url;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
