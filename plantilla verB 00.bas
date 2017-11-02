dim as integer matrix(200,200), n, nn, m, mm, i, j, aux
'Genera layout
input "Ingrese tamaño: ", n
m=n : nn=n*2+2 : mm=n*2+2
'1=columna, 2=pared, 3=cuarto
for i=1 to n+1
   for j=1 to mm-1 step 2
      matrix(2*i-1,j)=1 : matrix(2*i-1,j+1)=2
      if i<n+1 then matrix(2*i,j)=2   : matrix(2*i,j+1)=3
   next j
   matrix(2*i-1,mm)=0  : matrix(2*i,mm)=0
next i

'imprime layout
for i=1 to nn-1
   for j=1 to mm-1
      if matrix(i,j)=1 then 
         print "+";
      elseif matrix(i,j)=3 then
         print " ";
      elseif matrix(i,j)=2 and i mod 2=0 then
         print "|";
      else
         print "~";
      end if
      'print 'matrix(i,j);
   next j
   print
next i
