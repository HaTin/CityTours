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
public class UpdateImageAction {
    private int tourId;
    private int id;
    private String path;
    private String msg;
    public UpdateImageAction() {
    }
    
    public String execute() {
        try {
            if(id > 0){
                TourDao dao = new TourDao();
                System.out.println(id);
                System.out.println(path);
               boolean check = dao.updateImage(id, path);
               if(check){
                   setMsg("Update successfully");
               }else{
                   setMsg("Error, Please try again");
               }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at upload image action");
              setMsg("Error, Please try again");
        }
        return "success";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
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
    
}
