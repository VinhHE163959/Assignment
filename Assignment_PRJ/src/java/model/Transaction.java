package model;

import java.sql.Timestamp;
import java.util.Date;

public class Transaction {

    private int transactionId;
    private int walletId;
    private String categoryName;
    private float amount;
    private boolean type;
    private Timestamp date;
    private String note;

    public Transaction() {
    }

    public Transaction(int transactionId, int walletId, float amount, boolean type, Timestamp date, String note) {
        this.transactionId = transactionId;
        this.walletId = walletId;
        this.amount = amount;
        this.type = type;
        this.date = date;
        this.note = note;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getWalletId() {
        return walletId;
    }

    public void setWalletId(int walletId) {
        this.walletId = walletId;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

}
