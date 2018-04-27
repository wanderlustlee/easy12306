package userdao;

import user.domin.TrainVO;
import user.domin.UserVO;
import user.util.DbUtil;
import user.util.IsNullUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Hasee on 2017-07-10.
 */
public class TrainDaoImpl implements TrainDao{
    public TrainDaoImpl(){
    }

    public ArrayList<TrainVO> getTrainByUser(final String type, final String date, final String origin, final String destination) {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();

        ArrayList<TrainVO> arrayList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM PRO_TRAIN where TYPE LIKE ? AND STATION LIKE ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, type + "%");
            pst.setString(2, "%" + origin + "%" + destination + "%");
            resultSet = pst.executeQuery();

            while (resultSet.next()) {
                TrainVO trainVO = new TrainVO();
                trainVO.setType(resultSet.getString("TYPE"));
                trainVO.setNumber(resultSet.getString("NUM"));
                trainVO.setPrice(resultSet.getString("PRICE"));
                trainVO.setTime(resultSet.getString("CLOCK"));
                trainVO.setDate(resultSet.getString("DATE"));
                trainVO.setStation(resultSet.getString("STATION"));
                String[] stations = trainVO.getStation().split(" ");
                String[] dates = trainVO.getDate().split(" ");

                if (!IsNullUtil.isNull(date)) {
                    for (int i = 0; i < stations.length; ++i) {
                        if (stations[i].equals(origin) && dates[i].equals(date)) {
                          arrayList.add(trainVO);
                          break;
                        } else if (IsNullUtil.isNull(origin) && dates[i].equals(date)) {
                          arrayList.add(trainVO);
                          break;
                        }
                    }
                } else {
                    arrayList.add(trainVO);
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

    public ArrayList<TrainVO> getTrainByAdmin(final String type, final String number, final String origin, final String destination) {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();

        ArrayList<TrainVO> arrayList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM PRO_TRAIN where TYPE LIKE ? AND NUM LIKE ? AND STATION LIKE ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, type + "%");
            pst.setString(2, number + "%");
            pst.setString(3, origin + "%" + destination);
            resultSet = pst.executeQuery();

            while (resultSet.next()) {
                TrainVO trainVO = new TrainVO();
                trainVO.setType(resultSet.getString("TYPE"));
                trainVO.setNumber(resultSet.getString("NUM"));
                trainVO.setPrice(resultSet.getString("PRICE"));
                trainVO.setTime(resultSet.getString("CLOCK"));
                trainVO.setDate(resultSet.getString("DATE"));
                trainVO.setStation(resultSet.getString("STATION"));
                arrayList.add(trainVO);
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

    public boolean updateTrain(TrainVO trainVO) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;

        try {
            String sql = "update PRO_TRAIN set PRICE = ?, CLOCK = ?, STATION = ?, \"DATE\" = ? where rtrim(NUM) = ?";
            pst = conn.prepareStatement(sql);

            int i = 0;
            pst.setString(++i, trainVO.getPrice());
            pst.setString(++i, trainVO.getTime());
            pst.setString(++i, trainVO.getStation());
            pst.setString(++i, trainVO.getDate());
            pst.setString(++i, trainVO.getNumber());
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

    public boolean saveTrain(final TrainVO trainVO) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;
        try {
            int i = 0;
            String sql = "insert into PRO_TRAIN values (?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setInt(++i, countTrain() + 1);
            pst.setString(++i, trainVO.getType());
            pst.setString(++i, trainVO.getNumber());
            pst.setString(++i, trainVO.getPrice());
            pst.setString(++i, trainVO.getTime());
            pst.setString(++i, trainVO.getStation());
            pst.setString(++i, trainVO.getDate());
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

    public int countTrain() {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();
        int count = 0;

        try {
            String sql = "select MAX(ID) from PRO_TRAIN";
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

    public TrainVO getTrainByNumber(final String number) {
        PreparedStatement pst = null;
        ResultSet resultSet = null;
        Connection conn = DbUtil.getConnection();
        TrainVO trainVO = new TrainVO();

        try {
            String sql = "select * from PRO_TRAIN where rtrim(NUM) = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, number);

            resultSet = pst.executeQuery();
            while (resultSet.next()) {
                trainVO.setNumber(resultSet.getString("NUM"));
                trainVO.setType(resultSet.getString("TYPE"));
                trainVO.setPrice(resultSet.getString("PRICE"));
                trainVO.setDate(resultSet.getString("DATE"));
                trainVO.setTime(resultSet.getString("CLOCK"));
                trainVO.setStation(resultSet.getString("STATION"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeConnection(conn);
            DbUtil.closeStatement(null,pst);
            DbUtil.closeResultSet(resultSet);
        }
        return trainVO;
    }

    public boolean removeTrain(final String type, final String num) {
        boolean flag = true;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pst = null;

        try {
            String sql = "delete from PRO_TRAIN where TYPE = ? AND NUM = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, type);
            pst.setString(2, num);
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
            DbUtil.closeStatement(null,pst);
        }
        return flag;
    }
}
