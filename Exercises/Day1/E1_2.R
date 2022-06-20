Course 1 Course 2 Total
Grade 12 20 14 34
Grade 10 14 14 28
Grade 7 16 27 43
Grade 4 20 22 42
Grade 2 12 27 39
Grade 0 16 17 33
Grade -3 10 22 32
Total 108 143 251

#### a) Median of 251 achieved grades
x = rev(c(34,28,43,42,39,33,32))
251/2
cumsum(x)
# Median grade = 4

#### b) Quartiles and IQR
n = 251
# Q0 Minimum = -3
x[1]
# Q0.25 Lower = 00
n*0.25
# Q0.5 Median = 4
n*0.5
# Q0.75 Upper = 7
n*0.75
# Q1 Maximum = 12

# IQR
7 - 00