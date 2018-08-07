/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.TourDao;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class AddDescAction {

    private int id;
    private String desc;
    private String msg;

    public AddDescAction() {
    }

    public String execute() {
        try {
            if (id > 0) {
                TourDao dao = new TourDao();
                boolean check = dao.insertDesc(id, desc);
                if (check) {
                    check = dao.updateDuration(id, 1);
                    if (check) {
                        setMsg("Insert successfully");
                    } else {
                        setMsg("Error, Please try again");
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at insert desc action " + e.getMessage());
            setMsg("Error, Please try again");
        }
        return "success";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
