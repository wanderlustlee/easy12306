package user.domin;

/**
 * Created by Hasee on 2017-07-09.
 */
public class TrainQueryVO {
    private String type;
    private String number;
    private String goOff;
    private String origin;
    private String destination;

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

    public String getGoOff() {
        return goOff;
    }

    public void setGoOff(final String goOff) {
        this.goOff = goOff;
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
}
