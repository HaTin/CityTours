/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.TourDao;
import dto.Tour;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class EditTourDateAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private int tourId;
    private int id;
    private int page;
    private Tour tour;

    public EditTourDateAction() {
    }
    public String execute() {
        String url =FAIL;
        try {
            if (id > 0) {
                TourDao dao = new TourDao();
                tour = dao.findTourDateById(id);
                if(tour!=null){
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at edit tour date action " + e.getMessage());
        }
        return url;
    }
    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
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

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }
}
