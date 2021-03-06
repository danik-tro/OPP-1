--------------Package Data, body---------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is 
   
   
   
   --Max in Matrix
   function Matrix_Max(A: in Matrix) return Integer is
      Max_m : Integer := -10000;
   begin
      for i in 1..n loop
         for j in 1..n loop
            if A(i)(j) > Max_m then 
               Max_m := A(i)(j);
            end if;
         end loop;
      end loop;
      return Max_m;
   end Matrix_Max;
      
   --Min in Matrix
   function Matrix_Min(A: in Matrix) return Integer is
      Min_m : Integer := 10000;
   begin
      for i in 1..n loop
         for j in 1..n loop
            if A(i)(j) < Min_m then 
               Min_m := A(i)(j);
            end if;
         end loop;
      end loop;
      return Min_m;
   end Matrix_Min;
   
   -- Read Vector
   procedure Vector_Input(A: out Vector) is 
   begin
      for i in 1..n loop
         Get(A(i));
      end loop;
   end Vector_Input;
     
   -- Write Vector on Screen
   procedure Vector_Output(A: in Vector) is
   begin
      for i in 1..n loop
         Put(A(i));
         Put(" ");
      end loop;
   end Vector_Output;
   
   -- Read Matrix
   procedure Matrix_Input(A: out Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            Get(A(i)(j));
         end loop;
      end loop;
   end Matrix_Input;
   
   -- Write Matrix on Screen
   procedure Matrix_Output(A: in Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            Put(A(i)(j));
            Put(" ");
         end loop;
         Put_Line(" ");
      end loop;
   end Matrix_Output;
   
   -- Multiplication of matrces
   
   function Matrix_Multiplication(A, B : in Matrix) return Matrix is
      P: Matrix;
      S: Integer;
   begin
      for k in 1..n loop
         for i in 1..n loop
            s := 0;
            for j in 1..n loop
               S := S + A(k)(j) * B(j)(i);
               P(k)(i) := s;
            end loop;
         end loop;
      end loop;
      return P;
   end Matrix_Multiplication;
   
   -- Multiplication of vector and Matrix
   function Vector_Matrix_Multiplication(A: in Vector; B: in Matrix) return Vector is
      P: Vector;
      s: Integer;
   begin
      for i in 1..n loop
         s := 0;
         for j in 1..n loop
            s := s + A(i)*B(j)(i);
         end loop;
         
         P(i) := s;
      end loop;
      return P;
   end Vector_Matrix_Multiplication;
   
   
   -- Sum of Vectors
   function Vector_Sum(A, B: in Vector) return Vector is
      S: Vector;
   begin
      for i in 1..n loop
         s(i) := A(i) + B(i);
      end loop;
      return s;
   end Vector_Sum;
   
   -- Multiplication of vectors
   function Vector_Multiplication(A, B: in Vector) return Integer is
      s: Integer;
   begin
      s := 0;
      for i in 1..n loop
         s := s + A(i) * B(i);
      end loop;
      return s;
   end Vector_Multiplication;
   
   
   
   -- Sorting of Vector
   procedure Vector_Sorting(A: in out Vector) is
      S: Integer;
   begin
      for i in 1..n loop
         for j in 1..n loop
            
            if A(i) > A(j) then 
               S := A(j);
               A(j) := A(i);
               A(i) := S;
            end if;
            
         end loop;
      end loop;
      
   end Vector_Sorting;
   
   -- Sorting Matrix
   procedure Matrix_Sorting(A: in out Matrix) is
   begin
      for i in 1..n loop
         Vector_Sorting(A(i));
      end loop;
   end Matrix_Sorting;
   
   
   --Sum Matrices
   function Sum_Matrix(A, B: in Matrix) return Matrix is
      C : Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            C(i)(j) := A(i)(j) + B(i)(j);
         end loop;
      end loop;
      return C;
   end Sum_Matrix;
   
   --Sub Matrices
   function Sub_Matrix(A, B: in Matrix) return Matrix is
      C : Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            C(i)(j) := A(i)(j) - B(i)(j);
         end loop;
      end loop;
      return C;
   end Sub_Matrix;
            
   
   -- Transposition of Matrix
   procedure Matrix_Transposition(A: in out Matrix) is 
      S: Integer;
   begin
      for i in 1..n loop
         for j in 1..n loop
            S := A(j)(i);
            A(j)(i) := A(i)(j);
            A(i)(j) := S;
            
         end loop;
      end loop;
   end Matrix_Transposition;
   
   -- Filling matrix with ones
   procedure Matrix_Filling_Ones(A: out Matrix) is 
   begin
      for i in 1..n loop
         for j in 1..n loop
            A(i)(j) := 1;
         end loop;
      end loop;
   end Matrix_Filling_Ones;
   
   -- Filling vector with ones
   procedure Vector_Filling_Ones(A: out Vector) is
   begin
      for i in 1..n loop
         A(i) := 1;
      end loop;
   end Vector_Filling_Ones;
   
   
   
   procedure Matrix_Filling_Number(A: out Matrix; i, j, number:Integer) is 
   begin
      A(i)(j) := number;
   end Matrix_Filling_Number;
   
   
   procedure Vector_Fillig_Number(A: out Vector; i, number: Integer) is 
   begin
      A(i) := number;
   end Vector_Fillig_Number;
   
   
   
   -- Calculation function 1
   function Func1 (A, B, C: in Vector; MA, ME: in Matrix) return Integer is
   begin
      return Vector_Multiplication(A,
                               Vector_Matrix_Multiplication(
                                   Vector_Sum(B, c),
                                   Matrix_Multiplication(MA, ME)
                                  ));
   end Func1;
   
   
   -- Constant Matrix multiplication
   procedure Constant_Matrix_Multiplication(a : Integer; B : in out Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            B(i)(j) := B(i)(j) * a;
         end loop;
      end loop;
   end Constant_Matrix_Multiplication;
   
   -- Constant Vector Multiplication
   procedure Constant_Vector_Multiplication(a : Integer; B : in out Vector) is
   begin
      for i in 1..n loop
         B(i) := B(i) * a;
      end loop;
   end Constant_Vector_Multiplication;
   
   --Calculate function 2
   function Func2 (MH, MK, ML: in Matrix) return Matrix is 
      MF : Matrix;
   begin
      MF := Matrix_Multiplication(MK, ML);
      Constant_Matrix_Multiplication(Matrix_Min(MH), MF);
      return MF;
   end Func2;
   
   -- Calculate function 3   
   function Func3 (V : in out Vector; MP, MR : in Matrix) return Vector is
   begin
      Constant_Vector_Multiplication(Matrix_Max(Matrix_Multiplication(MP, MR)), V);
      return V;
   end Func3; 
 end Data;
