/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TransactionDao;
import dao.WalletDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;
import model.Transaction;
import model.User;

@WebServlet(name = "WalletController", urlPatterns = {"/wallet"})
public class WalletController extends HttpServlet {
    
    WalletDao dao = new WalletDao();
    TransactionDao transDao = new TransactionDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        if (u == null) {
            response.sendRedirect("login");
            return;
        }
        int walletId = Integer.parseInt(getParameter("walletId", request));
        setAttribute("w", dao.getWalletById(walletId), request);
        setAttribute("lsWallet", dao.getAllWalletsByUserId(u.getUserId()), request);
        setAttribute("lsTrans", transDao.getAllTransactionsByUserId(u.getUserId()), request);
        setAttribute("lsTransDetails", transDao.getAllTransactionsByWalletId(walletId), request);
        forward("index.jsp", request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int walletId = Integer.parseInt(getParameter("walletId", request));
        int categoryId = Integer.parseInt(getParameter("categoryId", request));
        boolean type = Boolean.parseBoolean(getParameter("type", request));
        String note = getParameter("note", request);
        float amount = Float.valueOf(getParameter("amount", request));
        User u = (User) request.getSession().getAttribute("user");
        if (u == null) {
            response.sendRedirect("login");
            return;
        }
        
        if (type && categoryId != 1) {
            if (amount > dao.getAmountOfMainWallet(u.getUserId())) {
                response.sendRedirect("wallet?walletId=" + walletId);
                return;
            }
            dao.minusMainWalletAmount(u.getUserId(), amount);
        }
        Transaction t = new Transaction(0, walletId, type ? amount : -amount, type, new Timestamp(new Date().getTime()), note);
        dao.addTransactionAndUpdateWallet(t, categoryId, u.getUserId());
        
        response.sendRedirect("wallet?walletId=" + walletId);
    }
    
    private String getParameter(String name, HttpServletRequest request) {
        return request.getParameter(name);
    }
    
    private void setAttribute(String name, Object o, HttpServletRequest request) {
        request.setAttribute(name, o);
    }
    
    private void forward(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(path).forward(request, response);
    }
}
