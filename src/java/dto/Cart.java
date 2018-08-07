/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.RegistrationDAO;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import uti.FormatDatetime;

/**
 *
 * @author dell
 */
public class Cart implements Serializable {

    private Map<Integer, Tour> items;

    public Cart() {
    }
    
    public void addToCart(int id, int childQuantity, int adultQuantity, double childPrice, double adultPrice) throws Exception {
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        Tour tour;
        if (this.items.containsKey(id)) {
            tour =this.items.get(id);
            tour.setAdultQuantity(adultQuantity);
            tour.setChildQuantity(childQuantity);
        }else{
        Timestamp date;
        RegistrationDAO dao = new RegistrationDAO();
        tour = new Tour();
        tour.setId(id);
        tour.setAdultQuantity(adultQuantity);
        tour.setChildQuantity(childQuantity);
        tour.setPrice(adultPrice);
        tour.setChildPrice(childPrice);
        tour.setName(dao.getTourName(id));
        tour.setImgPath(dao.getImgPath(id));
        tour.setQuantity(dao.getTourQuantity(id));
        date = dao.getStartDate(id);
        tour.setDate(FormatDatetime.formatDate(date));
        tour.setTime(FormatDatetime.formatTime(date));
        this.items.put(id,tour);
        }
    }

    public void updateCart(int id, int adultQuantity, int childQuantity) {
        Tour tour = items.get(id);
        tour.setAdultQuantity(adultQuantity);
        tour.setChildQuantity(childQuantity);
    }
    public double getTotal() {
        double result = 0;
        for (Tour tour : items.values()) {
            result += tour.getAdultQuantity() * tour.getPrice() + tour.getChildPrice() * tour.getChildQuantity();
        }
        return result;
    }

    public void remove(int id) {
        items.remove(id);
    }

    public Map<Integer, Tour> getItems() {
        return items;
    }

    public void setItems(Map<Integer, Tour> items) {
        this.items = items;
    }

}
