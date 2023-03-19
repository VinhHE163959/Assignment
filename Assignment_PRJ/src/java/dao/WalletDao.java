/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Transaction;
import model.Wallet;
import utils.Utils;

public class WalletDao extends DBContext {

    TransactionDao transDao = new TransactionDao();

    public float getAmountOfMainWallet(int userId) {
        float amount = 0;
        try {
            String sql = "SELECT amount AS total_amount FROM Wallet WHERE category_id = 1 AND user_id = ?";
            try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                try ( ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        amount = rs.getFloat("total_amount");
                    }
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return amount;
    }

    public List<Wallet> getAllWalletsByUserId(int userId) {
        List<Wallet> wallets = new ArrayList<>();

        String query = "SELECT w.wallet_id, w.user_id, w.category_id, c.category_name, w.amount, w.update_date "
                + "FROM Wallet w "
                + "JOIN Category c ON w.category_id = c.category_id "
                + "WHERE w.user_id = ? "
                + "ORDER BY w.wallet_id ASC";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int walletId = resultSet.getInt("wallet_id");
                    int categoryId = resultSet.getInt("category_id");
                    String categoryName = resultSet.getString("category_name");
                    float amount = resultSet.getFloat("amount");
                    Timestamp updateDate = resultSet.getTimestamp("update_date");

                    Wallet wallet = new Wallet(walletId, userId, categoryId, amount, updateDate);
                    wallet.setCategoryName(categoryName);
                    wallet.setLastTransaction(getLastTransactionByWalletId(walletId));
                    wallets.add(wallet);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return wallets;
    }

    public Transaction getLastTransactionByWalletId(int walletId) {
        Transaction transaction = null;

        String query = "SELECT transaction_id, wallet_id, amount, type, date,note "
                + "FROM Transactions "
                + "WHERE wallet_id = ? "
                + "ORDER BY date DESC, transaction_id DESC "
                + "OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, walletId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int transactionId = resultSet.getInt("transaction_id");
                    float amount = resultSet.getFloat("amount");
                    boolean type = resultSet.getBoolean("type");
                    Timestamp date = resultSet.getTimestamp("date");
                    String note = resultSet.getString("note");
                    transaction = new Transaction(transactionId, walletId, amount, type, date, note);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transaction;
    }

    public Wallet getWalletById(int walletId) {
        Wallet wallet = null;

        String query = "SELECT w.wallet_id, w.user_id, w.category_id, c.category_name, w.amount, w.update_date "
                + "FROM Wallet w "
                + "JOIN Category c ON w.category_id = c.category_id "
                + "WHERE w.wallet_id = ? ";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, walletId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int userId = resultSet.getInt("user_id");
                    int categoryId = resultSet.getInt("category_id");
                    String categoryName = resultSet.getString("category_name");
                    float amount = resultSet.getFloat("amount");
                    Timestamp updateDate = resultSet.getTimestamp("update_date");

                    wallet = new Wallet(walletId, userId, categoryId, amount, updateDate);
                    wallet.setCategoryName(categoryName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wallet;
    }

    public void add(Wallet wallet) {
        String query = "INSERT INTO Wallet (user_id, category_id, amount, update_date) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, wallet.getUserId());
            preparedStatement.setInt(2, wallet.getCategoryId());
            preparedStatement.setFloat(3, wallet.getAmount());
            preparedStatement.setDate(4, Utils.toSQLDate(wallet.getUpdateDate()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addTransactionAndUpdateWallet(Transaction transaction, int categoryId, int userId) {

        String selectQuery = "SELECT amount FROM Wallet WHERE wallet_id = ?";
        String updateQuery = "UPDATE Wallet SET amount = ?, update_date = ? WHERE wallet_id = ?";
        String insertQuery = "INSERT INTO Transactions (wallet_id, amount, type, date,note) VALUES (?, ?, ?, ?,?)";

        if (categoryId != 1 && transaction.isType()) {
        }
        try ( PreparedStatement selectStatement = connection.prepareStatement(selectQuery);  PreparedStatement updateStatement = connection.prepareStatement(updateQuery);  PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {

            // Get the current amount in the wallet
            selectStatement.setInt(1, transaction.getWalletId());        // Get the current amount in the 
            ResultSet rs = selectStatement.executeQuery();
            rs.next();
            float currentAmount = rs.getFloat("amount");
            rs.close();

            // Calculate the resulting amount after adding the new amount
            float resultingAmount = currentAmount + transaction.getAmount();

            // Check if the resulting amount is negative, and rollback the transaction if so
            if (resultingAmount < 0) {
                connection.rollback();
                return false;
            }

            // Update the amount and update_date in the database
            updateStatement.setFloat(1, resultingAmount);
            updateStatement.setDate(2, Utils.toSQLDate(transaction.getDate()));
            updateStatement.setInt(3, transaction.getWalletId());

            updateStatement.executeUpdate();

            // Add the new transaction
            insertStatement.setInt(1, transaction.getWalletId());
            insertStatement.setFloat(2, transaction.getAmount());
            insertStatement.setBoolean(3, transaction.isType());
            insertStatement.setDate(4, Utils.toSQLDate(transaction.getDate()));
            insertStatement.setString(5, transaction.getNote());

            insertStatement.executeUpdate();

            connection.commit();
            return true;
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(WalletDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            return false;
        }
    }

    public void minusMainWalletAmount(int userId, float newAmount) {
        String sql = "UPDATE dbo.Wallet SET amount= amount- ? WHERE user_id=? AND category_id=1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setFloat(1, newAmount);
            ps.setInt(2, userId);
            ps.executeUpdate();

            sql = "select w.wallet_id,c.category_name from Wallet w JOIN Category c ON w.category_id = c.category_id  where  user_id=? AND category_id=1 ";
            ps = connection.prepareStatement(sql);
            ps.setFloat(1, newAmount);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            rs.getInt(1);
            Transaction t = new Transaction(0, rs.getInt(1), newAmount, false, new Timestamp(new Date().getTime()), "Give money to " + rs.getString(2));
            transDao.addTransaction(t);
        } catch (Exception e) {
        }

    }

    public void updateWalletAmount(int walletId, float newAmount, Date updateDate) throws SQLException {
        String selectQuery = "SELECT amount FROM Wallet WHERE wallet_id = ?";
        String updateQuery = "UPDATE Wallet SET amount = ?, update_date = ? WHERE wallet_id = ?";

        try ( PreparedStatement selectStatement = connection.prepareStatement(selectQuery);  PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {

            // Get the current amount in the wallet
            selectStatement.setInt(1, walletId);
            ResultSet rs = selectStatement.executeQuery();
            rs.next();
            float currentAmount = rs.getFloat("amount");
            rs.close();

            // Calculate the resulting amount after adding the new amount
            float resultingAmount = currentAmount + newAmount;

            // Check if the resulting amount is negative, and rollback the transaction if so
            if (resultingAmount < 0) {
                connection.rollback();
                return;
            }

            // Update the amount and update_date in the database
            updateStatement.setFloat(1, resultingAmount);
            updateStatement.setDate(2, Utils.toSQLDate(updateDate));
            updateStatement.setInt(3, walletId);

            updateStatement.executeUpdate();
        }
    }

}
