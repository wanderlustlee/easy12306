package user.service;

import java.sql.Connection;
import java.util.ArrayList;

import user.domin.UserVO;
import user.util.DbUtil;
import userdao.UserDaoImpl;
public class UserServiceImpl implements UserService {
    public static UserService userService = new UserServiceImpl();
    public static UserService getInstance() {
        return userService;
    }

    private UserServiceImpl() {

    }

    public boolean saveUser(UserVO userVO) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.saveUser(userVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return false;
    }

    public boolean removeUser(String name) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.removeUser(name);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return false;
    }

    public boolean updateUser(UserVO userVO) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.updateUser(userVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return false;
    }
    public boolean updatePassword(UserVO userVO) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.updatePassword(userVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return false;
    }
    public UserVO getUserByName(String name) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.getUserByName(name);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return null;
    }
    public UserVO getUserByRealName(String realName) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.getUserByRealName(realName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return null;
    }

    public UserVO getUserByDocNum(String docNum) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.getUserByDocNum(docNum);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return null;
    }
    public ArrayList<UserVO> getUserByAdmin(String name, String sex, String docType, String docNum, String personType) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.getUserByAdmin(name, sex, docType, docNum, personType);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return null;
    }

    public int login(String name, String password) {
        Connection conn = null;

        try {
            conn = DbUtil.getConnection();
            UserDaoImpl userDao = new UserDaoImpl(conn);
            return userDao.login(name, password);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
        }
        return 0;
    }
}
