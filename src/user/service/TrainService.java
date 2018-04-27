package user.service;

import user.domin.TrainVO;

import java.util.ArrayList;

/**
 * Created by Hasee on 2017-07-10.
 */
public interface TrainService {
    boolean saveTrain(TrainVO trainVO);
    boolean updateTrain(TrainVO trainVO);
    boolean removeTrain(String type, String num);
    TrainVO getTrainByNumber(String number);
    ArrayList<TrainVO> getTrainByAdmin(String type, String number, String origin, String destination);
    ArrayList<TrainVO> getTrainByUser(String type, String date, String origin, String destination);
}
