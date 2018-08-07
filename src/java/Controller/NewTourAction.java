/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.LocationDAO;
import dto.Category;
import dto.Location;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import uti.ImageFolder;

/**
 *
 * @author dell
 */
public class NewTourAction {

    private List<String> imageList;
    private String msg;
    private List<Location> locList; 
    private List<Category> catList;
    public NewTourAction() {
    }

    public String execute() {
        try {
            LocationDAO dao = new LocationDAO();
            locList = dao.getLocList();
            catList = dao.getCatList();
            imageList = ImageFolder.getImages("img/product/");            
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at new tour action " + e.getMessage());
        }
        return "success";
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<Location> getLocList() {
        return locList;
    }

    public void setLocList(List<Location> locList) {
        this.locList = locList;
    }

    public List<Category> getCatList() {
        return catList;
    }

    public void setCatList(List<Category> catList) {
        this.catList = catList;
    }

}
