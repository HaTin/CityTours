/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionContext;
import dao.TourDao;
import dto.Cart;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class AddToCartAction {
  
    private int id;
    private double childPrice, adultPrice;
    private int childQuantity, adultQuantity;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String msg;
    public AddToCartAction() {

    }

    public String execute() {
        String url = FAIL;
        try {
            if (id > 0 && adultQuantity > 0) {
                Map session = ActionContext.getContext().getSession();
                Cart cart = null;
                if (!session.containsKey("cart")) {
                    cart = new Cart();
                } else {
                    cart = (Cart) session.get("cart");
                }
                TourDao dao = new TourDao();
                int quantity = dao.getRemainQuantity(id);
                if (quantity > 0) {
                    if (childQuantity + adultQuantity > quantity) {
                        setMsg("Only " + quantity + " seats left please select approriate number");
                    }
                    else{
                    cart.addToCart(id, childQuantity, adultQuantity, childPrice, adultPrice);
                    session.put("cart", cart);
                    url = SUCCESS;
                    }
                }

            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at add to cart action " + e.getMessage());
        }
        return url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getChildPrice() {
        return childPrice;
    }

    public void setChildPrice(double childPrice) {
        this.childPrice = childPrice;
    }

    public double getAdultPrice() {
        return adultPrice;
    }

    public void setAdultPrice(double adultPrice) {
        this.adultPrice = adultPrice;
    }

    public int getChildQuantity() {
        return childQuantity;
    }

    public void setChildQuantity(int childQuantity) {
        this.childQuantity = childQuantity;
    }

    public int getAdultQuantity() {
        return adultQuantity;
    }

    public void setAdultQuantity(int adultQuantity) {
        this.adultQuantity = adultQuantity;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
