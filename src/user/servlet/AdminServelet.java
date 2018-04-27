package user.servlet;
import user.domin.TrainQueryVO;
import user.domin.TrainVO;
import user.domin.UserQueryVO;
import user.domin.UserVO;
import user.service.TrainService;
import user.service.TrainServiceImpl;
import user.service.UserService;
import user.service.UserServiceImpl;
import user.util.IsNullUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import constant.EnumType;
/**
 * Created by Hasee on 2017-07-06.
 */
@WebServlet("/AdminServelet")
public class AdminServelet extends HttpServlet {
    public static UserService userMgrService = UserServiceImpl.getInstance();
    private String message;
    private static TrainService trainMgrService = TrainServiceImpl.getInstance();
    private static UserQueryVO userQueryVO;
    private static TrainQueryVO trainQueryVO = new TrainQueryVO();

    public AdminServelet() {
            super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String aa = req.getParameter("action");
        
        if("true".equals(req.getParameter("repass1"))){
        	UserService userMgrService = UserServiceImpl.getInstance();
        	UserVO user = (UserVO)req.getSession().getAttribute("user");
        	user.setPassword("123456");
        	user.setName(user.getName());
        	userMgrService.updatePassword(user);
        	resp.sendRedirect(req.getContextPath()+"/Admin/UserManageQuery.jsp");
        }
        
        if ("addUser".equals(req.getParameter("action"))) {
            doAddUser(req, resp);
        } 
        else if ("query".equals(req.getParameter("action")) && req.getParameterValues("submit2") == null) {
            
            doManageUser(req, resp);
        } else if ("edit".equals(req.getParameter("action"))) {
            
            doEdit(req, resp);
        } else if ("query".equals(req.getParameter("action")) && req.getParameterValues("submit2") != null) {
            
            doDeleteUser(req, resp);
        }  else if (("query".equals(req.getParameter("action")) || "changePage".equals(req.getParameter("action"))) && req.getParameter("submit2") == null && req.getParameter("submit1") == null && req.getParameter("submit3") == null) {
            doManageUser(req, resp);
        } else if (("queryTrain".equals(req.getParameter("action")) || "changePageTrain".equals(req.getParameter("action"))) && req.getParameter("submit2") == null  && req.getParameter("submit1") == null && req.getParameter("submit3") == null) {
            doManageTrain(req, resp);
        } else if ("queryTrain".equals(req.getParameter("action")) && req.getParameter("submit2") != null) {
            doDeleteTrain(req, resp);
        } else if ("addTrain".equals(req.getParameter("action")) && req.getParameter("confirm") != null){
            doShowField(req, resp);
        } else if ("addTrain".equals(req.getParameter("action")) && req.getParameter("submitAddTrain") != null) {
            doAddTrain(req, resp);
        } else if ("query".equals(req.getParameter("action")) && req.getParameter("submit3") != null) {
           // doUserExport(req, resp);
        } else if ("queryTrain".equals(req.getParameter("action")) && req.getParameter("submit3") != null) {
           // doTrainExport(req, resp);
        } else if ("queryTrain".equals(req.getParameter("action")) && req.getParameter("submit1") != null) {
            doInAddTrainPage(req, resp);
        } else if ("editTrain".equals(req.getParameter("action")) && req.getParameter("submit") == null) {
            doInEditTrain(req, resp);
        } else if ("editTrain".equals(req.getParameter("action")) && req.getParameter("submit") != null) {
            doEditTrain(req, resp);
        } else if ("trainSchedule".equals(req.getParameter("action"))) {
            doShowTrainSchedule(req, resp);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
/*
    private void doChangePage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String numPerPage = req.getParameter("numPerPage");
        
    }
*/
    private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	HttpSession se=req.getSession();
		UserVO user=(UserVO) se.getAttribute("user");
		doInfoEdit(req,user);
		UserService userMgrService = UserServiceImpl.getInstance();
		if(userMgrService.updateUser(user)){
			
			se.setAttribute("user", user);
			req.getRequestDispatcher("Admin/UserManageQuery.jsp").forward(req, resp);
			//msg="修改信息成功";
			//req.setAttribute("userMsg", msg);
		}else{
			//msg="更新数据出错";
			//req.setAttribute("userMsg", msg);
			req.getRequestDispatcher("Admin/UserManageInfo_Amind_Edit.jsp").forward(req, resp);
		}
		
		
    	/*
    	String bb = req.getParameter("ssid");
        
        if (userQueryVO != null) {
            ArrayList<UserVO> arrayList = query(userQueryVO);
            arrayList.get(Integer.parseInt(bb)).setPassword("password_reset");
            userMgrService.updatePassword(arrayList.get(Integer.parseInt(bb)));
        }
        resp.sendRedirect("Admin/UserManageQuery.jsp");
        */
    }

    private void doDeleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String[] values = req.getParameterValues("checkbox");
        HttpSession session = req.getSession();
        userQueryVO = readParameterByManage(req);
        if (userQueryVO != null && values != null) {
            ArrayList<UserVO> arrayList = query(userQueryVO);
            for (String va : values) {
                userMgrService.removeUser(arrayList.get(Integer.parseInt(va)).getName());
            }
            arrayList = query(userQueryVO);
            session.setAttribute("arrayList",arrayList);
            String numPrePage = req.getParameter("select2");
            String pageNum = req.getParameter("pageNum");

            if (pageNum == null) {
                pageNum = "1";
            }

            
            ArrayList<UserVO> arrayList1 = new ArrayList<>();
            int maxPage;
            if (arrayList.size() % Integer.parseInt(numPrePage) == 0) {
                maxPage = arrayList.size() / Integer.parseInt(numPrePage);
            } else {
                maxPage = arrayList.size() / Integer.parseInt(numPrePage) + 1;
            }
            for (int i = (Integer.parseInt(pageNum) - 1) * Integer.parseInt(numPrePage); i < arrayList.size() && i < Integer.parseInt(pageNum) * Integer.parseInt(numPrePage); ++i) {
                arrayList1.add(arrayList.get(i));
            }

            session.setAttribute("condition", userQueryVO);
            session.setAttribute("arrayList1", arrayList1);
            session.setAttribute("everyPage", numPrePage);
            session.setAttribute("maxPage", maxPage);
            session.setAttribute("curPage", pageNum);
        }
            
        
        resp.sendRedirect("Admin/UserManageQuery.jsp");
    }

    private void doAddUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        UserVO userVO = readParameterByAdd(req);
/*
        String vali = validate(userVO);
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        session.removeAttribute("validate");
        session.removeAttribute("exist");

        if (vali != null) {
            session.setAttribute("validate", vali);
            resp.sendRedirect("Admin/UserInfo_Add.jsp");
        } else if (userMgrService.getUserByName(userVO.getName()).getName() != null) {
            session.setAttribute("exist", "登录名已存在！");
            resp.sendRedirect("Admin/UserInfo_Add.jsp");
        } else if (userMgrService.getUserByRealName(userVO.getRealName()).getRealName() != null) {
            session.setAttribute("exist", "该用户已实名认证！");
            resp.sendRedirect("Admin/UserInfo_Add.jsp");
        } else if (userMgrService.getUserByDocNum(userVO.getDocNum()).getDocNum() != null) {
            session.setAttribute("exist", "该身份证已实名认证！");
            resp.sendRedirect("Admin/UserInfo_Add.jsp");
        } else{
        */
            if (userMgrService.saveUser(userVO)) {
               // resp.sendRedirect("Admin/UserManageQuery.jsp?action=logon");
                resp.sendRedirect("Admin/Index.html");
                //req.getRequestDispatcher("Admin/Index.html").forward(req, arg1);
            } else {
                resp.sendRedirect("Admin/UserInfo_Add.jsp");
            }
        // }
    }

    private void doManageUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        //session.removeAttribute("user");
        //session.removeAttribute("arrayList");
        //session.removeAttribute("condition");
        if (!"changePage".equals(req.getParameter("action"))) {
            userQueryVO = readParameterByManage(req);
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
        ArrayList<UserVO> arrayList = query(userQueryVO);
        ArrayList<UserVO> arrayList1 = new ArrayList<>();
        int maxPage;
        if (arrayList.size() % Integer.parseInt(numPrePage) == 0) {
            maxPage = arrayList.size() / Integer.parseInt(numPrePage);
        } else {
            maxPage = arrayList.size() / Integer.parseInt(numPrePage) + 1;
        }
        for (int i = (Integer.parseInt(pageNum) - 1) * Integer.parseInt(numPrePage); i < arrayList.size() && i < Integer.parseInt(pageNum) * Integer.parseInt(numPrePage); ++i) {
            arrayList1.add(arrayList.get(i));
        }

        session.setAttribute("condition", userQueryVO);
        session.setAttribute("arrayListAllUser", arrayList);
        session.setAttribute("arrayList1", arrayList1);
        session.setAttribute("everyPage", numPrePage);
        session.setAttribute("maxPage", maxPage);
        session.setAttribute("curPage", pageNum);
        userQueryVO = readParameterByManage(req);

        //ArrayList<UserVO> arrayList = query(userQueryVO);
        session.setAttribute("condition", userQueryVO);
        session.setAttribute("arrayList",arrayList);
        resp.sendRedirect("Admin/UserManageQuery.jsp");
    }

    private ArrayList<UserVO> query(UserQueryVO userQueryVO) {
        return userMgrService.getUserByAdmin(userQueryVO.getName(), userQueryVO.getSex(), userQueryVO.getDocType(), userQueryVO.getDocNum(), userQueryVO.getPersonType());
    }

    private ArrayList<TrainVO> queryTrain() {
        return trainMgrService.getTrainByAdmin(trainQueryVO.getType(), trainQueryVO.getNumber(), trainQueryVO.getOrigin(), trainQueryVO.getDestination());
    }

    private TrainQueryVO readParameterByManageTrain(final HttpServletRequest req) {
        if (req.getParameter("select") == null && req.getParameter("textfield") == null && req.getParameter("textfield3") == null && req.getParameter("textfield4") == null) {
            return trainQueryVO;
        }
        trainQueryVO.setType(req.getParameter("select"));
        trainQueryVO.setNumber(req.getParameter("textfield"));
        trainQueryVO.setOrigin(req.getParameter("textfield3"));
        trainQueryVO.setDestination(req.getParameter("textfield4"));

        if (IsNullUtil.isNull(trainQueryVO.getType())) {
            trainQueryVO.setType("");
        }
        if (IsNullUtil.isNull(trainQueryVO.getNumber())) {
            trainQueryVO.setNumber("");
        }
        if (IsNullUtil.isNull(trainQueryVO.getGoOff())) {
            trainQueryVO.setGoOff("");
        }
        if (IsNullUtil.isNull(trainQueryVO.getOrigin())) {
            trainQueryVO.setOrigin("");
        }
        if (IsNullUtil.isNull(trainQueryVO.getDestination())) {
            trainQueryVO.setDestination("");
        }
        return trainQueryVO;
    }
    private UserQueryVO readParameterByManage(HttpServletRequest req) {
        UserQueryVO userQueryVO = new UserQueryVO();
        userQueryVO.setName(req.getParameter("textfield"));
        userQueryVO.setSex(req.getParameter("select"));
        userQueryVO.setDocType(req.getParameter("loginUserDTO.id_type_code"));
        userQueryVO.setDocNum(req.getParameter("textfield2"));
        userQueryVO.setPersonType(req.getParameter("passenger_type"));
        return userQueryVO;
    }

    private UserVO readParameterByAdd(HttpServletRequest req) {
        UserVO userVO = new UserVO();
        userVO.setName(req.getParameter("textfield2"));
        if (req.getParameter("select") != null && req.getParameter("select").equals("管理员")) {
            userVO.setPower(1);
        } else if (req.getParameter("select") != null && req.getParameter("select").equals("普通用户")) {
            userVO.setPower(2);
        }
        userVO.setRealName(req.getParameter("textfield"));
        userVO.setPassword("123456");
        userVO.setSex(req.getParameter("userDTO.sex_code"));
        userVO.setProvince(req.getParameter("province"));
        userVO.setCity(req.getParameter("city"));
        userVO.setDocType(req.getParameter("loginUserDTO.id_type_code"));
        userVO.setDocNum(req.getParameter("textfield6"));
        userVO.setBirthday(req.getParameter("textfield7"));
        userVO.setPersonType(req.getParameter("passenger_type"));
        userVO.setRemarks(req.getParameter("textarea"));
        //userVO.setLoginIP(getIpAddr(req));

        return userVO;
    }
/*
    private String validate(UserVO userVO) {
        if (userVO.getName().length() < 6 || userVO.getName().length() > 30) {
            return "登录名不能少于6位或多于30位！";
        } else if (!userVO.getName().matches("^\\w+$")) {
            return "登录名需由字母、数字或“_”组成！";
        } else if (userVO.getRealName().length() == 0 || userVO.getRealName() == null) {
            return "真实姓名不能为空！";
        } else if (userVO.getProvince().equals("省份")) {
            return "省份不能为空！";
        } else if (userVO.getCity().equals("城市")) {
            return "城市不能为空！";
        } else if (userVO.getDocNum().length() == 0 || userVO.getDocNum() == null) {
            return "证件号码不能为空！";
        } else if (userVO.getBirthday().length() == 0 || userVO.getBirthday() == null) {
            return "出生日期不能为空！";
        } else {
            return null;
        }
    }
    */
/*
    private String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }
    */
    private void doInfoEdit(HttpServletRequest request,UserVO user) {
    	
    	String power=request.getParameter("select");
		
		int po=Integer.parseInt(power);
		user.setPower(po);
		
	}
    
    private void doManageTrain(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("arrayListTrain");
        session.removeAttribute("arrayListAllTrain");
        session.removeAttribute("conditionTrain");

        if (!"changePageTrain".equals(req.getParameter("action"))) {
            trainQueryVO = readParameterByManageTrain(req);
        } else if ("changePageTrain".equals(req.getParameter("action"))) {
            if (IsNullUtil.isNull(trainQueryVO.getType())) {
                trainQueryVO.setType("");
            }
            if (IsNullUtil.isNull(trainQueryVO.getDestination())) {
                trainQueryVO.setDestination("");
            }
            if (IsNullUtil.isNull(trainQueryVO.getOrigin())) {
                trainQueryVO.setOrigin("");
            }
            if (IsNullUtil.isNull(trainQueryVO.getNumber())) {
                trainQueryVO.setNumber("");
            }
        }

        String numPrePage = req.getParameter("select2");
        String numPrePageFromJS = req.getParameter("numPrePage");
        String pageNum = req.getParameter("pageNum");
        int maxPage;

        if (pageNum == null) {
            pageNum = "1";
        }

        if (numPrePage == null) {
            numPrePage = numPrePageFromJS;
        }

        ArrayList<TrainVO>arrayList = queryTrain();
        ArrayList<TrainVO>arrayListTrain = new ArrayList<>();

        if (arrayList.size() % Integer.parseInt(numPrePage) == 0) {
            maxPage = arrayList.size() / Integer.parseInt(numPrePage);
        } else {
            maxPage = arrayList.size() / Integer.parseInt(numPrePage) + 1;
        }
        for (int i = (Integer.parseInt(pageNum) - 1) * Integer.parseInt(numPrePage); i < arrayList.size() && i < Integer.parseInt(pageNum) * Integer.parseInt(numPrePage); ++i) {
            arrayListTrain.add(arrayList.get(i));
        }

        session.setAttribute("conditionTrain", trainQueryVO);
        session.setAttribute("arrayListAllTrain", arrayList);
        session.setAttribute("arrayListTrain", arrayListTrain);
        session.setAttribute("everyPageTrain", numPrePage);
        session.setAttribute("maxPageTrain", maxPage);
        session.setAttribute("curPageTrain", pageNum);
        resp.sendRedirect("Admin/TrainManageQuery.jsp");
    }

    private void doDeleteTrain(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        String[] values = req.getParameterValues("checkbox");
        HttpSession session = req.getSession();
        session.removeAttribute("arrayListTrain");
        session.removeAttribute("conditionTrain");

        if (trainQueryVO != null && values != null) {
            ArrayList<TrainVO> arrayList = queryTrain();
            for (String va : values) {
                trainMgrService.removeTrain(arrayList.get(Integer.parseInt(va)).getType(), arrayList.get(Integer.parseInt(va)).getNumber());
            }

            String numPrePage = req.getParameter("select2");
            String pageNum = req.getParameter("pageNum");

            if (pageNum == null) {
                pageNum = "1";
            }

            arrayList = queryTrain();
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

            session.setAttribute("conditionTrain", trainQueryVO);
            session.setAttribute("arrayListTrain", arrayList1);
            session.setAttribute("everyPageTrain", numPrePage);
            session.setAttribute("maxPageTrain", maxPage);
            session.setAttribute("curPageTrain", pageNum);
        }
        resp.sendRedirect("Admin/TrainManageQuery.jsp");
    }

    /*
    private void doAddTrain(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
    	TrainVO trainVO = new TrainVO();
    	TrainService trainService = TrainServiceImpl.getInstance();
    	trainVO.setType(req.getParameter("select"));
        trainVO.setNumber(req.getParameter("textfield2"));
        int num = Integer.parseInt(req.getParameter("stationNum"));
        for(int i=0;i<num;i++){
	    	trainVO.setStation(req.getParameter("station"));
	    	trainVO.setDate(req.getParameter("starttime"));
	    	trainVO.setTime(req.getParameter("endtime"));
	    	trainVO.setPrice(req.getParameter("price"));
    	
        }
        if (trainService.saveTrain(trainVO)) {
            // resp.sendRedirect("Admin/UserManageQuery.jsp?action=logon");
             resp.sendRedirect("Admin/TrainInfo_Add.jsp");
             //req.getRequestDispatcher("Admin/Index.html").forward(req, arg1);
         } else {
             resp.sendRedirect("Admin/TrainInfo_Add.jsp");
         }
    }
    */
    private void doAddTrain(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        String type = req.getParameter("select");
        String trainNum = req.getParameter("textfield2");

        String[] stations = req.getParameterValues("station");
        String[] dates = req.getParameterValues("date");
        String[] time = req.getParameterValues("clock");
        String[] price = req.getParameterValues("price");

        HttpSession session = req.getSession();

        session.removeAttribute("validateAddTrain");
        session.removeAttribute("existAddTrain");
        session.removeAttribute("showNumAddTrain");
        session.removeAttribute("typeAddTrain");
        session.removeAttribute("trainNumAddTrain");

        if (IsNullUtil.isNull(type) || IsNullUtil.isNull(trainNum) || IsNullUtil.isNull(stations) ||IsNullUtil.isNull(dates) ||IsNullUtil.isNull(time) ||IsNullUtil.isNull(price)) {
            resp.sendRedirect("Admin/TrainInfo_Add.jsp");
        } else {
            String vali = validateTrainInfo(stations, price);
            if (vali != null) {
                session.setAttribute("validateAddTrain", vali);
                resp.sendRedirect("Admin/TrainInfo_Add.jsp");
            } else {
                TrainVO trainVO = new TrainVO();
                String theStation = "";
                String thePrice = "";
                String theTime = "";
                String theDate = "";

                for (String a : stations) {
                    theStation += a + " ";
                }
                for (String a : price) {
                    thePrice += a + " ";
                }
                for (String a : time) {
                    theTime += a + " ";
                }
                for (String a : dates) {
                    theDate += a + " ";
                }

                trainVO.setStation(theStation.trim());
                trainVO.setTime(theTime.trim());
                trainVO.setDate(theDate.trim());
                trainVO.setPrice(thePrice.trim());
                trainVO.setType(type);
                trainVO.setNumber(trainNum);
                if (trainMgrService.saveTrain(trainVO)) {
                    session.setAttribute("existAddTrain", "车次添加成功！");
                } else {
                    session.setAttribute("existAddTrain", "车次添加失败！");
                }
                resp.sendRedirect("Admin/TrainInfo_Add.jsp");
            }
        }
    }

    private String validateTrainInfo(final String[] stations, final String[] price) {
        for (String station : stations) {
            if (station.length() >= EnumType.TRAIN_STATION_MAX_LENGTH) {
                return "经停站名称过长！";
            } else if (IsNullUtil.isNull(station)) {
                return "经停站名称不能为空！";
            }
        }

        for (String singlePrice : price) {
            if (!singlePrice.matches("^\\d+$") || singlePrice.length() > EnumType.TRAIN_PRICE_MAX_LENGTH) {
                return "价格必须为不超过四位数的非负整数！";
            }
        }
        return null;
    }
    private void doShowTrainSchedule(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        String bb = req.getParameter("ssid");
        ArrayList<TrainVO> arrayList = queryTrain();
        TrainVO trainVO = arrayList.get(Integer.parseInt(bb));
        HttpSession session = req.getSession();

        session.removeAttribute("Train");
        session.setAttribute("Train", trainVO);
        resp.sendRedirect("Admin/trainSchedule.jsp");
    }

    private void doEditTrain(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("validateEditTrain");
        session.removeAttribute("existEditTrain");
        String type = ((TrainVO) session.getAttribute("Train")).getType();
        String trainNum = ((TrainVO) session.getAttribute("Train")).getNumber();

        String[] stations = req.getParameterValues("station");
        String[] dates = req.getParameterValues("date");
        String[] time = req.getParameterValues("clock");
        String[] price = req.getParameterValues("price");

        String vali = validateTrainInfo(stations, price);

        if (vali != null) {
            session.setAttribute("validateEditTrain", vali);
            resp.sendRedirect("Admin/TrainInfo_Edit.jsp");
        } else {
            TrainVO trainVO = new TrainVO();
            String theStation = "";
            String thePrice = "";
            String theTime = "";
            String theDate = "";

            for (String a : stations) {
                theStation += a + " ";
            }
            for (String a : price) {
                thePrice += a + " ";
            }
            for (String a : time) {
                theTime += a + " ";
            }
            for (String a : dates) {
                theDate += a + " ";
            }

            trainVO.setStation(theStation.trim());
            trainVO.setTime(theTime.trim());
            trainVO.setDate(theDate.trim());
            trainVO.setPrice(thePrice.trim());
            trainVO.setType(type);
            trainVO.setNumber(trainNum);
            if (trainMgrService.updateTrain(trainVO)) {
                session.setAttribute("Train", trainVO);
                session.setAttribute("existEditTrain", "车次修改成功！");
            } else {
                session.setAttribute("existEditTrain", "车次修改失败！");
            }
            resp.sendRedirect("Admin/TrainInfo_Edit.jsp");
        }
    }

    private void doInEditTrain(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        String bb = req.getParameter("ssid");
        ArrayList<TrainVO> arrayList = queryTrain();
        TrainVO trainVO = arrayList.get(Integer.parseInt(bb));
        HttpSession session = req.getSession();
        session.removeAttribute("validateEditTrain");
        session.removeAttribute("existEditTrain");
        session.setAttribute("Train", trainVO);
        resp.sendRedirect("Admin/TrainInfo_Edit.jsp");
    }

    private void doInAddTrainPage(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("validateAddTrain");
        session.removeAttribute("existAddTrain");

        resp.sendRedirect("Admin/TrainInfo_Add.jsp");
    }

    private void doShowField(final HttpServletRequest req, final HttpServletResponse resp) throws IOException {
        String stationNum = req.getParameter("stationNum");
        String type = req.getParameter("select");
        String trainNum = req.getParameter("textfield2");
        String vali = validateAddTrain(trainNum, stationNum);
        HttpSession session = req.getSession();

        session.removeAttribute("validateAddTrain");
        session.removeAttribute("existAddTrain");
        session.removeAttribute("showNumAddTrain");
        session.removeAttribute("typeAddTrain");
        session.removeAttribute("trainNumAddTrain");

        if (vali != null) {
            session.setAttribute("validateAddTrain", vali);
        } else if (trainMgrService.getTrainByNumber(trainNum).getNumber() != null) {
            session.setAttribute("existAddTrain", "该车次已存在！");
        } else {
            if (!IsNullUtil.isNull(stationNum)) {
                session.setAttribute("showNumAddTrain", stationNum);
                session.setAttribute("typeAddTrain", type);
                session.setAttribute("trainNumAddTrain", trainNum);
            }
        }
        resp.sendRedirect("Admin/TrainInfo_Add.jsp");
    }
    private String validateAddTrain(final String trainNum, final String stationNum) {
        if (IsNullUtil.isNull(trainNum) || trainNum.length() != 4) {
            return "车辆编号必须为4位数！";
        } else if (IsNullUtil.isNull(stationNum) || !stationNum.matches("^[0-9]*[1-9][0-9]*$")) {
            return "经停站数量必须为数字！";
        } else if (Integer.parseInt(stationNum) >= 100) {
            return "经停站数量不能多于100！";
        }else {
            return null;
        }
    }

    
}
    
