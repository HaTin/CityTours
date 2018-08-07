/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.TourDao;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class AddTourAction {

    private String tourName;
    private int category;
    private int origin;
    private int destination;
    private int quantity;
    private int duration;
    private List<String> days;
    private String image;
    private List<String> slideImages;
    private String msg;
    public AddTourAction() {
    }

    public String execute() {
        try {
            if (tourName != null && origin > 0 && destination > 0 && quantity > 0 && duration > 0 && days != null && image != null && slideImages != null) {
                TourDao dao = new TourDao();
                int tourId = dao.insertTour(tourName, category, origin, destination, duration, quantity);
                if (tourId > 0) {
                    boolean check = dao.insertDescription(tourId, days);
                    if (check) {
                        check = dao.insertImage(tourId, image,1);
                        if (check) {
                            dao.insertImageList(tourId,slideImages);
                            if (check) {
                                setMsg("New tour has been created successfully");
                            }
                        }
                    }
                }
            }else{
                 setMsg("There something wrong please try again");
            }
        } catch (Exception e) {
              setMsg("There something wrong please try again");
            ServletActionContext.getServletContext().log("error at add tour action" + e.getMessage());
        }
        return "success";
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public int getOrigin() {
        return origin;
    }

    public void setOrigin(int origin) {
        this.origin = origin;
    }

    public int getDestination() {
        return destination;
    }

    public void setDestination(int destination) {
        this.destination = destination;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public List<String> getDays() {
        return days;
    }

    public void setDays(List<String> days) {
        this.days = days;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<String> getSlideImages() {
        return slideImages;
    }

    public void setSlideImages(List<String> slideImages) {
        this.slideImages = slideImages;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
