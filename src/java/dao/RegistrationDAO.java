/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.MyConnection;
import dto.Image;
import dto.Location;
import dto.Tour;
import dto.User;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import uti.FormatDatetime;

/**
 *
 * @author dell
 */
public class RegistrationDAO implements Serializable {

    private Connection con = null;
    private ResultSet rs = null;
    private PreparedStatement pStm = null;

    public User checkLogin(String userName, String password) throws Exception {
        User user = null;
        try {
            String sql = "select id,firstName,email,lastName,role,phone from Account where email = ? and password =? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, userName);
            pStm.setString(2, password);
            ResultSet rs = pStm.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("phone"), rs.getString("role"));
            }
        } finally {
            closeConnection();
        }
        return user;
    }

    public List<User> getAllUser(int page, int rows) throws Exception {
        List<User> result = null;
        try {
            int offset = (page - 1) * rows;
            String sql = "select id,email,firstName,lastName,phone,status "
                    + "from account where role = 'user' order by id offset ? rows fetch next ? rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, offset);
            pStm.setInt(2, rows);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getInt("status"));
                result.add(user);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean banUser(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update account set status = 0 where id = ? ";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean restoreUser(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update account set status = 1 where id = ? ";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int getUserCount() throws Exception {
        int count = 0;
        try {
            String sql = "select count(id) from account";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return count;
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

    public boolean createUser(User user) throws Exception {
        boolean check = false;
        try {
            String sql = "insert into account values(?,?,?,?,?,'user',1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, user.getEmail());
            pStm.setString(2, user.getPassword());
            pStm.setString(3, user.getFirstName());
            pStm.setString(4, user.getLastName());
            pStm.setString(5, user.getPhone());
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkEmail(String email) throws Exception {
        boolean check = true;
        try {
            String sql = "select id from account where email = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, email);
            rs = pStm.executeQuery();
            if (rs.next()) {
                check = false;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateUserProfile(int id, String firstName, String lastName, String phone) throws Exception {
        boolean check = false;
        try {
            String sql = "update account set firstName = ?, lastName = ?, phone = ? where id = ? ";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, firstName);
            pStm.setString(2, lastName);
            pStm.setString(3, phone);
            pStm.setInt(4, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updatePassword(int id, String password) throws Exception {
        boolean check = false;
        try {
            String sql = "update account set password = ? where id = ? ";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, password);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkPhone(String phone) throws Exception {
        boolean check = true;
        try {
            String sql = "select id from account where phone = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, phone);
            rs = pStm.executeQuery();
            if (rs.next()) {
                check = false;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public String checkPassword(int id) throws Exception {
        String password = null;
        try {
            String sql = "select password from account where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                password = rs.getString("password");
            }
        } finally {
            closeConnection();
        }
        return password;
    }

    public int getTotalSearch(int origin, int destination, String startDate) throws Exception {
        int total = 0;
        try {
            String sql = "select count(id) from tour_cre where startDate >= ? and status = 1 and  tourId in "
                    + "(select tourId from tourInfo where originId =? and destinationId = ?)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setTimestamp(1, FormatDatetime.getDate(startDate));
            pStm.setInt(2, origin);
            pStm.setInt(3, destination);
            rs = pStm.executeQuery();
            if(rs.next()){
                total=rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return total;
    }

    public List<Tour> findByLocation(int origin, int destination, String startDate, int page, int rows) throws Exception {
        List<Tour> list = null;
        try {
            int offset = (page - 1) * rows;
            String sql = "select t.id,t.tourid,ti.tourName,t.price,t.startDate,t.remainQuantity,ti.duration,m.src from tour_cre t ,tourInfo ti,images m "
                    + "where t.tourId = ti.tourId and ti.tourId = m.tour_id and ti.originId = ? and ti.destinationId = ? and t.startDate>=? "
                    + "and m.main = 1 and t.status = 1 and ti.status =1 and m.status = 1 "
                    + "order by t.startDate offset ? rows fetch next ? rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, origin);
            pStm.setInt(2, destination);
            pStm.setTimestamp(3, FormatDatetime.getDate(startDate));
            pStm.setInt(4, offset);
            pStm.setInt(5, rows);
            rs = pStm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Tour tour = new Tour();
                tour.setName(rs.getString("tourName"));
                tour.setId(rs.getInt("id"));
                tour.setQuantity(rs.getInt("remainQuantity"));
                tour.setInfoID(rs.getInt("tourid"));
                tour.setPrice(rs.getFloat("price"));
                tour.setDuration(rs.getInt("duration"));
                tour.setDate(FormatDatetime.formatDate(rs.getTimestamp("startDate")));
                tour.setTime(FormatDatetime.formatTime(rs.getTimestamp("startDate")));
                tour.setImgPath(rs.getString("src"));
                list.add(tour);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public String getImagePath(int id) throws Exception {
        String path = "";
        try {
            String sql = "select src from images where main = 1 and tour_id = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                path = rs.getString("src");
            }
        } finally {
            closeConnection();
        }
        return path;
    }

    public List<Location> getLocation(int category, String name) throws Exception {
        List<Location> locList = null;
        try {
            String sql = " select locid,locName from tour_location where catId = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, category);
            rs = pStm.executeQuery();
            locList = new ArrayList<>();
            Location lo = new Location();
            lo.setText(name);
            lo.setValue(0);
            lo.setImageSrc("img/icons_search/walking.png");
            lo.setSelected(true);
            lo.setDescription("");
            locList.add(lo);
            while (rs.next()) {
                Location loc = new Location();
                loc.setValue(rs.getInt("locid"));
                loc.setText(rs.getString("locName"));
                loc.setImageSrc("img/icons_search/walking.png");
                loc.setSelected(false);
                loc.setDescription("");
                locList.add(loc);
            }
        } finally {
            closeConnection();
        }
        return locList;
    }
   

    public Tour getTour(int id) throws Exception {
        Tour tour = null;
        try {
            String sql = "select t.id,ti.tourId,ti.tourName,t.childPrice,t.price,ti.originId,t.startDate,t.remainQuantity,ti.duration,tl.locName from tour_cre t,tourInfo ti,tour_location tl\n"
                    + " where t.tourId = ti.tourId and ti.originId = tl.locId and t.id =? and t.status =1 and tl.status =1 and ti.status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                tour = new Tour();
                tour.setId(rs.getInt("id"));
                tour.setInfoID(rs.getInt("tourId"));
                tour.setPrice(rs.getFloat("price"));
                tour.setChildPrice(rs.getFloat("childPrice"));
                tour.setName(rs.getString("tourName"));
                tour.setDate(FormatDatetime.formatDate(rs.getTimestamp("startDate")));
                tour.setTime(FormatDatetime.formatTime(rs.getTimestamp("startDate")));
                tour.setQuantity(rs.getInt("remainQuantity"));
                tour.setDuration(rs.getInt("duration"));
                tour.setOrigin(rs.getString("locName"));
            }
        } finally {
            closeConnection();
        }
        return tour;
    }

    public List<String> getTourDetail(int id) throws Exception {
        List<String> detailList = null;
        try {
            String sql = "select dayDesc from tour_description where tourInfoId = ? and status = 1 order by id";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            detailList = new ArrayList<>();
            while (rs.next()) {
                detailList.add(rs.getString("dayDesc"));
            }
        } finally {
            closeConnection();
        }
        return detailList;
    }

    public List<Image> getImageList(int id) throws Exception {
        List<Image> list = null;
        try {
            String sql = "select main,src from images where tour_id = ? and status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                list.add(new Image(rs.getString("src"), rs.getInt("main")));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public String getTourName(int id) throws Exception {
        String tourName = "";
        try {
            String sql = "select tourName from tourInfo where tourId in (select tourId from tour_cre where id = ? and status = 1 )";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                tourName = rs.getString("tourName");
            }
        } finally {
            closeConnection();
        }
        return tourName;
    }

    public int getTourQuantity(int id) throws Exception {
        int quantity = -1;
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

    public String getImgPath(int id) throws Exception {
        String imgPath = null;
        try {
            String sql = "select src from Images where main =1 and status = 1 and tour_id in (select tourId from tour_cre where id = ?)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                imgPath = rs.getString("src");
            }
        } finally {
            closeConnection();
        }
        return imgPath;
    }

    public Timestamp getStartDate(int id) throws Exception {
        Timestamp date = null;
        try {
            String sql = "select startDate from tour_cre where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                date = rs.getTimestamp("startDate");
            }
        } finally {
            closeConnection();
        }
        return date;
    }

}
