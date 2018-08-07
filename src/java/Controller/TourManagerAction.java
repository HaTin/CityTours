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
public class TourManagerAction {

    private String tourName;
    private int rows;
    private int page;
    private int total;
    private List<Tour> list;
    private String msg;
    public TourManagerAction() {
    }

    public String execute() {
        try {
            if (page > 0) {
                TourDao dao = new TourDao();
                setRows(7);
                if (tourName != null) {
                    if (!tourName.equals("")) {
                        total = dao.getTotalTourByName(tourName);
                        if (total > 0) {
                            list = dao.findTourByName(tourName, page, rows);
                        }
                    }
                } else {
                    total = dao.getTotalTour();
                    list = dao.getAllTour(page, rows);
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at tour manage action " + e.getMessage());
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

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
