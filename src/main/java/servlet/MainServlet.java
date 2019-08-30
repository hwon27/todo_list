package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TodoDao;
import dto.TodoDto;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.setCharacterEncoding("utf-8");
		
		TodoDao dao=new TodoDao();
		List<TodoDto> list=dao.getTodos();
	
		//TodoDao를 이용해 결과를 조회해서 main.jsp 에 전달
		request.setAttribute("list", list);		
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

}