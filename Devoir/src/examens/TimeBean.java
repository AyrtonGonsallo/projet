package examens;
import java.util.*;
public class TimeBean {
private int hours;
private int minutes;
public TimeBean() {
Calendar now = Calendar.getInstance();
this.hours = now.get(Calendar.HOUR_OF_DAY);
this.minutes = now.get(Calendar.MINUTE);
System.out.println("crée");
}
public int getHours() {
return hours;
}
public int getMinutes() {
return minutes;
}}