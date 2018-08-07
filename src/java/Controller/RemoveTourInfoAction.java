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
public class RemoveTourInfoAction {
        private int page;
        private int id;
        private String msg;
    public RemoveTourInfoAction() {
    }
    
    public String execute(){
        try {
            if(id > 0){
                TourDao dao = new TourDao();
                boolean check = dao.checkTourCre(id);
                 if (!check) {
                    check = dao.removeTourInfo(id);
                    if (check) {
                        setMsg("Remove successfully");
                    } else {
                        setMsg("Error please try again");
                    }
                }else {
                    setMsg("Please remove all available date with this tour first");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at remove tour info action "+e.getMessage());
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
    
}
