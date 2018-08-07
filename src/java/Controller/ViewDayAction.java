/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.TourDao;
import dto.Description;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class ViewDayAction {
      private int id;
      private List<Description> list;
      private String msg;
    public ViewDayAction() {
    }
    
    public String execute(){
        try {
            if(id>0){
                TourDao dao = new TourDao();
                list = dao.getDescList(id);
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at view day action"+e.getMessage());
        }
        return "success";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Description> getList() {
        return list;
    }

    public void setList(List<Description> list) {
        this.list = list;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
}
