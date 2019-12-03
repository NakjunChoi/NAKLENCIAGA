package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.User;
import user.UserDAO;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/login.jsp"); //�ѱ� ������ �ּ�
        dispatcher.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	      
	    HttpSession session = request.getSession();
	    
		String userID = null;
		if(session.getAttribute("userID") !=null){
			userID = (String) session.getAttribute("userID");			
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�̹� �α����� �Ǿ��ֽ��ϴ�.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");	
		}
		User user = new User();
	    user.setUserID(request.getParameter("userID"));
	    user.setUserPW(request.getParameter("userPW"));
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPW());
		
		if(result == 1){
			session.setAttribute("userID",user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��й�ȣ�� Ʋ���ϴ�')");
			script.println("location.href='login'");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�������� �ʴ� ID�Դϴ�.')");
			script.println("location.href='login'");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ �߻��Ͽ����ϴ�')");
			script.println("location.href='login'");
			script.println("</script>");
		}
	}

}
