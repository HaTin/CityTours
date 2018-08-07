/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.TourDao;
import dto.Tour;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class ViewDateAction {
     private int rows;
    private int page;
    private int total;
    private int tourId;
    private List<Tour> list;
    private String msg;
    public ViewDateAction() {
    }
    
    public String execute(){
           try {
            if (page > 0 && tourId > 0) {
                TourDao dao = new TourDao();
                setRows(7);
                    total = dao.getTotalTourDate(tourId);
                    list = dao.getAllTourDate(tourId, page, rows);
                }
            
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at  view tour date" + e.getMessage());
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

    public List<Tour> getList() {
        return list;
    }

    public void setList(List<Tour> list) {
        this.list = list;
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
