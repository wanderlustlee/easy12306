package user.servlet;

import java.io.IOException;

import user.domin.UserVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import user.domin.UserVO;
import user.service.UserService;
import user.service.UserServiceImpl;
/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static UserService userMgrService = UserServiceImpl.getInstance();
    private String message;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() throws ServletException {
        super.init();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        UserVO userVO = new UserVO();
        userVO.setName(req.getParameter("textfield2"));
        userVO.setPassword(req.getParameter("textfield3"));
        userVO.setRealName(req.getParameter("textfield5"));
        userVO.setSex(req.getParameter("userDTO.sex_code"));
        userVO.setProvince(req.getParameter("province"));
        userVO.setCity(req.getParameter("city"));
        userVO.setDocType(req.getParameter("loginUserDTO.id_type_code"));
        userVO.setDocNum(req.getParameter("textfield6"));
        userVO.setBirthday(req.getParameter("textfield7"));
        userVO.setPersonType(req.getParameter("passenger_type"));
        userVO.setRemarks(req.getParameter("textarea"));
        userVO.setPower(2);
/*
        System.out.println("姓名"+userVO.getName());
        System.out.println("密码"+userVO.getPassword());
        System.out.println("省份"+userVO.getProvince());
        System.out.println("城市"+userVO.getCity());
*/


        if (userMgrService.saveUser(userVO)) {
            resp.sendRedirect("login.html");
        } else {
            resp.sendRedirect("UserRegistration.html");
            System.out.println("注册失败");
        }
	}

}
