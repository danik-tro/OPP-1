--------------Package Data, body---------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is 
   
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
   
   
   
   -- Calculation functions
   function Func1 (A, B, C, D: in Vector; MA, ME: in Matrix) return Integer is
      e : Integer;
      S : Vector;
   begin
      S := Vector_Sum(C, Vector_Matrix_Multiplication(D,
                      Matrix_Multiplication(MA, ME)));
      
      return Vector_Multiplication(Vector_Sum(A, B), S);
   end Func1;
   
   
   
   function Func2 (MG, MH, MK, ML: in Matrix) return Matrix is 
      MF : Matrix;
      MT : Matrix;
   begin
      MT := Sum_Matrix(MG, Matrix_Transposition(Matrix_Multiplication(MH, MK)));
      MF := Sub_Matrix(MT, Matrix_Transposition(ML));
      Matrix_Sorting(MF);
      
      return MF;
   end Func2;
   
      
   function Func3 (O, P, V : out Vector; MR, MS : in Matrix) return Vector is
      S, L : Vector;
      MK : Matrix;
   begin
      L := Vector_Sum(Vector_Sum(O, P), V);
      MK := Matrix_Multiplication(MR, MS);
      S := Vector_Matrix_Multiplication(L, MK);
      
      return S;
   end Func3; 
 end Data;
