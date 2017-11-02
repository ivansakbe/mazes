dim tamano as integer, i as integer, j as integer
input "ingrese tamaño:  ",tamano
tamano=(tamano*2)+1

dim plantilla(tamano,tamano) as integer
''columna=1 pared=2 cuarto=3
for i=1 to tamano
	for j=1 to tamano
		if not i mod 2 = 0 then 
			if not j mod 2 = 0 then
				plantilla(i,j)=1
			else
				plantilla(i,j)=2
			end if
		else
			if not j mod 2 = 0 then
				plantilla(i,j)=2
			else
				plantilla(i,j)=3
			end if
		end if
	next
next
''generacion de ascii
dim ascii(tamano,tamano) as string
for i=1 to tamano
	for j=1 to tamano
		if plantilla(i,j)=1 then ascii(i,j)="+" 		
		if not i mod 2 =0 and plantilla(i,j)=2 then ascii(i,j)="~"
		if i mod 2 =0 and plantilla(i,j)=2 then ascii(i,j)="|"
		if plantilla(i,j)=3 then ascii(i,j)=" "
	next
next
'' impresión de ascii
for i=1 to tamano
	for j=1 to tamano
		print ascii(i,j); 'plantilla(i,j);
	next
	print 
next
