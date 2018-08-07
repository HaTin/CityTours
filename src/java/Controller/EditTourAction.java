/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.LocationDAO;
import dao.RegistrationDAO;
import dao.TourDao;
import dto.Category;
import dto.Location;
import dto.Tour;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import uti.ImageFolder;

/**
 *
 * @author dell
 */
public class EditTourAction {

    private int id;
    private Tour tour;
    private List<Location> locList;
    private List<Category> catList;
    private List<String> imageList;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String img;
    private String msg;
    private int page;
    public EditTourAction() {
    }

    public String execute(){
        String url = FAIL;
        try {
            if (id > 0) {
                TourDao tdao = new TourDao();
                tour = tdao.getEditTourInfo(id);
                if (tour != null) {
                    RegistrationDAO dao = new RegistrationDAO();
                    LocationDAO ldao = new LocationDAO();
                    img = dao.getImagePath(id);
                    imageList = ImageFolder.getImages("img/product/");
                    catList = ldao.getCatList();
                    locList = ldao.getLocList();
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at edit tour action "+e.getMessage());
        }
        return url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

}
