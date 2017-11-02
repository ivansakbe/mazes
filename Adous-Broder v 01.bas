declare sub imprime(s as integer)
dim shared as integer matrix(200,200), n, nn, m, mm, i, j, a1,a2,aux,band
randomize timer
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
'Adous-Broder
do
	a1=rnd*nn : a2=rnd*mm
loop while matrix(a1,a2)<>3
do
band=0
	' 3=no visitada 4=visitada
	matrix(a1,a2)=4
	do
		'elige movimiento 0=N 1=S 2=E 3=O
		aux=rnd*4
		'norte
		if aux=0 and matrix(a1+2,a2)=3 then matrix(a1+1,a2)=4 : matrix(a1+2,a2)=4 : a1=a1+2 end if
		'sur
		if aux=1 and matrix(a1-2,a2)=3 then matrix(a1-1,a2)=4 : matrix(a1-2,a2)=4 : a1=a1-2 end if 
		'este
		if aux=2 and matrix(a1,a2+2)=3 then matrix(a1,a2 + 1)=4 : matrix(a1,a2+2)=4 : a2=a2+2 end if
		'oeste
		if aux=3 and matrix(a1,a2-2)=3 then matrix(a1,a2-1)=4 : matrix(a1,a2-2)=4 : a2=a2-2 end if
		imprime(500)'Imprime por cada paso
	loop while matrix(a1+2,a2)=3 or matrix(a1-2,a2)=3 or matrix(a1,a2+2)=3 or matrix(a1,a2-2)=3
	for i=2 to nn-1 step 2
	   for j=2 to mm-1 
		  if matrix(i,j)=3 then band=band+1 endif
	   next j
	next i
	do
		a1=rnd*nn : a2=rnd*mm
	loop while matrix(a1,a2)<>4
loop while band<>0
imprime(-1) 'imprime resultado

sub imprime (s as integer)
	'Imprime layout pixels
	ScreenRes 500,500,32 : window(-1,-1)-(n+1,m+1)
	   windowtitle "   Maze"
	   line(-1,-1)-(n+1,m+1),&hFFFFFF,BF
	for i=1 to nn+2 
	   for j=1 to mm+2
		  if matrix(i,j)=2 and i mod 2=0 then line((i\2-.95),j\2)-(i\2,j\2),&h000000
		  if matrix(i,j)=2 and i mod 2=1 then line(i\2,j\2-.95)-(i\2,j\2),&h000000
	   next j
	   print
	next i
	sleep s
end sub
