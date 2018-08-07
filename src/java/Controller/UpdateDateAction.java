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
public class UpdateDateAction {
    private String date;
    private String time;
    private double childPrice,adultPrice;
    private int id;
    private int page;
    private int remain;
    private String msg;
    private int tourId;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    public UpdateDateAction() {
    }
    
    public String execute(){
        String url = FAIL;
        try {
            if(id>0 && childPrice>0 && adultPrice > 0 && date !=null && time !=null){
                TourDao dao = new TourDao();
                boolean check = dao.updateTourDate(id, childPrice, adultPrice, remain, date, time);
                if(check) {
                    setMsg("Update successfully");
                    url = SUCCESS;
                }else{
                    setMsg("error please try again");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update date action "+e.getMessage());
        }
        return url;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }
    
}
