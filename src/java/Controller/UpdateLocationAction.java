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
public class UpdateLocationAction {

    private static final String FAIL = "fail";
    private static final String SUCCESS = "success";
    private String locName;
    private int locId;
    private int catId;
    private int page;

    public UpdateLocationAction() {
    }

    public String execute(){
        String url = FAIL;
        try {
            if (locId > 0 && locName != null && catId > 0) {
                LocationDAO dao = new LocationDAO();
                boolean check = dao.updateLocation(catId, locName, locId);
                if (check) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update location action " + e.getMessage());
        }
        return url;
    }

    public String getLocName() {
        return locName;
    }

    public void setLocName(String locName) {
        this.locName = locName;
    }

    public int getLocId() {
        return locId;
    }

    public void setLocId(int locId) {
        this.locId = locId;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

}
