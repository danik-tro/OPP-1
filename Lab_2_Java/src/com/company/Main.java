/*
----------------Main programm------------------------
     --Parallel programming basics.
     --Labwork 2. Threads in Java
     --Trotsenko Daniil
     --IV-82
     --17.09.2020
     --Func1: d = (A*((B+C)*(MA*ME)))
     --Func2: MF = MIN(MH)*MK*ML
     --Func3: O = MAX(MP*MR)*V
-----------------------------------------------------
*/

package com.company;


import java.util.Scanner;
import java.util.concurrent.Semaphore;

class T1 extends Thread {

    private Semaphore semaphore;
    private boolean mechanical;
    private int d;

    private int n = 4;

    private Vector A = new Vector(n), B = new Vector(n), C = new Vector(n);
    private Matrix MA = new Matrix(n), ME = new Matrix(n);

    //--Func1: d = (A*((B+C)*(MA*ME)))--
    T1 (String name, Semaphore sem, boolean mechanical_) {
        super(name);
        semaphore = sem;
        mechanical = mechanical_;
    }

    public void run() {
        System.out.printf("%s started...", Thread.currentThread().getName());
        System.out.println();
        System.out.println();

        try {
            Thread.sleep(5);

            if (mechanical) {
                semaphore.acquire(1);

                Scanner in = new Scanner(System.in);
                System.out.print("Input N for T1 = ");
                n = in.nextInt();

                A = new Vector(n); B = new Vector(n); C = new Vector(n);
                MA = new Matrix(n); ME = new Matrix(n);



                A.ReadVector("A");
                B.ReadVector("B");
                C.ReadVector("C");

                MA.ReadMatrix("MA");
                ME.ReadMatrix("ME");

            }


            d = A.MultiplicationVectors(B.SumVectors(C).MultiplicationVectorMatrix(MA.MultiplicationMatrices(ME)));



            Thread.sleep(100);

            System.out.println();
            System.out.println("----- Func1: d = (A*((B+C)*(MA*ME))) -----");
            System.out.println("----- d = " + d + " -----");
            System.out.println();
            semaphore.release();
        } catch (InterruptedException e) {
            System.out.printf("Thread has been interrupted");
        }
        System.out.printf("%s finished...", Thread.currentThread().getName());
        System.out.println();
        System.out.println();
    }
}


class T2 extends Thread {

    private int n = 4;
    private Semaphore semaphore;
    private boolean mechanical;
    private Matrix MF, MH = new Matrix(n), MK = new Matrix(n), ML = new Matrix(n);

    T2 (String name, Semaphore sem, boolean mechanical_) {
        super(name);
        semaphore = sem;
        mechanical = mechanical_;
    }

    // --Func2: MF = MIN(MH)*MK*ML--
    public void run() {
        System.out.printf("%s started...", Thread.currentThread().getName());
        System.out.println();
        System.out.println();

        try {

            Thread.sleep(5);

            if (mechanical) {
                semaphore.acquire(1);

                Scanner in = new Scanner(System.in);
                System.out.print("Input N for T2 = ");
                n = in.nextInt();

                MH = new Matrix(n); MK = new Matrix(n); ML = new Matrix(n);


                MH.ReadMatrix("MH");
                MK.ReadMatrix("MK");
                ML.ReadMatrix("ML");


            }



            MF = MK.MultiplicationMatrices(ML).MatrixMultiplicationOnConstant(MH.MinOnMatrix());


            Thread.sleep(800);

            System.out.println("-----Func2: MF = MIN(MH)*MK*ML-----");
            MF.Print("MF");

            semaphore.release();
        } catch (InterruptedException e) {
            System.out.printf("Thread has been interrupted");
        }

        System.out.printf("%s finished...", Thread.currentThread().getName());
        System.out.println();
        System.out.println();
    }
}

class T3 extends Thread {
    private int n = 4;

    private Vector O, V = new Vector(n);
    private Matrix MP = new Matrix(n), MR = new Matrix(n);
    private Semaphore semaphore;
    private boolean mechanical;

    T3 (String name, Semaphore sem, boolean mechanical_) {
        super(name);
        semaphore = sem;
        mechanical = mechanical_;
    }


    // --Func3: O = MAX(MP*MR)*V--
    public void run() {
        System.out.printf("%s started...", Thread.currentThread().getName());
        System.out.println();
        System.out.println();

        try {
            Thread.sleep(5);

            if (mechanical) {
                semaphore.acquire(1);

                Scanner in = new Scanner(System.in);
                System.out.print("Input N for T3 = ");
                n = in.nextInt();

                V = new Vector(n);
                MP = new Matrix(n); MR = new Matrix(n);



                V.ReadVector("V");


                MP.ReadMatrix("MP");
                MR.ReadMatrix("MR");

            }


            O = V.VectorMultiplicationConstant(MP.MultiplicationMatrices(MR).MaxOnMatrix());
            Thread.sleep(1200);
            System.out.println("-----Func3: O = MAX(MP*MR)*V-----");
            O.Print("O");

            semaphore.release();
        } catch (InterruptedException e) {
            System.out.printf("Thread has been interrupted");
        }
        System.out.printf("%s finished...", Thread.currentThread().getName());
        System.out.println();
        System.out.println();
    }
}



public class Main {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Mechanical input? 1/0: ");
        boolean mechanical = false;
        int q = in.nextInt();
        if (q == 1) {
            mechanical = true;
            System.out.println("OK");
        }

        System.out.println("Main thread started...");

        Semaphore sem = new Semaphore(1);

        T1 t1 = new T1("T1", sem, mechanical);
        T2 t2 = new T2("T2", sem, mechanical);
        T3 t3 = new T3("T3", sem, mechanical);

        t1.setPriority(1);
        t2.setPriority(3);
        t3.setPriority(4);

        t1.start();
        t2.start();
        t3.start();

        try {
            t1.join();
            t2.join();
            t3.join();
        } catch(InterruptedException e) {
            System.out.printf("%s has been interrupted", Thread.currentThread().getName());
        }
        System.out.println("Main thread finished...");
        in.close();
    }
}
