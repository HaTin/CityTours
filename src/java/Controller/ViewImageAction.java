/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import dao.TourDao;
import dto.Image;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import uti.ImageFolder;

/**
 *
 * @author dell
 */
public class ViewImageAction {
    private int tourId;
    private List<Image> list;
    private List<String> imageList;
    private String msg;
    public ViewImageAction() {
    }
    
    public String execute()  {
          try {
            if (tourId > 0) {
                TourDao dao  = new TourDao();
                list = dao.getImageList(tourId);
                imageList = ImageFolder.getImages("img/product/");
            }
            }catch (Exception e) {
                ServletActionContext.getServletContext().log("error at view image action " + e.getMessage());
            }        
        return "success";
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

 
    public List<Image> getList() {
        return list;
    }

    public void setList(List<Image> list) {
        this.list = list;
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
    
}
