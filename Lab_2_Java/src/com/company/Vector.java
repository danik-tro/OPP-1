package com.company;

import java.util.Scanner;

public class Vector {

    public void FillVectorZero() {
        for (int i = 0; i < length; ++i) {
            vector[i] = 0;
        }
    }

    public void SetItem(int i, int key) {
        vector[i] = key;
    }

    Vector (int n) {
        vector = new int[n];
        length = n;

        for (int i = 0; i < length; ++i) {
                vector[i] = 1;
        }
    }

    public void Print(String name) {
        System.out.print( "----- " + name + " = ");

        for (int i = 0; i < length; ++i) {
            System.out.print(vector[i] + " ");
        }
        System.out.println("-----");
    }

    Vector(int[] n, int length_) {
        length = length_;
        vector = new int[length_];
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

    public void ReadVector(String name) {
        System.out.print("Input " + name + " : ");

        Scanner in = new Scanner(System.in);
        for (int i = 0; i < length; ++i) {
            vector[i] = in.nextInt();
        }
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
        int[] mas_res = new int[length];
        for (int i=0; i < length; ++i) {
            mas_res[i] = 0;
        }

        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                mas_res[i] += vector[j] * m.GetItem(i,j);
            }
        }


        return new Vector(mas_res, length);
    }

    public Vector VectorMultiplicationConstant(int k) {
        Vector res = new Vector(length);
        for (int i = 0; i < length; ++i) {
            res.SetItem(i, res.GetItem(i)*k);
        }

        return res;
    }

    private int[] vector;
    private int length;
}
