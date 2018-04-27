package user.service;

import userdao.TrainDaoImpl;
import user.domin.TrainVO;

import java.util.ArrayList;

/**
 * Created by Hasee on 2017-07-10.
 */
public class TrainServiceImpl implements TrainService{
    private static TrainService trainService = new TrainServiceImpl();
    public static TrainService getInstance() {
        return trainService;
    }

    private TrainServiceImpl() {
    }

    public boolean updateTrain(TrainVO trainVO) {
        try {
            TrainDaoImpl trainDao = new TrainDaoImpl();
            return trainDao.updateTrain(trainVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<TrainVO> getTrainByUser(final String type, final String date, final String origin, final String destination) {
        try {
            TrainDaoImpl trainDao = new TrainDaoImpl();
            return trainDao.getTrainByUser(type, date, origin, destination);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean saveTrain(TrainVO trainVO) {
        try {
            TrainDaoImpl trainDao = new TrainDaoImpl();
            return trainDao.saveTrain(trainVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeTrain(final String type, final String num) {
        try {
            TrainDaoImpl trainDao = new TrainDaoImpl();
            return trainDao.removeTrain(type, num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public TrainVO getTrainByNumber(final String number) {
        try {
            TrainDaoImpl trainDao = new TrainDaoImpl();
            return trainDao.getTrainByNumber(number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<TrainVO> getTrainByAdmin(final String type, final String number, final String origin, final String destination) {
        try {
            TrainDaoImpl trainDao = new TrainDaoImpl();
            return trainDao.getTrainByAdmin(type, number, origin, destination);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
