package user.domin;

/**
 * Created by Hasee on 2017-07-09.
 */
public class TrainVO {
    private String type;
    private String number;
    private String price;
    private String date;
    private String time;
    private String station;

    public String getDate() {
        return date;
    }

    public void setDate(final String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(final String number) {
        this.number = number;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(final String price) {
        this.price = price;
    }

    public String getTime() {
        return time;
    }

    public void setTime(final String time) {
        this.time = time;
    }

    public String getStation() {
        return station;
    }

    public void setStation(final String station) {
        this.station = station;
    }
}
