/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Date;

public class Utils {

    public static Date toSQLDate(java.util.Date date) {
        return new java.sql.Date(date.getTime());
    }
}
