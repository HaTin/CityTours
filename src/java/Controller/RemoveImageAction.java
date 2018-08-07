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
public class RemoveImageAction {
    private int tourId;
    private int id;
    private String msg;

    public RemoveImageAction() {
    }

    public String execute() throws Exception {
         try {
            if (id>0) {
                TourDao dao = new TourDao();
                boolean check = dao.removeImage(id);
                if (check) {
                    setMsg("Remove image succesfully");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at remove image action " + e.getMessage());
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
