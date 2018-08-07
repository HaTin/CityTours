/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.TourDao;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class UpdateTourInfoAction {

    private int id;
    private int page;
    private int origin;
    private int category;
    private String name;
    private int destination;
    private int quantity;
    private String image;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String msg;

    public UpdateTourInfoAction() {
    }

    public String execute() {
        String url = FAIL;
        try {

            if (id > 0 && origin > 0 && destination > 0 && name != null && quantity > 0 && image != null) {
                TourDao dao = new TourDao();
                boolean check = dao.updateTourInfo(id, name, category, origin, destination, quantity);
                if (check) {
                    check = dao.updateMainImg(image, id);
                    if (check) {
                        url = SUCCESS;
                    }
                } else {
                    setMsg("Can not update please try again");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update tourinfo action " + e.getMessage());
        }
        return url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getOrigin() {
        return origin;
    }

    public void setOrigin(int origin) {
        this.origin = origin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDestination() {
        return destination;
    }

    public void setDestination(int destination) {
        this.destination = destination;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
