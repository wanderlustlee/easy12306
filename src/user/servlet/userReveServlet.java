package user.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import user.domin.UserVO;
import user.service.UserService;
import user.service.UserServiceImpl;

import user.service.UserService;
import user.service.UserServiceImpl;


import constant.EnumType;
import user.domin.*;
import user.service.*;
import user.util.IsNullUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class userReveServlet
 */
@WebServlet("/userReveServlet")
public class userReveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserService userMgrService = UserServiceImpl.getInstance();
    private static TrainService trainMgrService = TrainServiceImpl.getInstance();
    private static OrderService orderMgrService = OrderServiceImpl.getInstance();
    private static TicketQueryVO ticketQueryVO = new TicketQueryVO();
    private static OrderQueryVO orderQueryVO = new OrderQueryVO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userReveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		HttpSession se=req.getSession();
		UserVO user=(UserVO) se.getAttribute("user");
		String action=req.getParameter("action");
		
		UserService userMgrService = UserServiceImpl.getInstance();
		//"userInfoEdit".equals(action);
		String msg=null;
		
		if("userInfoEdit".equals(action)){
			
			doInfoEdit(req,user);
			
			if(userMgrService.updateUser(user)){
				
				se.setAttribute("user", user);
				req.getRequestDispatcher("User/UserManageInfo.jsp").forward(req, resp);
				msg="修改信息成功";
				req.setAttribute("userMsg", msg);
			}else{
				msg="更新数据出错";
				req.setAttribute("userMsg", msg);
				req.getRequestDispatcher("User/UserManageInfo_Edit.jsp").forward(req, resp);
			}
		}else if (("BuyTicket".equals(req.getParameter("action")) && req.getParameter("submitQuery") != null) || "changePageTicket".equals(req.getParameter("action")) || "Buying".equals(req.getParameter("action"))|| "changeBuy".equals(req.getParameter("action"))) {
            doQueryTicket(req, resp);
        } else if ("trainSchedule".equals(req.getParameter("action"))) {
            doShowTrainSchedule(req, resp);
        } else if ("reserve".equals(req.getParameter("action"))) {
            doReserve(req, resp);
        } else if ("QueryOrder".equals(req.getParameter("action")) && req.getParameter("submitQuery") != null || "changePageOrder".equals(req.getParameter("action")) || "ticketChange".equals(req.getParameter("action")) || "refund".equals(req.getParameter("action"))) {
            doQueryOrder(req, resp);
        }
		else{
		
			String oldpass=req.getParameter("oldPass");
			String newpass=req.getParameter("newPass");
			String newpass_again=req.getParameter("newPass_again");
			
			if(userMgrService.login(user.getName(), oldpass)==0){
				msg="原密码错误!";
				req.setAttribute("error", msg);
				// resp.sendRedirect("/User/UserPassword_Edit.jsp");
				req.getRequestDispatcher("/User/UserPassword_Edit.jsp").forward(req, resp);
			}else if(newpass.length()<6){
				msg="新密码必须超过6位字符!";
				req.setAttribute("error", msg);
				req.getRequestDispatcher("/User/UserPassword_Edit.jsp").forward(req, resp);
			}else if(!newpass.equals(newpass_again)){
				msg="两次输入的密码不同!";
				req.setAttribute("error", msg);
				req.getRequestDispatcher("/User/UserPassword_Edit.jsp").forward(req, resp);
			}else{
				doPassEdit(req,user);
				
				if(userMgrService.updateUser(user)){
					
					se.setAttribute("user", user);
					msg="修改密码成功";
					req.setAttribute("error", msg);
					req.getRequestDispatcher("/User/UserPassword_Edit.jsp").forward(req, resp);
				}else{
					msg="向数据库中修改密码出错!";
					req.setAttribute("error", msg);
					req.getRequestDispatcher("/User/UserPassword_Edit.jsp").forward(req, resp);
				}
			}
		}
	}
	private void doInfoEdit(HttpServletRequest request,UserVO user) {
	
		String passenger_type=request.getParameter("passenger_type");
		String textarea=request.getParameter("textarea");
		
		user.setPersonType(passenger_type);
		user.setRemarks(textarea);	
	}

	private void doPassEdit(HttpServletRequest request,UserVO user) {
		
		
		String upwd=request.getParameter("newPass");

		user.setPassword(upwd);
	
	}
	
	
	
	 private void doQueryOrder(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
	        HttpSession session = req.getSession();
	        session.removeAttribute("arrayListAllOrder");
	        session.removeAttribute("arrayListOrder");
	        session.removeAttribute("conditionOrder");
	        if ("ticketChange".equals(req.getParameter("action"))) {
	            UserVO userVO = (UserVO)session.getAttribute("user");
	            OrderVO orderVO = new OrderVO();
	            String bb = req.getParameter("ssid");
	            ArrayList<OrderVO> arrayList = queryOrder();
	            OrderVO orderVO1 = arrayList.get(Integer.parseInt(bb));

	            orderVO.setTrain(orderVO1.getTrain());
	            orderVO.setStatus(2);
	            orderVO.setUsername(userVO.getName());
	            orderMgrService.updateOrder(orderVO);
	            resp.sendRedirect("User/BuyTicket.jsp");
	            return;
	        } else if ("refund".equals(req.getParameter("action"))) {
	            UserVO userVO = (UserVO)session.getAttribute("user");
	            OrderVO orderVO = new OrderVO();
	            String bb = req.getParameter("ssid");
	            ArrayList<OrderVO> arrayList = queryOrder();
	            OrderVO orderVO1 = arrayList.get(Integer.parseInt(bb));

	            orderVO.setTrain(orderVO1.getTrain());
	            orderVO.setStatus(3);
	            orderVO.setUsername(userVO.getName());
	            orderMgrService.updateOrder(orderVO);
	            resp.sendRedirect("User/OrderInfo.jsp");
	            return;
	        }

	        if (!"changePageOrder".equals(req.getParameter("action"))) {
	            orderQueryVO = readParameterByOrderQuery(req);
	        } else if ("changePageOrder".equals(req.getParameter("action"))) {
	            if (IsNullUtil.isNull(orderQueryVO.getDate())) {
	                orderQueryVO.setDate("");
	            }
	            if (IsNullUtil.isNull(orderQueryVO.getTrain())) {
	                orderQueryVO.setTrain("");
	            }
	            if (IsNullUtil.isNull(orderQueryVO.getDestination())) {
	                orderQueryVO.setDestination("");
	            }
	            if (IsNullUtil.isNull(orderQueryVO.getOrigin())) {
	                orderQueryVO.setOrigin("");
	            }
	            if (IsNullUtil.isNull(orderQueryVO.getUsername())) {
	                orderQueryVO.setUsername(((UserVO) session.getAttribute("user")).getName());
	            }
	        }

	        String numPrePage = req.getParameter("select2");
	        String numPrePageFromJS = req.getParameter("numPrePage");

	        String pageNum = req.getParameter("pageNum");
	        if (pageNum == null) {
	            pageNum = "1";
	        }

	        if (numPrePage == null) {
	            numPrePage = numPrePageFromJS;
	        }
	        ArrayList<OrderVO> arrayList = queryOrder();
	        ArrayList<OrderVO> arrayList1 = new ArrayList<>();
	        int maxPage;
	        if (arrayList.size() % Integer.parseInt(numPrePage) == 0) {
	            maxPage = arrayList.size() / Integer.parseInt(numPrePage);
	        } else {
	            maxPage = arrayList.size() / Integer.parseInt(numPrePage) + 1;
	        }
	        for (int i = (Integer.parseInt(pageNum) - 1) * Integer.parseInt(numPrePage); i < arrayList.size() && i < Integer.parseInt(pageNum) * Integer.parseInt(numPrePage); ++i) {
	            arrayList1.add(arrayList.get(i));
	        }

	        ArrayList<OrderVO> arrayListOrder = orderMgrService.getOrderByUser((UserVO)session.getAttribute("user"));

	        session.setAttribute("conditionOrder", orderQueryVO);
	        session.setAttribute("arrayListAllOrder", arrayList);
	        session.setAttribute("arrayListOrder", arrayList1);
	        session.setAttribute("everyPageOrder", numPrePage);
	        session.setAttribute("maxPageOrder", maxPage);
	        session.setAttribute("curPageOrder", pageNum);
	        session.setAttribute("orderOrder", arrayListOrder);
	        resp.sendRedirect("User/OrderInfo.jsp");
	    }

	    private void doReserve(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
	        String bb = req.getParameter("ssid");
	        ArrayList<TrainVO> arrayList = queryTicket();
	        TrainVO trainVO = arrayList.get(Integer.parseInt(bb));
	        OrderVO orderVO = new OrderVO();
	        HttpSession session = req.getSession();

	        String[] stations = trainVO.getStation().split(" ");
	        String[] clocks = trainVO.getTime().split(" ");
	        String[] dates = trainVO.getDate().split(" ");
	        String[] price = trainVO.getPrice().split(" ");
	        String originShow = null;
	        String destinationShow = null;
	        String priceStart = null;
	        String priceEnd = null;
	        String clockStart = null;

	        for (int j = 0; j < stations.length; ++j) {
	            if (ticketQueryVO.getOrigin().equals(stations[j])) {
	                clockStart = dates[j] + " " + clocks[j];
	                originShow = stations[j];
	                priceStart = price[j];
	                break;
	            }
	        }

	        for (int j = stations.length - 1; j >= 0; --j) {
	            if (ticketQueryVO.getDestination().equals(stations[j])) {
	                destinationShow = stations[j];
	                priceEnd = price[j];
	                break;
	            }
	        }

	        orderVO.setUsername(((UserVO) session.getAttribute("user")).getName());
	        orderVO.setStartTime(clockStart);
	        orderVO.setStatus(1);
	        orderVO.setTrain(trainVO.getType() + trainVO.getNumber());
	        orderVO.setDestination(destinationShow);
	        orderVO.setOrigin(originShow);
	        orderVO.setPrice(Integer.parseInt(priceEnd) - Integer.parseInt(priceStart));
	        orderMgrService.saveOrder(orderVO);
	        resp.sendRedirect("userReveServlet?action=Buying");
	    }

	    private void doShowTrainSchedule(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
	        String bb = req.getParameter("ssid");
	        ArrayList<TrainVO> arrayList = queryTicket();
	        TrainVO trainVO = arrayList.get(Integer.parseInt(bb));
	        HttpSession session = req.getSession();

	        session.removeAttribute("Train");
	        session.setAttribute("Train", trainVO);
	        resp.sendRedirect("User/trainSchedule.jsp");
	    }

	    private void doQueryTicket(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
	        HttpSession session = req.getSession();
	        session.removeAttribute("arrayListAllTicket");
	        session.removeAttribute("arrayListTicket");
	        session.removeAttribute("conditionTicket");
	        if ("Buying".equals(req.getParameter("action"))) {
	            ArrayList<OrderVO> arrayListOrder = orderMgrService.getOrderByUser((UserVO)session.getAttribute("user"));
	            session.setAttribute("orderTicket", arrayListOrder);
	            resp.sendRedirect("User/BuyTicket.jsp");
	            return;
	        }

	        if (!"changePageTicket".equals(req.getParameter("action"))) {
	            ticketQueryVO = readParameterByTicketQuery(req);
	        } else if ("changePageTicket".equals(req.getParameter("action"))) {
	            if (IsNullUtil.isNull(ticketQueryVO.getType())) {
	                ticketQueryVO.setType("");
	            }
	            if (IsNullUtil.isNull(ticketQueryVO.getDate())) {
	                ticketQueryVO.setDate("");
	            }
	            if (IsNullUtil.isNull(ticketQueryVO.getDestination())) {
	                ticketQueryVO.setDestination("");
	            }
	            if (IsNullUtil.isNull(ticketQueryVO.getOrigin())) {
	                ticketQueryVO.setOrigin("");
	            }
	        }

	        String numPrePage = req.getParameter("select2");
	        String numPrePageFromJS = req.getParameter("numPrePage");

	        String pageNum = req.getParameter("pageNum");
	        if (pageNum == null) {
	            pageNum = "1";
	        }

	        if (numPrePage == null) {
	            numPrePage = numPrePageFromJS;
	        }
	        ArrayList<TrainVO> arrayList = queryTicket();
	        ArrayList<TrainVO> arrayList1 = new ArrayList<>();
	        int maxPage;
	        if (arrayList.size() % Integer.parseInt(numPrePage) == 0) {
	            maxPage = arrayList.size() / Integer.parseInt(numPrePage);
	        } else {
	            maxPage = arrayList.size() / Integer.parseInt(numPrePage) + 1;
	        }
	        for (int i = (Integer.parseInt(pageNum) - 1) * Integer.parseInt(numPrePage); i < arrayList.size() && i < Integer.parseInt(pageNum) * Integer.parseInt(numPrePage); ++i) {
	            arrayList1.add(arrayList.get(i));
	        }

	        ArrayList<OrderVO> arrayListOrder = orderMgrService.getOrderByUser((UserVO)session.getAttribute("user"));

	        session.setAttribute("conditionTicket", ticketQueryVO);
	        session.setAttribute("arrayListAllTicket", arrayList);
	        session.setAttribute("arrayListTicket", arrayList1);
	        session.setAttribute("everyPageTicket", numPrePage);
	        session.setAttribute("maxPageTicket", maxPage);
	        session.setAttribute("curPageTicket", pageNum);
	        session.setAttribute("orderTicket", arrayListOrder);
	        resp.sendRedirect("User/BuyTicket.jsp");
	    }

	    private ArrayList<TrainVO> queryTicket() {
	        return trainMgrService.getTrainByUser(ticketQueryVO.getType(), ticketQueryVO.getDate(), ticketQueryVO.getOrigin(), ticketQueryVO.getDestination());
	    }

	    private ArrayList<OrderVO> queryOrder() {
	        return orderMgrService.getOrderByInfo(orderQueryVO);
	    }

	   

	    private OrderQueryVO readParameterByOrderQuery(final HttpServletRequest req) {
	        OrderQueryVO orderQueryVO1 = new OrderQueryVO();
	        orderQueryVO1.setTrain(req.getParameter("textfield1"));
	        orderQueryVO1.setDate(req.getParameter("textfield2"));
	        orderQueryVO1.setOrigin(req.getParameter("textfield3"));
	        orderQueryVO1.setDestination(req.getParameter("textfield4"));
	        if (!IsNullUtil.isNull(req.getParameter("select"))) {
	            String the = req.getParameter("select");
	            if ("已购票".equals(the)) {
	                the = "1";
	            } else if ("已改签".equals(the)) {
	                the = "2";
	            } else if ("已退票".equals(the)) {
	                the = "3";
	            }
	            orderQueryVO1.setStatus(Integer.parseInt(the));
	        }else {
	            orderQueryVO1.setStatus(0);
	        }
	        HttpSession session = req.getSession();
	        orderQueryVO1.setUsername(((UserVO) session.getAttribute("user")).getName());
	        return orderQueryVO1;
	    }

	    private TicketQueryVO readParameterByTicketQuery(final HttpServletRequest req) {
	        TicketQueryVO ticketQueryVO1 = new TicketQueryVO();
	        ticketQueryVO1.setDate(req.getParameter("textfield"));
	        ticketQueryVO1.setDestination(req.getParameter("textfield4"));
	        ticketQueryVO1.setOrigin(req.getParameter("textfield3"));
	        ticketQueryVO1.setType(req.getParameter("select"));

	        return ticketQueryVO1;
	    }


}

