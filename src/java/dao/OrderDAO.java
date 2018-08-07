/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.MyConnection;
import dto.Cart;
import dto.Tour;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

/**
 *
 * @author dell
 */
public class OrderDAO implements Serializable {

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
 public int insertOrder(int userId, double total,Timestamp date ) throws Exception {
        int orderId = -1;
        try {
            String sql = "insert into Orders values(?,?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            pStm.setInt(1, userId);
            pStm.setDouble(2, total);
            pStm.setTimestamp(3, date);
            pStm.executeUpdate();
            rs = pStm.getGeneratedKeys();
            if(rs.next()){
                orderId = rs.getInt(1);
            }
        } finally {
              closeConnection();
        }
        return orderId;
    }
    public boolean insertOrderDetail(int orderId,Cart cart) throws Exception{
        boolean check = false;
        int successRow= 0;
        try {
            String sql = "insert into order_detail values(?,?,?,?,?,1)";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            for (Tour tour :  cart.getItems().values()) {
               pStm.setInt(1, orderId);
               pStm.setInt(2, tour.getId());
               pStm.setInt(3, tour.getAdultQuantity());
               pStm.setInt(4, tour.getChildQuantity());
               pStm.setDouble(5, (tour.getAdultQuantity()*tour.getPrice()+tour.getChildQuantity()*tour.getChildPrice()));
              successRow+= pStm.executeUpdate();
            }
           if(successRow == cart.getItems().size()) check = true;
        } finally{
            closeConnection();
        }
        return check;
    }

    public void changeQuantity(Cart cart) throws Exception {
        try {
            String sql = "update tour_cre set remainQuantity = ? where id = ?";
            con = MyConnection.getMyConnection();
            pStm = con.prepareStatement(sql);
            for (Tour tour : cart.getItems().values()) {
                pStm.setInt(1, tour.getQuantity() - (tour.getAdultQuantity() + tour.getChildQuantity()));
                pStm.setInt(2, tour.getId());
                pStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }

}
