package user.service;

import userdao.OrderDaoImpl;
import user.domin.OrderQueryVO;
import user.domin.OrderVO;
import user.domin.UserVO;

import java.util.ArrayList;

/**
 * Created by Hasee on 2017-07-12.
 */
public class OrderServiceImpl implements OrderService {
    private static OrderService orderService = new OrderServiceImpl();
    public static OrderService getInstance() {
        return orderService;
    }

    private OrderServiceImpl() {
    }

    public boolean updateOrder(final OrderVO orderVO) {
        try {
            OrderDaoImpl orderDao = new OrderDaoImpl();
            return orderDao.updateOrder(orderVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean saveOrder(final OrderVO orderVO) {
        try {
            OrderDaoImpl orderDao = new OrderDaoImpl();
            return orderDao.saveOrder(orderVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<OrderVO> getOrderByInfo(final OrderQueryVO orderQueryVO) {
        try {
            OrderDaoImpl orderDao = new OrderDaoImpl();
            return orderDao.getOrderByInfo(orderQueryVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<OrderVO> getOrderByUser(final UserVO userVO) {
        try {
            OrderDaoImpl orderDao = new OrderDaoImpl();
            return orderDao.getOrderByUser(userVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
