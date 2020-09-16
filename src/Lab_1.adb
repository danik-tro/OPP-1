----------------Main programm------------------------
--Parallel and distributed computing.
--Labwork 1. Ada. Subprograms and packages
--Trotsenko Daniil
--IV-82
--17.09.2020
--Func1: e = ((A+B)*(C+D*(MA*ME)))
--Func2: F = SORT(MG + TRANS(MH * MK) - TRANS(ML))
--Func3: S = (O + P + V) * (MR * MS)
-----------------------------------------------------


with Data, Ada.Integer_Text_IO, Ada.Text_IO, System.Multiprocessors;
use  Ada.Integer_Text_IO, Ada.Text_IO, System.Multiprocessors;

procedure Lab_1 is
n : Integer := 3;
package data1 is new data(n);
use data1;

procedure tasks is

      --Task T1--
      task T1 is
         pragma Priority(1);
         pragma Storage_Size(100000);
         pragma CPU(1);
      end;

      task body T1 is
         A, B, C, D: Vector;
         MA, ME : Matrix;
         e : Integer;
      begin
         Put_Line("task T1 started");
         Vector_Filling_Ones(A);
         Vector_Filling_Ones(B);
         Vector_Filling_Ones(C);
         Vector_Filling_Ones(D);

         Matrix_Filling_Ones(MA);
         Matrix_Filling_Ones(ME);

         e := Func1(A, B, C, D, MA, ME);
         delay(2.0);

         if n < 7 then
            Put_Line("--Func1: e = ((A+B)*(C+D*(MA*ME)))--");
            Put("F1 : e = ");
            Put(e);
            New_Line;
            New_Line;
         end if;

         Put_Line("task T1 finished");
         New_Line;

      end T1;


      --Task T2--
      task T2 is
         pragma Priority(3);
         pragma Storage_Size(100000);
         pragma CPU(2);
      end;

      task body T2 is
         MF, MG, MH, MK, ML : Matrix;
      begin
         Put_Line("task T2 started");
         Matrix_Filling_Ones(MG);
         Matrix_Filling_Ones(MH);
         Matrix_Filling_Ones(MK);
         Matrix_Filling_Ones(ML);

         MF := Func2(MG, MH, MK, ML);
         delay(4.0);

         if n < 7 then
            Put_Line("--Func2: F = SORT(MG + TRANS(MH * MK) - TRANS(ML))--");
            Put_Line("F2 : MF = ");
            Matrix_Output(MF);

            New_Line;
            New_Line;
         end if;

         Put_Line("task T2 finished");
         New_Line;
      end T2;

      task T3 is
         pragma Priority(10);
         pragma Storage_Size(100000);
         pragma CPU(3);
      end;

      task body T3 is
         O, P, V, S : Vector;
         MR, MS : Matrix;
      begin
         Put_Line("task T3 started");
         New_Line;

         Vector_Filling_Ones(O);
         Vector_Filling_Ones(P);
         Vector_Filling_Ones(V);

         Matrix_Filling_Ones(MR);
         Matrix_Filling_Ones(MS);

         S := Func3(O, P, V, MR, MS);
         delay(5.0);

         if n < 7 then
            Put_Line("--Func3: S = (O + P + V) * (MR * MS)--");
            Put_Line("F3 : S = ");
            Vector_Output(S);

            New_Line;
            New_Line;
         end if;

         Put_Line("task T3 finished");
         New_Line;
      end T3;

begin
      null;
end tasks;

begin
   tasks;
end Lab_1;
