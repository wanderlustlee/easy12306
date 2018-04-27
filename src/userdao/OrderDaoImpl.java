package userdao;

import user.domin.OrderQueryVO;
import user.domin.OrderVO;
import user.domin.UserVO;
import user.util.DbUtil;
import user.util.IsNullUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Hasee on 2017-07-12.
 */
public class OrderDaoImpl implements OrderDao {
    public OrderDaoImpl() {
    }

    public boolean updateOrder(final OrderVO orderVO) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;

        try {
            String sql = "update PRO_ORDER set STATUS = ? where rtrim(USERNAME) = ? AND rtrim(TRAIN) = ?";
            pst = conn.prepareStatement(sql);

            int i = 0;
            pst.setInt(++i, orderVO.getStatus());
            pst.setString(++i, orderVO.getUsername());
            pst.setString(++i, orderVO.getTrain());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("预更改出错！");
            e.printStackTrace();
            flag = false;
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null,pst);
        }
        return flag;
    }

    public boolean saveOrder(final OrderVO orderVO) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        try {
            int i = 0;
            String sql = "insert into PRO_ORDER values (?, ?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setInt(++i, countOrder() + 1);
            pst.setString(++i, orderVO.getUsername());
            pst.setString(++i, orderVO.getTrain());
            pst.setString(++i, orderVO.getStartTime());
            pst.setString(++i, orderVO.getOrigin());
            pst.setString(++i, orderVO.getDestination());
            pst.setInt(++i, orderVO.getStatus());
            pst.setFloat(++i, orderVO.getPrice());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("预增加出错！");
            e.printStackTrace();
            flag = false;
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null,pst);
        }
        return flag;
    }

    public int countOrder() {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();
        int count = 0;

        try {
            String sql = "select MAX(ID) from PRO_ORDER";
            pst = conn.prepareStatement(sql);

            resultSet = pst.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeResultSet(resultSet);
            DbUtil.closeStatement(null,pst);
        }
        return count;
    }

    public ArrayList<OrderVO> getOrderByInfo(final OrderQueryVO orderQueryVO) {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();

        ArrayList<OrderVO> arrayList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM PRO_ORDER where USERNAME LIKE ? AND TRAIN LIKE ? AND ORIGIN LIKE ? AND DESTINATION LIKE ? AND STATUS LIKE ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, orderQueryVO.getUsername());
            pst.setString(2, orderQueryVO.getTrain() + "%");
            pst.setString(3, orderQueryVO.getOrigin() + "%");
            pst.setString(4, orderQueryVO.getDestination() + "%");
            pst.setString(5, orderQueryVO.getStatus() == 0 ? "%" : String.valueOf(orderQueryVO.getStatus()));
            resultSet = pst.executeQuery();

            while (resultSet.next()) {
                OrderVO orderVO = new OrderVO();
                orderVO.setDestination(resultSet.getString("DESTINATION"));
                orderVO.setOrigin(resultSet.getString("ORIGIN"));
                orderVO.setPrice(resultSet.getFloat("PRICE"));
                orderVO.setStatus(resultSet.getInt("STATUS"));
                orderVO.setTrain(resultSet.getString("TRAIN"));
                orderVO.setUsername(resultSet.getString("USERNAME"));
                if (resultSet.getString("STARTTIME").split(" ")[0].equals(orderQueryVO.getDate())) {
                    orderVO.setStartTime(resultSet.getString("STARTTIME"));
                    arrayList.add(orderVO);
                } else if (IsNullUtil.isNull(orderQueryVO.getDate())) {
                    orderVO.setStartTime(resultSet.getString("STARTTIME"));
                    arrayList.add(orderVO);
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeResultSet(resultSet);
            DbUtil.closeStatement(null,pst);
        }
        return arrayList;
    }

    public ArrayList<OrderVO> getOrderByUser(final UserVO userVO) {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();

        ArrayList<OrderVO> arrayList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM PRO_ORDER where USERNAME LIKE ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, userVO.getName());
            resultSet = pst.executeQuery();

            while (resultSet.next()) {
                OrderVO orderVO1 = new OrderVO();
                orderVO1.setDestination(resultSet.getString("DESTINATION"));
                orderVO1.setOrigin(resultSet.getString("ORIGIN"));
                orderVO1.setPrice(resultSet.getFloat("PRICE"));
                orderVO1.setStartTime(resultSet.getString("STARTTIME"));
                orderVO1.setStatus(resultSet.getInt("STATUS"));
                orderVO1.setTrain(resultSet.getString("TRAIN"));
                orderVO1.setUsername(resultSet.getString("USERNAME"));
                arrayList.add(orderVO1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeResultSet(resultSet);
            DbUtil.closeStatement(null,pst);
        }
        return arrayList;
    }
}
