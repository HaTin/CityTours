/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionContext;
import dto.Cart;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class RemoveItemAction {
    int cartId;
    public RemoveItemAction() {
    }
    
    public String execute() {
        try {
            if(cartId > 0){
            Map session = ActionContext.getContext().getSession();
            Cart cart = (Cart)session.get("cart");
            cart.remove(cartId);
            session.put("cart", cart);
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at remove item controller "+e.getMessage());
        }
        return "success";
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    
}
