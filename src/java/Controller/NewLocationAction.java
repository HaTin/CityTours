/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.LocationDAO;
import dto.Category;
import dto.Location;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class NewLocationAction {

    private static final String ADDNEW = "new";
    private static final String EDIT = "edit";
    private int id;
    private Location loc;
    private List<Category> list;
    private String msg;
    private int page;

    public NewLocationAction() {
    }

    public String execute() {
        String url = ADDNEW;
        try {
            LocationDAO dao = new LocationDAO();
            list = dao.getCatList();
            if (id > 0) {
                loc = dao.getLocation(id);
                if (loc != null) {
                    url = EDIT;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at new location action " + e.getMessage());
        }
        return url;
    }

    public List<Category> getList() {
        return list;
    }

    public void setList(List<Category> list) {
        this.list = list;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Location getLoc() {
        return loc;
    }

    public void setLoc(Location loc) {
        this.loc = loc;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

}
