package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;


@WebServlet("/fileBrowser.do")
public class ServerFileBrowser extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   
      File webContent = new File(getServletContext().getRealPath("/"));
      File[] files = webContent.listFiles();

      Map<String, String> fileList = new LinkedHashMap<>();
      
      for (File file : files) {
         if (file.isDirectory()) {
            fileList.put(file.getName(), file.getAbsolutePath());
         }
      }
         
      req.setAttribute("folders", fileList);
      
      String command =  req.getParameter("command");
      
      if(command!=null) {
         File liList = new File(fileList.get(command));
         File liFiles[] = null;
         liFiles = liList.listFiles();
         req.setAttribute("liFiles", liFiles);
      }
      
      String view = "/WEB-INF/views/fileBrowser.jsp";
      RequestDispatcher rd  = req.getRequestDispatcher(view);
      rd.forward(req, resp);
   }
}