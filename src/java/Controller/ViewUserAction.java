/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.RegistrationDAO;
import dto.User;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class ViewUserAction {

    private int rows;
    private int page;
    private int total;
    private List<User> list;

    public ViewUserAction() {
    }

    public String execute() {
        try {
            if (page > 0) {
                RegistrationDAO dao = new RegistrationDAO();
                setRows(10);
                total = dao.getUserCount();
                list = dao.getAllUser(page, rows);

            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at view user action " + e.getMessage());
        }

        return "success";

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

    public List<User> getList() {
        return list;
    }

    public void setList(List<User> list) {
        this.list = list;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

}
