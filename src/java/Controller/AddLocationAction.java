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
public class AddLocationAction {

    private int catId;
    private String locName;
    private String msg;

    public AddLocationAction() {
    }

    public String execute(){
        try {
            if (locName != null && catId > 0) {
                LocationDAO dao = new LocationDAO();
                boolean check = dao.insertLocation(locName, catId);
                if (check) {
                    setMsg("Insert successfully");
                } else {
                    setMsg("Error, Please try again");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at add location action " + e.getMessage());
            setMsg("Error, Please try again");
        }
        return "success";
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getLocName() {
        return locName;
    }

    public void setLocName(String locName) {
        this.locName = locName;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
