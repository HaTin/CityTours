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
public class RemoveDescAction {

    private int id;
    private int desId;
    private String msg;

    public RemoveDescAction() {
    }

    public String execute() {
        try {
            if (desId > 0) {
                TourDao dao = new TourDao();
                boolean check = dao.removeDesc(desId);
                if (check) {
                    check = dao.updateDuration(id, -1);
                    if (check) {
                        setMsg("Remove successfully");
                    } else {
                        setMsg("Error, Please try again");
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at remove desc action"+e.getMessage());
            setMsg("Error, Please try again");
        }
        return "success";
    }

    public int getDesId() {
        return desId;
    }

    public void setDesId(int desId) {
        this.desId = desId;
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

}
