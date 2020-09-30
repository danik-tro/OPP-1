package com.company;

import java.util.Scanner;

public class Vector {

    public void FillVectorZero() {
        for (int i = 0; i < length; ++i) {
            vector[i] = 0;
        }
    }

    Vector (int n) {
        vector = new int[n];
        length = n;

        for (int i = 0; i < length; ++i) {
                vector[i] = 1;
        }
    }

    Vector(int[] n, int length_) {
        length = length_;
        for (int i = 0; i < length; ++i) {
            vector[i] = n[i];
        }
    }

    public int Length() {
        return length;
    }

    public int GetItem(int i) {
        return vector[i];
    }

    public void ReadVector() {
        Scanner in = new Scanner(System.in);
        for (int i = 0; i < length; ++i) {
            vector[i] = in.nextInt();
        }
        in.close();
    }

    public Vector SumVectors(Vector x) {
        for (int i = 0; i < length; ++i) {
            vector[i] += x.GetItem(i);
        }

        return new Vector(vector, length);
    }

    public int MultiplicationVectors (Vector x) {
        int result = 0;

        for (int i = 0; i < length; ++i) {
            result += vector[i] * x.GetItem(i);
        }
        return result;
    }

    public Vector MultiplicationVectorMatrix (Matrix m) {
        Vector vec_res = new Vector(length);



        return new Vector(5);
    }

    private int[] vector;
    private int length;
}
