package model;

import java.sql.Timestamp;
import java.util.Date;

public class Wallet {

    private int walletId;
    private int userId;
    private int categoryId;
    private String categoryName;
    private float amount;
    private Timestamp updateDate;

    private Transaction lastTransaction;

    public Wallet() {
    }

    public Wallet(int walletId, int userId, int categoryId, float amount, Timestamp updateDate) {
        this.walletId = walletId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.amount = amount;
        this.updateDate = updateDate;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getWalletId() {
        return walletId;
    }

    public void setWalletId(int walletId) {
        this.walletId = walletId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public Transaction getLastTransaction() {
        return lastTransaction;
    }

    public void setLastTransaction(Transaction lastTransaction) {
        this.lastTransaction = lastTransaction;
    }

}
