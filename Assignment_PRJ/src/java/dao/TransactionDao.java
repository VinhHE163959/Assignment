/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Transaction;

public class TransactionDao extends DBContext {

    public List<Transaction> getAllTransactionsByUserId(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT t.transaction_id, t.wallet_id, c.category_name, t.amount, t.type, t.date, t.note "
                + "FROM [Transactions] t "
                + "JOIN Wallet w ON t.wallet_id = w.wallet_id "
                + "JOIN Category c ON w.category_id = c.category_id "
                + "WHERE w.user_id = ? "
                + "ORDER BY t.date DESC")) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(resultSet.getInt("transaction_id"));
                transaction.setWalletId(resultSet.getInt("wallet_id"));
                transaction.setCategoryName(resultSet.getString("category_name"));
                transaction.setNote(resultSet.getString("note"));
                transaction.setAmount(resultSet.getFloat("amount"));
                transaction.setType(resultSet.getBoolean("type"));
                transaction.setDate(resultSet.getTimestamp("date"));
                transactions.add(transaction);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transactions;
    }

    public List<Transaction> getAllTransactionsByWalletId(int walletId) {
        List<Transaction> transactions = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT t.transaction_id, t.wallet_id, c.category_name, t.amount, t.type, t.date,t.note "
                + "FROM [Transactions] t "
                + "JOIN Wallet w ON t.wallet_id = w.wallet_id "
                + "JOIN Category c ON w.category_id = c.category_id "
                + "WHERE w.wallet_id = ? "
                + "ORDER BY t.date DESC")) {
            preparedStatement.setInt(1, walletId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(resultSet.getInt("transaction_id"));
                transaction.setWalletId(resultSet.getInt("wallet_id"));
                transaction.setCategoryName(resultSet.getString("category_name"));
                transaction.setAmount(resultSet.getFloat("amount"));
                transaction.setType(resultSet.getBoolean("type"));
                transaction.setDate(resultSet.getTimestamp("date"));
                transaction.setNote(resultSet.getString("note"));

                transactions.add(transaction);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transactions;
    }

    // CREATE operation
    public void addTransaction(Transaction transaction) throws SQLException {
        String query = "INSERT INTO Transactions (wallet_id, amount, type, date,note) VALUES (?, ?, ?, ?,?)";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, transaction.getWalletId());
            statement.setFloat(2, transaction.getAmount());
            statement.setBoolean(3, transaction.isType());
            statement.setDate(4, new Date(transaction.getDate().getTime()));
            statement.setString(5, transaction.getNote());
            statement.executeUpdate();
        }
    }
    // DELETE operation

    public void deleteTransaction(int transactionId) throws SQLException {
        String query = "DELETE FROM Transactions WHERE transaction_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, transactionId);

            statement.executeUpdate();
        }
    }
}
