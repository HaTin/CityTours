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
public class AddImageAction {

    private int tourId;
    private String img;
    private String msg;

    public AddImageAction() {
    }

    public String execute() {
        try {
            if (tourId > 0 && img != null && img.length() > 0) {
                TourDao dao = new TourDao();
                boolean check = dao.insertImage(tourId, img, 0);
                if (check) {
                    setMsg("Insert image succesfully");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at add image action " + e.getMessage());
            setMsg("Error, please try again");
        }
        return "success";
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
