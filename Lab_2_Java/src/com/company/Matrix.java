package com.company;

public class Matrix {
    Matrix(int n) {
        matrix = new Vector[n];
        for (int i = 0; i < n; ++i) {
            matrix[i] = new Vector(n);
        }
    }

    public int GetItem(int i, int j) {
        return matrix[i].GetItem(j);
    }

    private Vector[] matrix;
}
