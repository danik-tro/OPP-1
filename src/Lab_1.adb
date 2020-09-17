----------------Main programm------------------------
--Parallel programming basics.
--Labwork 1. Ada. Subprograms and packages
--Trotsenko Daniil
--IV-82
--17.09.2020
--Func1: d = (A*((B+C)*(MA*ME)))
--Func2: MF = MIN(MH)*MK*ML
--Func3: O = MAX(MP*MR)*V
-----------------------------------------------------


with Data, Ada.Integer_Text_IO, Ada.Text_IO, System.Multiprocessors;
use  Ada.Integer_Text_IO, Ada.Text_IO, System.Multiprocessors;

procedure Lab_1 is
n : Integer := 4;
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
         A, B, C: Vector;
         MA, ME : Matrix;
         d : Integer;
      begin
         Put_Line("task T1 started");
         Vector_Filling_Ones(A);
         Vector_Filling_Ones(B);
         Vector_Filling_Ones(C);

         Matrix_Filling_Ones(MA);
         Matrix_Filling_Ones(ME);

         d := Func1(A, B, C, MA, ME);
         delay(2.0);

         if n < 7 then
            Put_Line("--Func1: d = (A*((B+C)*(MA*ME)))--");
            Put("F1 : d = ");
            Put(d);
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
         MF, MH, MK, ML : Matrix;
      begin
         Put_Line("task T2 started");
         Matrix_Filling_Ones(MH);
         Matrix_Filling_Ones(MK);
         Matrix_Filling_Ones(ML);

         MF := Func2(MH,MK, ML);
         delay(4.0);

         if n < 7 then
            Put_Line("--Func2: MF = MIN(MH)*MK*ML--");
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
         V, O : Vector;
         MR, MP : Matrix;
      begin
         Put_Line("task T3 started");
         New_Line;

         Vector_Filling_Ones(V);

         Matrix_Filling_Ones(MR);
         Matrix_Filling_Ones(MP);

         O := Func3(V, MR, MP);
         delay(5.0);

         if n < 7 then
            Put_Line("--Func3: O = MAX(MP*MR)*V--");
            Put_Line("F3 : O = ");
            Vector_Output(O);

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
