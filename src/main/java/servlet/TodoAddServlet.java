package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TodoDao;
import dto.TodoDto;

/**
 * Servlet implementation class TodoAddServlet
 */
@WebServlet("/add")
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		int sequence = Integer.parseInt(request.getParameter("sequence"));
		
		TodoDto dto = new TodoDto(title, name, sequence);
		TodoDao dao = new TodoDao();
		int result = dao.addTodo(dto);
		
		if(result > 0) {
			response.sendRedirect("main");
		}else {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("ERROR");
		}
		
	}

}
