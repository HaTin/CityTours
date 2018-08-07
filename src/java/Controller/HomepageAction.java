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
public class HomepageAction {

    private List<Tour> list;

    public HomepageAction() {
     
    }

    public String execute() {
          try {
            TourDao dao = new TourDao();
            list = dao.getNewTour();
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at home page action "+e.getMessage());
        }
        return "success";
    }

    public List<Tour> getList() {
        return list;
    }

    public void setList(List<Tour> list) {
        this.list = list;
    }

}
