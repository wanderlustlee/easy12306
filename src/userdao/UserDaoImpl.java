package userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import java.util.ArrayList;

import user.domin.UserVO;
import user.util.DbUtil;
public class UserDaoImpl {
    public static Connection conn;

    public UserDaoImpl(Connection conn) { }

    public boolean saveUser(UserVO userVO) {
        boolean flag = true;
        conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        try {
            String sql = "insert into TRAIN_USER values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, userVO.getName());
            pst.setString(2, userVO.getPassword());
            pst.setString(3, userVO.getRealName());
            pst.setString(4, userVO.getSex());
            pst.setString(5, userVO.getProvince());
            pst.setString(6, userVO.getCity());
            pst.setString(7, userVO.getDocType());
            pst.setString(8, userVO.getDocNum());
            pst.setString(9, userVO.getBirthday());
            pst.setString(10, userVO.getPersonType());
            pst.setString(11, userVO.getRemarks());
            pst.setInt(12, userVO.getPower());
            
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("预增加出错！");
            e.printStackTrace();
            flag = false;
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null, pst);
        }
        return flag;
    }

    public boolean removeUser(String name) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;

        try {
            String sql = "delete from TRAIN_USER where rtrim(NAME) = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, name);
            int a = pst.executeUpdate();
            if (a == 0) {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("删除失败！");
            e.printStackTrace();
            flag = false;
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null, pst );
        }
        return flag;
    }

    public boolean updateUser(UserVO userVO) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;

        try {
            String sql = "update TRAIN_USER set NAME = ?, PASSWORD = ?, REALNAME = ?, SEX = ?, PROVINCE = ?, CITY = ?, DOCTYPE = ?, DOCNUM = ?, BIRTHDAY = ?, PERSONTYPE = ?, REMARKS = ? ,POWER = ? where rtrim(NAME) = ?";
            pst = conn.prepareStatement(sql);

            pst.setString(1, userVO.getName());
            pst.setString(2, userVO.getPassword());
            pst.setString(3, userVO.getRealName());
            pst.setString(4, userVO.getSex());
            pst.setString(5, userVO.getProvince());
            pst.setString(6, userVO.getCity());
            pst.setString(7, userVO.getDocType());
            pst.setString(8, userVO.getDocNum());
            pst.setString(9, userVO.getBirthday());
            pst.setString(10, userVO.getPersonType());
            pst.setString(11, userVO.getRemarks());
            pst.setInt(12, userVO.getPower());
            pst.setString(13, userVO.getName());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("预更改出错！");
            e.printStackTrace();
            flag = false;
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null, pst);
        }
        return flag;
    }
    public boolean updatePassword(UserVO userVO) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;

        try {
            String sql = "update TRAIN_USER set PASSWORD = ? where rtrim(NAME) = ?";
            pst = conn.prepareStatement(sql);

            
            pst.setString(1, userVO.getPassword());
            pst.setString(2, userVO.getName());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("预更改出错！");
            e.printStackTrace();
            flag = false;
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null, pst);
        }
        return flag;
    }


    public UserVO getUserByName(String name) {
        conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        UserVO userVO = new UserVO();

        try {
            String sql = "select * from TRAIN_USER where rtrim(NAME) = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, name);

            resultSet = pst.executeQuery();
            while (resultSet.next()) {
                userVO.setName(resultSet.getString(1));
                userVO.setPassword(resultSet.getString(2));
                userVO.setRealName(resultSet.getString(3));
                userVO.setSex(resultSet.getString(4));
                userVO.setProvince(resultSet.getString(5));
                userVO.setCity(resultSet.getString(6));
                userVO.setDocType(resultSet.getString(7));
                userVO.setDocNum(resultSet.getString(8));
                userVO.setBirthday(resultSet.getString(9));
                userVO.setPersonType(resultSet.getString(10));
                userVO.setRemarks(resultSet.getString(11));
                userVO.setPower(resultSet.getInt(12));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(resultSet, pst);
        }
        return userVO;
    }
    public UserVO getUserByRealName(String realName) {
        conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        UserVO userVO = new UserVO();

        try {
            String sql = "select * from TRAIN_USER where rtrim(REALNAME) = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, realName);

            resultSet = pst.executeQuery();
            while (resultSet.next()) {
            	userVO.setName(resultSet.getString(1));
                userVO.setPassword(resultSet.getString(2));
                userVO.setRealName(resultSet.getString(3));
                userVO.setSex(resultSet.getString(4));
                userVO.setProvince(resultSet.getString(5));
                userVO.setCity(resultSet.getString(6));
                userVO.setDocType(resultSet.getString(7));
                userVO.setDocNum(resultSet.getString(8));
                userVO.setBirthday(resultSet.getString(9));
                userVO.setPersonType(resultSet.getString(10));
                userVO.setRemarks(resultSet.getString(11));
                userVO.setPower(resultSet.getInt(12));
                //userVO.setLoginIP(resultSet.getString(14));
               // userVO.setImagePath(resultSet.getString(15));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(resultSet, pst);
        }
        return userVO;
    }

    public UserVO getUserByDocNum(String docNum) {
        conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        UserVO userVO = new UserVO();

        try {
            String sql = "select * from TRAIN_USER where rtrim(DOCNUM) = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, docNum);

            resultSet = pst.executeQuery();
            while (resultSet.next()) {
            	userVO.setName(resultSet.getString(1));
                userVO.setPassword(resultSet.getString(2));
                userVO.setRealName(resultSet.getString(3));
                userVO.setSex(resultSet.getString(4));
                userVO.setProvince(resultSet.getString(5));
                userVO.setCity(resultSet.getString(6));
                userVO.setDocType(resultSet.getString(7));
                userVO.setDocNum(resultSet.getString(8));
                userVO.setBirthday(resultSet.getString(9));
                userVO.setPersonType(resultSet.getString(10));
                userVO.setRemarks(resultSet.getString(11));
                userVO.setPower(resultSet.getInt(12));
                //userVO.setLoginIP(resultSet.getString(14));
                //userVO.setImagePath(resultSet.getString(15));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(resultSet, pst);
        }
        return userVO;
    }
    public ArrayList<UserVO> getUserByAdmin(String name, String sex, String docType, String docNum, String personType) {
        conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        ResultSet resultSet = null;

        ArrayList<UserVO> arrayList = new ArrayList<>();

        try {
            StringBuffer sql = new StringBuffer("select * from TRAIN_USER where rtrim(NAME) LIKE '");
            sql.append(name).append("%' AND rtrim(SEX) like '").append(sex).append("%' AND rtrim(DOCTYPE) like '").append(docType).append("%' AND rtrim(DOCNUM) LIKE '").append(docNum).append("%' AND rtrim(PERSONTYPE) LIKE '").append(personType).append("%'");
            pst = conn.prepareStatement(sql.toString());
            resultSet = pst.executeQuery();

            while (resultSet.next()) {
                UserVO userVO = new UserVO();
                userVO.setName(resultSet.getString(1));
                userVO.setPassword(resultSet.getString(2));
                userVO.setRealName(resultSet.getString(3));
                userVO.setSex(resultSet.getString(4));
                userVO.setProvince(resultSet.getString(5));
                userVO.setCity(resultSet.getString(6));
                userVO.setDocType(resultSet.getString(7));
                userVO.setDocNum(resultSet.getString(8));
                userVO.setBirthday(resultSet.getString(9));
                userVO.setPersonType(resultSet.getString(10));
                userVO.setRemarks(resultSet.getString(11));
                userVO.setPower(resultSet.getInt(12));
                //userVO.setLoginIP(resultSet.getString(14));
               // userVO.setImagePath(resultSet.getString(15));
                arrayList.add(userVO);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(resultSet, pst);
        }
        return arrayList;
    }
    
    public int login(String name, String password) {
        UserVO userVO = getUserByName(name);
        if (userVO.getPassword() == null) {
            return 0;
        }
        if (userVO.getPassword().equals(password)) {
            return userVO.getPower();
        }
        return 0;
    }

}
