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
public class TourDateAction {
    private List<Tour> list;
    private String msg;
    public TourDateAction() {
    }
    
    public String execute(){
        try {
            TourDao dao = new TourDao();
            list = dao.getAllTourName();
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at tour date action "+e.getMessage());
        }
        return "success";
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
    
}
