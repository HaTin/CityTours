/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import dto.User;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class RegisterAction {

    private String firstName, lastName, email, password, phone;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    public RegisterAction() {
    }

    public String execute()  {
        String url = FAIL;
        try {                   
        if(firstName!= null && lastName != null && email!=null && password !=null && phone !=null){
        RegistrationDAO dao = new RegistrationDAO();
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        boolean check = dao.createUser(user);
        if (check) {
            url = SUCCESS;
        }
        }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at RegisterAction "+e.getMessage());
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
