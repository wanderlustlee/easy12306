package user.domin;

/**
 * Created by Hasee on 2017-07-12.
 */
public class OrderQueryVO {
    private String train;
    private String date;
    private String origin;
    private String destination;
    private int status;
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTrain() {
        return train;
    }

    public void setTrain(final String train) {
        this.train = train;
    }

    public String getDate() {
        return date;
    }

    public void setDate(final String date) {
        this.date = date;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(final String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(final String destination) {
        this.destination = destination;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(final int status) {
        this.status = status;
    }
}
