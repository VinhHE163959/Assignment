/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TransactionDao;
import dao.WalletDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class HomeController extends HttpServlet {

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
        setAttribute("lsWallet", dao.getAllWalletsByUserId(u.getUserId()), request);
        setAttribute("lsTrans", transDao.getAllTransactionsByUserId(u.getUserId()), request);
        forward("index.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
