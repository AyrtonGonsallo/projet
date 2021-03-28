package com;
import java.text.NumberFormat;
import java.text.DecimalFormat;
public class F2C {
public static double f2c(int f) {
return ((f - 32) * 5) / 9.0;
}
public static int parse(String s) {
return Integer.parseInt(s);
}
public static void main(String[] args) {
System.out.println("Fahrenheit Celsius");
NumberFormat fmt = new DecimalFormat("##0.000");
for (int f = 32; f <= 212; f += 20) {
String cs = fmt.format(f2c(f));
System.out.println(f + " " + cs);
} }}