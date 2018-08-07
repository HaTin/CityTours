/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.LocationDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class RemoveLocationAction {

    int id;
    int page;
    String msg;

    public RemoveLocationAction() {

    }

    public String execute() {
        try {
            if (id > 0) {
                LocationDAO dao = new LocationDAO();
                boolean check = dao.checkLocationInTour(id);
                if (!check) {
                    check = dao.removeLocation(id);
                    if (check) {
                        setMsg("Remove successfully");
                    } else {
                        setMsg("Error please try again");
                    }
                }else {
                    setMsg("Please remove all tour with this location first");
                }
            }
        } catch (Exception e) {
            setMsg("Error please try again");
            ServletActionContext.getServletContext().log("error at remove location action " + e.getMessage());
        }
        return "success";
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

}
