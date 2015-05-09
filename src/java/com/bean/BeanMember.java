/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class BeanMember {

    private int mid;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    private String mname;

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String createdate;

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    private int mid1;

    public int getMid1() {
        return mid1;
    }

    public void setMid1(int mid1) {
        this.mid1 = mid1;
    }

    private String mname1;

    public String getMname1() {
        return mname1;
    }

    public void setMname1(String mname1) {
        this.mname1 = mname1;
    }

    public void AddMember() throws Exception {
        try {
            String sql = "INSERT INTO Member (Username,Password) VALUES (?,?)";
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("jdbc:odbc:StudentManagement");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mname);
            ps.setString(2, password);
            ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(BeanMember.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DeleteMamber() throws Exception {

        try {
            String sql = "Delete from Member where User_ID=" + mid1;
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection conn = DriverManager.getConnection("jdbc:odbc:StudentManagement");
            conn.createStatement().executeUpdate(sql);
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(BeanMember.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
