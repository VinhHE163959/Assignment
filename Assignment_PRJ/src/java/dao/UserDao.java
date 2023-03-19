/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class UserDao extends DBContext {

    public User login(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE username=? AND password=?";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String fullname = rs.getString("fullname");
                boolean gender = rs.getBoolean("gender");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                user = new User(userId, username, password, fullname, gender, email, address, phone);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public boolean register(String username, String password, String fullname, boolean gender, String email, String address, String phone) {
        boolean success = false;
        String sql = "INSERT INTO Users (username, password, fullname, gender, email, address, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullname);
            statement.setBoolean(4, gender);
            statement.setString(5, email);
            statement.setString(6, address);
            statement.setString(7, phone);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }

    public void addUser(User user) {
        String sql = "INSERT INTO Users (username, password, fullname, gender, email, address, phone, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullname());
            statement.setBoolean(4, user.isGender());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getAddress());
            statement.setString(7, user.getPhone());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE Users SET username=?, password=?, fullname=?, gender=?, email=?, address=?, "
                + "phone=? status=? WHERE user_id=?";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullname());
            statement.setBoolean(4, user.isGender());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getAddress());
            statement.setString(7, user.getPhone());
            statement.setInt(8, user.getUserId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE user_id=?";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
