/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class UpdateCartAction {

    private int adultQuantity;
    private int childQuantity;

    public UpdateCartAction() {
    }

    public String execute() {
        try {
            if (adultQuantity > 0 && childQuantity >= 0) {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("adult", getAdultQuantity());
                request.setAttribute("child", getChildQuantity());
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update cart controller" + e.getMessage());
        }
        return "success";
    }

    public int getAdultQuantity() {
        return adultQuantity;
    }

    public void setAdultQuantity(int adultQuantity) {
        this.adultQuantity = adultQuantity;
    }

    public int getChildQuantity() {
        return childQuantity;
    }

    public void setChildQuantity(int childQuantity) {
        this.childQuantity = childQuantity;
    }
}
