package com.ht.servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BaseDao.accountDao;
public class CheckAccount extends HttpServlet {
 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
  doGet(req,resp);
 }
 @Override
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
	 System.out.println("lsdflsdlfdslfl");
  HttpSession session = req.getSession();
  AccountBean account = new AccountBean();
  String username = req.getParameter("username");
  String pwd = req.getParameter("pwd");
  account.setPassword(pwd);
  account.setUsername(username);
  
  boolean b=accountDao.findAccountBean(username, pwd);
  if(b){
	  System.out.println("seccuss login !!");
	  session.setAttribute("account", account);
	  resp.sendRedirect("success.jsp");
  }else{
	  resp.sendRedirect("fail.jsp"); 
	  
  }
 }
 
}