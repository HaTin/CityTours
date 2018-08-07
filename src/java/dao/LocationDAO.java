/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.MyConnection;
import dto.Category;
import dto.Location;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class LocationDAO implements Serializable{
      private Connection con = null;
    private ResultSet rs = null;
    private PreparedStatement pStm = null;

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
    public boolean insertLocation(String locName,int locType) throws Exception{ 
        boolean check = false;
        try {
            String sql = "insert into tour_location values(?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setString(1, locName);
            pStm.setInt(2, locType);
            check = pStm.executeUpdate() > 0;
        }finally{
            closeConnection();
        }
        return check;
    }
     public List<Location> getAllLocation(int page, int rows) throws Exception {
        List<Location> result = null;
        try {
            int offset = (page - 1) * rows;
            String sql = "select locId,locName from tour_location where status = 1 order by locId offset ? rows fetch next ? rows only";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, offset);
            pStm.setInt(2, rows);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Location loc = new Location();
                loc.setText(rs.getString("locName"));
                loc.setValue(rs.getInt("locId"));
                result.add(loc);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getLocTotal() throws Exception {
        int total = 0;
        try {
            String sql = "select count(locId) from tour_location where status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            if(rs.next()){
                total = rs.getInt(1);
            }
        }finally{
            closeConnection();
        }
        return total;
    }
//    public Location getLocation() throws Exception{
//        
//    }
    public boolean removeLocation(int id) throws Exception{
        boolean check = false;
        try {
            String sql = "update tour_location set status = 0 where locId = ?";
            con =MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        }finally{
            closeConnection();
        }
        return check;
    }
public List<Category> getCatList() throws Exception {
        List<Category> result = null;
        try {
            String sql = "select catId,catName from tour_category where status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt("catId"));
                cat.setName(rs.getString("catName"));
                result.add(cat);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
 public boolean updateLocation(int catId,String name,int locId) throws Exception {
        boolean check = false;
        try {
            String sql = "update tour_location set catId = ?,locName = ? where locId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, catId);
            pStm.setString(2, name);
            pStm.setInt(3, locId);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
 public Location getLocation(int id) throws Exception {
        Location loc = null;
        try {
            String sql = "select catId,locName from tour_location where locId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if(rs.next()){
                loc = new Location();
                loc.setType(rs.getInt("catId"));
                loc.setText(rs.getString("locName"));
                loc.setValue(id);
            }
        } finally {
            closeConnection();
        }
        return loc;
    }
public List<Location> getLocList() throws Exception {
        List<Location> result = null;
        try {
            String sql = "select locId,locName from tour_location where status = 1";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                Location loc = new Location();
                loc.setText(rs.getString("locName"));
                loc.setValue(rs.getInt("locId"));
                result.add(loc);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
public boolean checkLocationInTour(int locid) throws Exception{
 boolean check = false;
        try {
            String sql = "select tourId from tourInfo where originId = ? or destinationId = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            pStm.setInt(1, locid);
            pStm.setInt(2, locid);
            rs= pStm.executeQuery();
            if(rs.next()){
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
}
}
