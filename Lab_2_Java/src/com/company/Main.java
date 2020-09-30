package com.company;
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


class JThread extends Thread {
    JThread (String name) {
        super(name);
    }

    public void run() {
        System.out.printf("%s started...", Thread.currentThread().getName());
        System.out.println();

        try {
            Thread.sleep(300);
            System.out.println("Thread1");
        } catch (InterruptedException e) {
            System.out.printf("Thread has been interrupted");
        }
        System.out.printf("%s finished...", Thread.currentThread().getName());
        System.out.println();
    }
}


class JThread2 extends Thread {
    JThread2 (String name) {
        super(name);
    }

    public void run() {
        System.out.printf("%s started...", Thread.currentThread().getName());
        System.out.println();

        try {
            Thread.sleep(500);
            System.out.println("Thread2");
        } catch (InterruptedException e) {
            System.out.printf("Thread has been interrupted");
        }
        System.out.printf("%s finished...", Thread.currentThread().getName());
        System.out.println();
    }
}

class JThread3 extends Thread {
    JThread3 (String name) {
        super(name);
    }

    public void run() {
        System.out.printf("%s started...", Thread.currentThread().getName());
        System.out.println();
        try {
            Thread.sleep(700);
            System.out.println("Thread3");
        } catch (InterruptedException e) {
            System.out.printf("Thread has been interrupted");
        }
        System.out.printf("%s finished...", Thread.currentThread().getName());
        System.out.println();
    }
}



public class Main {

    public static void main(String[] args) {
        System.out.println("Main thread started...");

        JThread t = new JThread("JThread1");
        JThread2 t2 = new JThread2("JThread2");
        JThread3 t3 = new JThread3("JThread3");
        t.start();
        t2.start();
        t3.start();

        try {
            t.join();
            t2.join();
            t3.join();
        } catch(InterruptedException e) {
            System.out.printf("%s has been interrupted", t.getName());
        }
        System.out.println("Main thread finished...");
    }
}
