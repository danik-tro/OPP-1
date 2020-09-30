package com.company;

public class Matrix {
    Matrix(int n) {
        matrix = new Vector[n];
        length = n;
        for (int i = 0; i < n; ++i) {
            matrix[i] = new Vector(n);
        }
    }

    public void ReadMatrix(String name) {
        System.out.println("Input matrix " + name);
        for (int i = 0; i < length; ++i) {
            matrix[i].ReadVector("Vector " + i);
        }
    }

    public void Print(String name) {
        System.out.println("----- Matrix " + name + " = ");
        for (int i = 0; i < length; ++i) {
            System.out.print("----- ");
            for (int j = 0; j < length; ++j) {
                System.out.print(matrix[i].GetItem(j) + " ");
            }
            System.out.print(" -----");
            System.out.println();
        }
    }

    public Matrix MultiplicationMatrices(Matrix m) {
        int[][] matrices = new int[length][length];
        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                matrices[i][j] = 0;
            }
        }

        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                for (int p = 0; p < length; ++p) {
                    matrices[i][j] += matrix[i].GetItem(j) * m.GetItem(p, j);
                }
            }
        }
        Matrix result = new Matrix(length);

        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                result.SetItem(i, j, matrices[i][j]);
            }
        }

        return result;
    }

    public Matrix MatrixMultiplicationOnConstant(int key) {
        Matrix result = new Matrix(length);
        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                result.SetItem(i, j, matrix[i].GetItem(j) * key);
            }
        }
        return result;
    }

    public int MaxOnMatrix() {
        int max = matrix[0].GetItem(0);
        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                if (matrix[i].GetItem(j) > max) {
                    max = matrix[i].GetItem(j);
                }
            }
        }
        return max;
    }

    public int MinOnMatrix() {
        int min = matrix[0].GetItem(0);
        for (int i = 0; i < length; ++i) {
            for (int j = 0; j < length; ++j) {
                if (matrix[i].GetItem(j) < min) {
                    min = matrix[i].GetItem(j);
                }
            }
        }
        return min;
    }


    public void SetItem(int i, int j, int key) {
        matrix[i].SetItem(j, key);
    }

    public int GetItem(int i, int j) {
        return matrix[i].GetItem(j);
    }

    private Vector[] matrix;
    private int length;
}
