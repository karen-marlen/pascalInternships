{
	Realize un algoritmo que calcule el salario a cobrar de un empleado el cual se conoce
  * 
  * Nombre, Apellido, CI, sueldo base
  * 
  * Sabiendo que se le descontara un 10% de seguro social obligatorio
  * 
  * 
  * Un 5% de ley politica habitacional  
  * 
  * y tendra bonificaciones de 200mil de Bono de alimentacion 
  * 
  * y una prima de 25% de sueldo base por cada hijo 
  * 
  * y las horas extras un valor de 250mil por cada hijo 
   
   
}

program untitled;
uses crt;

const

BONO = 200; {Bono alimenticio}
BONO2 = 250; {bono por hora}

var 

nombre: string; 
apellido: string; 
hijos: integer;  {numero de hijos}
cedula:integer; 

sueldoB: integer; 
horasE: real; 

BonoH: real; {Bono por Hijo }

{ descuento del sueldo base}
descuento: real; 

bonoHora: real; 

total: real; 


BEGIN

	{Entrada}
	writeln('Nombre');
	readln(nombre); 
	
	writeln('Apellido');
	readln(apellido);
	
	writeln('Ci');
	readln(cedula); 
	
	writeln('Sueldo Base');
	readln(sueldoB); 
	
	writeln('Horas Extras');
	readln(horasE);
	
	writeln('Numero de Hijos');
	readln(hijos);  
	
	{ Procesos ------------------ }
	
	
	{- 10% a sueldo base por motivo de seguro social}
	
	descuento:= sueldoB * 0.15 ; 
						{porcentaje de 10% y 5%}
						
						
	{bono de 25 del sueldo por cada hijo}
	
	bonoH :=  (sueldoB * 0.25) * hijos; 
						
	{Horas extra por hijo}
	
	bonoHora := (BONO2 * hijos) * horasE; 
	
	
	{resultado del sueldo}
	
	
	total := sueldoB - descuento + bonoH + bonoHora + BONo;  			
		
		
		
	{Mostrar por pantalla}
	
	writeln(' Nombre: ',nombre);
	writeln(' Apellido: ',apellido);
	writeln(' Cedula: ',cedula);
	writeln(' Numero de Hijos: ',hijos);
	writeln(' Sueldo Base: ',sueldoB);
	
	writeln(' Bono de alimentacion: ',BONO);
	
	
	writeln(' El sueldo total es: ',  total:0:1 , '$');
	
	
END.
