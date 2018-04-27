package user.util;
import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Map;
/**
 * Created by Hasee on 2017-07-08.
 */
public final class IsNullUtil {
    private IsNullUtil() {
    }
    public static boolean isNull(final Object obj) {
        if (obj == null) {
            return true;
        }
        if (obj instanceof String && obj.toString().trim().length() == 0) {
            return true;
        }
        if (obj.getClass().isArray() && Array.getLength(obj) == 0) {
            return true;
        }
        if (obj instanceof Collection && ((Collection) obj).isEmpty()) {
            return true;
        }
        if (obj instanceof Map && ((Map) obj).isEmpty()) {
            return true;
        }
        return false;
    }
}
