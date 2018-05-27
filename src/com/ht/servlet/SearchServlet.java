package com.ht.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BaseDao.recordDao;
import net.sf.json.JSONArray;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
     
    }
  static  List<String>  data=new ArrayList<String>();
  static {
	  
	  data.add("ajax1");
	  data.add("ajax2");
	  data.add("ajax3");
	  data.add("ajax4");
	  data.add("ajax5");
	  data.add("ajax6");  
  }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
		String keyword =request.getParameter("keyword");
		List<String>  dataList=getdataListFromDb(keyword);	   
	   System.out.println(JSONArray.fromObject(dataList));
	   response.getWriter().write(JSONArray.fromObject(dataList).toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
   public List<String>  getdataList (String keyword){
	   List<String>  dataList =new ArrayList<String>();
	   
 	   for(String da:data){
 		   if(da.contains(keyword)){
 			   dataList.add(da);
 		   }
 		   
 		   
 	   }
	   
	   return dataList;
   }
   public List<String>  getdataListFromDb (String keyword){
	   List<String>  dataList =new ArrayList<String>();
	   
 	 dataList=recordDao.getSearchList(keyword);
	   
	   return dataList;
   }
   
}
