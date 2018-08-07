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
public class RemoveTourDateAction {
      private int page;
        private int id;
        private String msg;
        private int tourId;
    public RemoveTourDateAction() {
    }
    
    public String execute() {
         try {
            if(id > 0){
                TourDao dao = new TourDao();
               boolean check = dao.removeTourDate(id);
                    if (check) {
                        setMsg("Remove successfully");
                    } else {
                        setMsg("Error please try again");
                    }
                   
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at remove tour date action "+e.getMessage());
        }
        return "success";
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
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

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }
    
}
