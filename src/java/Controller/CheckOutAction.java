/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionContext;
import dao.OrderDAO;
import dto.Cart;
import dto.User;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class CheckOutAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String LOGIN = "login";
    private int orderId;
    private Timestamp date;
    private Cart cart;

    public CheckOutAction() {

    }

    public String execute() {
        String url = FAIL;
        try {
            Map session = ActionContext.getContext().getSession();
            Cart cart = (Cart) session.get("cart");
            User user = (User) session.get("user");
            if (user == null) {
                ServletActionContext.getRequest().setAttribute("requireLogin", "Please login to check out");
                url = LOGIN;
            } else if (cart != null && cart.getItems().size() > 0) {
                OrderDAO dao = new OrderDAO();
                setDate(new Timestamp(new Date().getTime()));
                orderId = dao.insertOrder(user.getId(), cart.getTotal(), getDate());
                if (orderId != -1) {
                    boolean check = dao.insertOrderDetail(orderId, cart);
                    if (check) {
                        dao.changeQuantity(cart);
                        setCart(cart);
                        session.remove("cart");
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at checkout action " + e.getMessage());
            ServletActionContext.getRequest().setAttribute("errorCheckout", "There is something wrong please try again");
        }
        return url;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

}
