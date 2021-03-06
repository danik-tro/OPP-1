package com.company;


class MyThread extends Thread {
    MyThread(String name) {
        super(name);
    }
    public void run() {
        System.out.printf("%s started... \n", Thread.currentThread().getName());
        try{
            Thread.sleep(500);
        }
        catch(InterruptedException e){
            System.out.println("Thread has been interrupted");
        }
        System.out.printf("%s fiished... \n", Thread.currentThread().getName());
    }
}


public class Main {
    public static void main(String[] args) {
        System.out.println("Main thread started...");
        MyThread t = new MyThread("T1");
        t.start();

        try {
            t.join();
        } catch(InterruptedException e){

            System.out.printf("%s has been interrupted", t.getName());
        }
        System.out.println("Main thread finished...");
    }
}
