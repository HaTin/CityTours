/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.MyConnection;
import dto.Description;
import dto.Image;
import dto.Tour;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import uti.FormatDatetime;

/**
 *
 * @author dell
 */
public class TourDao implements Serializable {

    private Connection con = null;
    private ResultSet rs = null;
    private PreparedStatement pStm = null;

    public int insertTour(String tourName, int category, int origin, int destination, int duration, int quantity) throws Exception {
        int tourID = 0;
        try {
            String sql = "insert into tourInfo values (?,?,?,?,?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pStm.setString(1, tourName);
            pStm.setInt(2, category);
            pStm.setInt(3, origin);
            pStm.setInt(4, destination);
            pStm.setInt(5, duration);
            pStm.setInt(6, quantity);
            pStm.executeUpdate();
            rs = pStm.getGeneratedKeys();
            if (rs.next()) {
                tourID = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return tourID;
    }
     public List<Tour> getNewTour() throws Exception {
        List<Tour> list = null;
        try {
            String sql ="select t.id,ti.tourName,t.price,t.startDate,t.remainQuantity,ti.duration,m.src from tour_cre t ,tourInfo ti,images m where t.tourId = ti.tourId and ti.tourId = m.tour_id and t.remainQuantity > 0 and"
                    + " m.main = 1 and t.status = 1 and ti.status =1 and m.status = 1 " +
"                   order by t.id desc offset 0 rows fetch next 3 rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setName(rs.getString("tourName"));
                tour.setId(rs.getInt("id"));
                tour.setQuantity(rs.getInt("remainQuantity"));
               // tour.setInfoID(rs.getInt("tourid"));
                tour.setPrice(rs.getFloat("price"));
                tour.setDuration(rs.getInt("duration"));
                tour.setDate(FormatDatetime.formatDate(rs.getTimestamp("startDate")));
                tour.setImgPath(rs.getString("src"));
                list.add(tour);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    public boolean insertImage(int tourId, String img,int main) throws Exception {
        boolean check = false;
        try {
            String sql = "insert into images values (?,?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, tourId);
            pStm.setInt(2, main);
            pStm.setString(3, img);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertImageList(int tourId, List<String> imageList) throws Exception {
        boolean check = false;
        int successRow = 0;
        try {
            String sql = "insert into images values (?,0,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, tourId);
            for (String image : imageList) {
                pStm.setString(2, image);
                successRow += pStm.executeUpdate();
            }
            if (successRow == imageList.size()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertDescription(int tourId, List<String> desc) throws Exception {
        boolean check = false;
        int successRow = 0;
        try {
            String sql = "insert into tour_description values (?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(2, tourId);
            for (String description : desc) {
                pStm.setString(1, description);
                successRow += pStm.executeUpdate();
            }
            if (successRow == desc.size()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (pStm != null) {
            pStm.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public List<Tour> getAllTour(int page, int rows) throws Exception {
        List<Tour> result = null;
        try {
            int offset = (page - 1) * rows;
            String sql = "select tourId,tourName,duration,quantity from tourInfo where status = 1 order by tourId offset ? rows fetch next ? rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, offset);
            pStm.setInt(2, rows);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setInfoID(rs.getInt("tourId"));
                tour.setName(rs.getString("tourName"));
                tour.setQuantity(rs.getInt("quantity"));
                tour.setDuration(rs.getInt("duration"));
                result.add(tour);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getTotalTour() throws Exception {
        int total = 0;
        try {
            String sql = "select count(tourId) from tourInfo where status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return total;
    }

    public int getTotalTourByName(String name) throws Exception {
        int total = 0;
        try {
            String sql = "select count(tourId) from tourInfo where tourName like ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, "%" + name + "%");
            rs = pStm.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return total;
    }

    public List<Tour> findTourByName(String name, int page, int rows) throws Exception {
        List<Tour> result = null;
        try {
            int offset = (page - 1) * rows;
            String sql = "select tourId,tourName,duration,quantity from tourInfo where tourName like ? and status = 1 order by tourId offset ? rows fetch next ? rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, "%" + name + "%");
            pStm.setInt(2, offset);
            pStm.setInt(3, rows);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setInfoID(rs.getInt("tourId"));
                tour.setName(rs.getString("tourName"));
                tour.setQuantity(rs.getInt("quantity"));
                tour.setDuration(rs.getInt("duration"));
                result.add(tour);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Tour> getAllTourName() throws Exception {
        List<Tour> result = null;
        try {
            String sql = "select tourId,tourName from tourInfo where status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            Tour tour = null;
            while (rs.next()) {
                tour = new Tour();
                tour.setInfoID(rs.getInt("tourId"));
                tour.setName(rs.getString("tourName"));
                result.add(tour);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getTourQuantity(int id) throws Exception {
        int quantity = 0;
        try {
            String sql = "select quantity from tourInfo where tourid = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } finally {
            closeConnection();
        }
        return quantity;
    }

    public boolean insertTourDate(int tourId, double adultPrice, double childPrice, String date, String time, int quantity) throws Exception {
        boolean check = false;
        try {
            String sql = "insert into tour_cre values (?,?,?,?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, tourId);
            pStm.setDouble(2, childPrice);
            pStm.setDouble(3, adultPrice);
            pStm.setTimestamp(4, FormatDatetime.getDateTime(date, time));
            pStm.setInt(5, quantity);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean removeTourDate(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update tour_cre set status = 0 where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int getRemainQuantity(int id) throws Exception {
        int quantity = 0;
        try {
            String sql = "select remainQuantity from tour_cre where id = ? ";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("remainQuantity");
            }
        } finally {
            closeConnection();
        }
        return quantity;
    }

    public Tour getEditTourInfo(int id) throws Exception {
        Tour tour = null;
        try {
            String sql = "select tourId,tourName,category,originId,destinationId,quantity from tourInfo where tourId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                tour = new Tour();
                tour.setInfoID(rs.getInt("tourId"));
                tour.setName(rs.getString("tourName"));
                tour.setCatId(rs.getInt("category"));
                tour.setOriginId(rs.getInt("originId"));
                tour.setDestinationId(rs.getInt("destinationId"));
                tour.setQuantity(rs.getInt("quantity"));
            }
        } finally {
            closeConnection();
        }
        return tour;
    }

    public boolean updateTourInfo(int id, String name, int cat, int origin, int destination, int quantity) throws Exception {
        boolean check = false;
        try {
            String sql = "update tourInfo set tourName = ?, category = ?, quantity = ?, originId = ? ,destinationId = ? where tourId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, name);
            pStm.setInt(2, cat);
            pStm.setInt(3, quantity);
            pStm.setInt(4, origin);
            pStm.setInt(5, destination);
            pStm.setInt(6, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateMainImg(String name, int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update images set src = ? where main = 1 and tour_id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, name);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkTourCre(int infoId) throws Exception {
        boolean check = false;
        try {
            String sql = "select id from tour_cre where tourId = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, infoId);
            rs = pStm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean removeTourInfo(int tourId) throws Exception {
        boolean check = false;
        try {
            String sql = "update tourInfo set status = 0 where tourId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, tourId);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<Image> getImageList(int id) throws Exception {
        List<Image> result = null;
        try {
            String sql = "select id,src from images where tour_id = ? and main = 0 and status = 1 ";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            Image img = null;
            while (rs.next()) {
                img = new Image();
                img.setId(rs.getInt("id"));
                img.setImgPath(rs.getString("src"));
                result.add(img);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeImage(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update images set status = 0 where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateImage(int id, String src) throws Exception {
        boolean check = false;
        try {
            String sql = "update images set src = ? where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, src);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<Description> getDescList(int id) throws Exception {
        List<Description> list = null;
        try {
            String sql = "select id,dayDesc from tour_description where tourInfoId = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            list = new ArrayList<>();
            Description desc;
            while (rs.next()) {
                desc = new Description();
                desc.setDesId(rs.getInt("id"));
                desc.setDesc(rs.getString("dayDesc"));
                list.add(desc);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean removeDesc(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update tour_description set status = 0 where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateDesc(int id, String desc) throws Exception {
        boolean check = false;
        try {
            String sql = "update tour_description set dayDesc = ? where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, desc);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateDuration(int id, int value) throws Exception {
        boolean check = false;
        try {
            String sql = "update tourInfo set duration = duration + ? where tourId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, value);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertDesc(int id, String desc) throws Exception {
        boolean check = false;
        try {
            String sql = "insert into tour_description values(?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, desc);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<Tour> getAllTourDate(int tourId, int page, int rows) throws Exception {
        List<Tour> result = null;
        try {
            int offset = (page - 1) * rows;
            String sql = "select id,childPrice,price,startDate,remainQuantity from tour_cre where tourId = ? and status = 1 order by id offset ? rows fetch next ? rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, tourId);
            pStm.setInt(2, offset);
            pStm.setInt(3, rows);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setId(rs.getInt("id"));
                tour.setChildPrice(rs.getDouble("childPrice"));
                tour.setPrice(rs.getDouble("price"));
                tour.setDate(FormatDatetime.formatDate(rs.getTimestamp("startDate")));
                tour.setTime(FormatDatetime.formatTime(rs.getTimestamp("startDate")));
                tour.setQuantity(rs.getInt("remainQuantity"));
                result.add(tour);
            }
        } finally {
            closeConnection();
        }
        return result;
    }    
    public int getTotalTourDate(int id) throws Exception {
        int total = 0;
        try {
            String sql = "select count(id) from tour_cre where tourId = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return total;
    }
        public Tour findTourDateById(int id) throws Exception {
        Tour tour = null;
        try {
            String sql = "select childPrice,price,startDate,remainQuantity from tour_cre where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                tour = new Tour();
                tour.setId(id);
               tour.setDate(FormatDatetime.formatDate(rs.getTimestamp("startDate")));
                tour.setTime(FormatDatetime.formatTime(rs.getTimestamp("startDate")));
                tour.setQuantity(rs.getInt("remainQuantity"));
                tour.setChildPrice(rs.getDouble("childPrice"));
                tour.setPrice(rs.getDouble("price"));
            }
        } finally {
            closeConnection();
        }
        return tour;
    }
         public boolean updateTourDate(int id, double childPrice, double adultPrice, int remainQuantity,String date,String time) throws Exception {
        boolean check = false;
        try {
            String sql = "update tour_cre set price = ?,childPrice = ?,startDate = ?,remainQuantity = ? where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setDouble(1, adultPrice);
            pStm.setDouble(2, childPrice);
            pStm.setTimestamp(3, FormatDatetime.getDateTime(date, time));
            pStm.setInt(4, remainQuantity);
            pStm.setInt(5, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
