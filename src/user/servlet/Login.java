package user.servlet;
import java.io.IOException;



import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import user.service.UserService;
import user.service.UserServiceImpl;
import user.domin.UserVO;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
	public void init() throws ServletException {
        super.init();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
		//System.out.println("111");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //PrintWriter printWriter = resp.getWriter();
        UserVO userVO = new UserVO();
        userVO.setName(req.getParameter("uname"));
        userVO.setPassword(req.getParameter("pass"));
     
        
        
        
        UserService userMgrService = UserServiceImpl.getInstance();
        boolean a = true;
        //b为userMgService返回的POWER权限
        int b = userMgrService.login(userVO.getName(), userVO.getPassword());
        
        if(userMgrService.login(userVO.getName(), userVO.getPassword()) > 0){
        	 a = true;
        	 
        }
        else{
        	a = false;
        }
        if (a) {
            if(b==1){
            	HttpSession se=req.getSession();
            	UserVO usertemp=userMgrService.getUserByName(userVO.getName());
            	se.setAttribute("user", usertemp);
            	resp.sendRedirect(req.getContextPath()+"/Admin/Index.html");
            }
            else{
            	
            	HttpSession se=req.getSession();
            	UserVO usertemp=userMgrService.getUserByName(userVO.getName());
            	se.setAttribute("user", usertemp);
            	resp.sendRedirect(req.getContextPath()+"/User/Index.html");
            }
        	
            //req.getRequestDispatcher("Index.html").forward(req, resp);
        } else {
            resp.sendRedirect("login.html");
        }
	}

}
