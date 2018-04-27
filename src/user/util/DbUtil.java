package user.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import user.servlet.RegServlet;
public class DbUtil {
    private final static String DRIVER = "oracle.jdbc.OracleDriver";
    private final static String URL = "jdbd:oracle:thin:@localhost:1521:xe";
    private final static String NAME = "hr";
    private final static String PASSWORD = "123456";

    public DbUtil() {
        // TODO Auto-generated constructor stub
    }

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, NAME, PASSWORD);
            return conn;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            System.out.println("数据库驱动不存在！");
            System.out.println(e.getMessage());
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("数据库连接不成功");
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static void closeConnection(Connection coon) {
        try {
            coon.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void closeStatement(ResultSet resultSet, Statement statement) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void closeResultSet(final ResultSet resultSet) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
