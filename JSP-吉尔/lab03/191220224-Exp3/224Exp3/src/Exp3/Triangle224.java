package Exp3;

import java.util.Arrays;

public class Triangle224 {

    private double edgeA;
    private double edgeB;
    private double edgeC;

    public Triangle224() {
    }

    public Triangle224(double edgeA, double edgeB, double edgeC) {
        this.edgeA = edgeA;
        this.edgeB = edgeB;
        this.edgeC = edgeC;
    }

    public String getTriangle() {
        double[] edge = new double[]{edgeA, edgeB, edgeC};
        Arrays.sort(edge);
        return (edge[0] + edge[1] > edge[2]) ? "是" : "否";
    }

    public double getArea() {
        double p = edgeA + edgeB + edgeC;
        double s = p * (p - 2 * edgeA) * (p - 2 * edgeB) * (p - 2 * edgeC);
        return Math.sqrt(s) / 4;
    }

    public double getPerimeter() {
        return edgeA + edgeB + edgeC;
    }

    public double getEdgeA() {
        return edgeA;
    }

    public void setEdgeA(double edgeA) {
        this.edgeA = edgeA;
    }

    public double getEdgeB() {
        return edgeB;
    }

    public void setEdgeB(double edgeB) {
        this.edgeB = edgeB;
    }

    public double getEdgeC() {
        return edgeC;
    }

    public void setEdgeC(double edgeC) {
        this.edgeC = edgeC;
    }
}
