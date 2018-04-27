package userdao;

import user.domin.OrderQueryVO;
import user.domin.OrderVO;
import user.domin.UserVO;

import java.util.ArrayList;

/**
 * Created by Hasee on 2017-07-12.
 */
public interface OrderDao {
    int countOrder();
    boolean saveOrder(final OrderVO orderVO);
    boolean updateOrder(final OrderVO orderVO);
    ArrayList<OrderVO> getOrderByInfo(final OrderQueryVO orderQueryVO);
    ArrayList<OrderVO> getOrderByUser(final UserVO userVO);
}
