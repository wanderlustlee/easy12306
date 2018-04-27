package user.service;
import java.util.ArrayList;

import user.domin.UserVO;
public interface UserService {
    boolean saveUser(UserVO userVO);
    boolean removeUser(String name);
    boolean updateUser(UserVO userVO);
    boolean updatePassword(UserVO userVO);
    UserVO getUserByName(String name);
    public UserVO getUserByDocNum(String docNum);
    public UserVO getUserByRealName(String realName);
    ArrayList<UserVO> getUserByAdmin(String name, String sex, String docType, String docNum, String personType);
    int login(String name, String password);
}
