/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.LocationDAO;
import dto.Location;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class ManageLocationAction {
    
    private int rows;
    private int page;
    private int total;
    private String msg;
    private List<Location> list;
    public ManageLocationAction() {
    }
    
    public String execute(){
     try {
            if (page > 0) {
                LocationDAO dao = new LocationDAO();
                setRows(7);
                total = dao.getLocTotal();
                list = dao.getAllLocation(page, rows);
            }
            }catch (Exception e) {
                ServletActionContext.getServletContext().log("error at location manager action " + e.getMessage());
            }        
        return "success";
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Location> getList() {
        return list;
    }

    public void setList(List<Location> list) {
        this.list = list;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
}
