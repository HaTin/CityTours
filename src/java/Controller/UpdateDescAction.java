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
public class UpdateDescAction {

    private int id;
    private int desId;
    private String desc;
    private String msg;

    public UpdateDescAction() {
    }

    public String execute() {
        try {
            if (desId > 0) {
                TourDao dao = new TourDao();
                boolean check = dao.updateDesc(desId, desc);
                if (check) {
                    setMsg("Update successfully");
                } else {
                    setMsg("Error, Please try again");
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at update desc action " + e.getMessage());
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
