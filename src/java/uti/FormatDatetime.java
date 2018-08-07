/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uti;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author dell
 */
public class FormatDatetime implements Serializable{

    private static SimpleDateFormat sdf = null;

    public static String formatDate(Timestamp timestamp) {
        sdf = new SimpleDateFormat("dd-MM-yyyy");
        return sdf.format(timestamp);
    }

    public static String formatTime(Timestamp timestamp) {
        SimpleDateFormat sdf = new SimpleDateFormat("h:mm a");
        return sdf.format(timestamp);
    }

    public static Timestamp getDate(String day) throws Exception {
        sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date date = sdf.parse(day);
        return new Timestamp(date.getTime());
    }

    public static int getNumber(String num) throws Exception {
        return Integer.parseInt(num);
    }

    public static Timestamp getDateTime(String date, String time) throws Exception {
        String datetime = date + " " + time;
        sdf = new SimpleDateFormat("dd-MM-yyyy h:mm a");
        Date datet = sdf.parse(datetime);
        return new Timestamp(datet.getTime());
    }

}
