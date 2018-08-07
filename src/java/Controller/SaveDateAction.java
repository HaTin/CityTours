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
public class SaveDateAction {
    private int tourID;
    private String date;
    private String time;
    private double adultPrice;
    private double childPrice;
    private String msg;

    public SaveDateAction() {
    }

    public String execute() {
        try {
           if (tourID > 0 && date != null && adultPrice > 0 && childPrice > 0) {
                TourDao dao = new TourDao();
                int quantity = dao.getTourQuantity(tourID);
                if (quantity > 0) {
                    boolean check = dao.insertTourDate(tourID, adultPrice, childPrice, date,time,quantity);
                    if (check) {
                        setMsg("Add successfully");
                    } else {
                        setMsg("There something wrong please try again");
                    }
                }
            }
        } catch (Exception e) {
            setMsg("There something wrong please try again");
            ServletActionContext.getServletContext().log("error at tour date action" + e.getMessage());
        }
        return "success";
    }

    public int getTourID() {
        return tourID;
    }

    public void setTourID(int tourID) {
        this.tourID = tourID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getAdultPrice() {
        return adultPrice;
    }

    public void setAdultPrice(double adultPrice) {
        this.adultPrice = adultPrice;
    }

    public double getChildPrice() {
        return childPrice;
    }

    public void setChildPrice(double childPrice) {
        this.childPrice = childPrice;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

}
