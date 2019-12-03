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
 * Servlet implementation class joinServlet
 */
@WebServlet("/join")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/join.jsp"); //�ѱ� ������ �ּ�
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
	   
	    request.setCharacterEncoding("UTF-8");
	    User user = new User();
	    
	    user.setUserID(request.getParameter("userID"));
	    user.setUserPW(request.getParameter("userPW"));
		user.setUserName(request.getParameter("userName"));
		user.setUserGender(request.getParameter("userGender"));
		user.setUserEmail(request.getParameter("userEmail"));
	    
		
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
		if(user.getUserID() == null || user.getUserPW() ==null ||user.getUserName() ==null || user.getUserGender() ==null || user.getUserEmail() ==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�ùٸ� ������ �Է� ���� �ʾҽ��ϴ�.')");
			script.println("location.href = 'join'");
			script.println("</script>");
		}
		else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�̹� �����ϴ� ���̵��Դϴ�.')");
				script.println("location.href = 'join'");
				script.println("</script>");
			}
			else{
				session.setAttribute("userID",user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('���������� ���ԵǾ����ϴ�.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
	}

}
