package Exp4;

import java.util.List;

public class DataList224 {
    List<Double> list;

    public DataList224(List<Double> list) {
        this.list = list;
    }


    public double getAVG() {
        return getSum() / list.size();
    }

    public double getSD() {
        double x = getAVG();
        double sum = 0;
        for (Double data : list) {
            sum += (data - x) * (data - x);
        }
        return sum / list.size();
    }

    public double getMSD() {
        return Math.sqrt(getSD());
    }

    public double getSum() {
        double sum = 0;
        for (Double data : list) {
            sum += data;
        }
        return sum;
    }

    public List<Double> getList() {
        return list;
    }

    public void setList(List<Double> list) {
        this.list = list;
    }
}
