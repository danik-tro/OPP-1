generic
   n: Integer;

package Data is
   --- Declaration of private types
   type Vector is private;
   type Matrix is private;
   
   -- Read Vector
   procedure Vector_Input(A: out Vector);
   
   -- Write Vector on screen
   procedure Vector_Output(A: in Vector);
   
   -- Read Matrix
   procedure Matrix_Input(A: out Matrix);
   
   -- Write Matrix on screen
   procedure Matrix_Output(A: in Matrix);
   
   -- Calculation functions
   function Func1 (A, B, C: in Vector; MA, ME: in Matrix) return Integer;
   function Func2 (MH, MK, ML: in Matrix) return Matrix;
   function Func3 (V : in out Vector; MP, MR : in Matrix) return Vector;
   
   -- Filling matrix with ones
   procedure Matrix_Filling_Ones(A: out Matrix);
   
   -- Filling vector with ones
   procedure Vector_Filling_Ones(A: out Vector);
   
   
   procedure Matrix_Filling_Number(A: out Matrix; i,j, number:Integer);
   
   procedure Vector_Fillig_Number(A: out Vector; i, number:Integer);
   
   -- Determination private types
   private
     type Vector is array(1..n) of Integer;
     type Matrix is array(1..n) of Vector;
   
   

end Data;
