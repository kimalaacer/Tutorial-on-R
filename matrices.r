# matrices: every element has to be same 

A <- matrix(1:10, nrow=5)
A
A <- matrix(21:30, nrow=5)
A <- matrix(1:10, nrow=5)
B <- matrix(21:30, nrow=5)
B
C <- matrix(21:40, nrow=2)
C


A+B
A*B
A=B
A==B
A <- matrix(1:10, nrow=5)
B <- matrix(21:30, nrow=5)
A==B
# TRanspose of B will flip it like in excel column becomes row
t(B)
A%*%t(B) # matrix multiplication is cellA1*cellB1+CellA2*cellB2
