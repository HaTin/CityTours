/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.RegistrationDAO;
import dto.Tour;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class SearchTourAction{

    private int rows;
    private int page;
    private int total;
    private int origin, destination;
    private String date;
    
    public SearchTourAction() {
    }
    
    public String execute() {
        try {
            if (origin > 0 && destination > 0 && date != null) {
                RegistrationDAO dao = new RegistrationDAO();
                total = dao.getTotalSearch(origin, destination, date);
                if (total > 0) {
                    setRows(5);
                    List<Tour> list = dao.findByLocation(origin, destination, date, page, rows);
                    HttpServletRequest request = ServletActionContext.getRequest();
                    request.setAttribute("list", list);
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at search tour action " + e.getMessage());
        }
        return "success";
    }
    
    public int getOrigin() {
        return origin;
    }
    
    public void setOrigin(int origin) {
        this.origin = origin;
    }
    
    public int getDestination() {
        return destination;
    }
    
    public void setDestination(int destination) {
        this.destination = destination;
    }
    
    public String getDate() {
        return date;
    }
    
    public void setDate(String date) {
        this.date = date;
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
}
