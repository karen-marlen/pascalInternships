
  
program ar;
	uses crt;

		type 

			ArrS= array [1..5] of string;
			ArrR= array [1..5] of real;
			ArrI= array [1..5] of integer;
	var 
		resp: integer;
		nombre,codigo: arrs;
		precio,total: arrr;
		cantidad: arri;

			function  MENU: integer; 
				begin

						clrscr();

							writeln();
							writeln(' Menu');
							writeln();                                
							writeln('1..Incluir');
							writeln('2..Listar Todo');
							writeln('3..Calcular');
							writeln('4..Consulta Por Codigo');
							writeln('5..Modificar');
							writeln('6..Listar Especifico');
							writeln('0..Salir');
						readln(menu);

				end;
				
			Procedure inlcuir(var nombre,codigo: arrs;var cantidad: arri; var precio,total: arrr);
				
					var
					i: integer;
							begin
								for i:=1 to 5 do
								begin
								clrscr();
								writeln('codigo del producto'); 
									readln(codigo[i]);
								writeln('nombre del producto'); 
									readln(nombre[i]);
								writeln('Cantidad del Producto'); 
									readln(cantidad[i]);
								writeln('Precio del Producto');
									readln(precio[i]);
								end;
							
							end;
					
					
					
			Procedure Listar(nombre,codigo: arrs;cantidad: arri;precio,total: arrr);
				
				var 
				i: integer;
				totales: real;
				
						begin
							clrscr();
								totales:=0;
								for i:=1 to  5 Do
									begin 
										writeln();
										writeln('Codigo: ',codigo[i]);
										writeln('producto: ',nombre[i]);
					
										writeln('Cantidad: ',cantidad[i]);
										writeln('Precio:',precio[i]:0:2);
							
										writeln('Total: ',total[i]:0:2);
										writeln(); 
										writeln();
										totales:=total[i]+totales;
									end;
								
								writeln('total a pagar: ',totales:0:2);
							readln();
						
						end; 
	
	
	
			procedure calcular (cantidad:arri; precio:arrr; var total: arrr);

					var 
					i: integer;
					
						begin
							
							for i:=1 to 5 Do
									begin
									total[i]:= cantidad[i]*precio[i];
									end;
							clrscr();
								writeln('listo');
							readln();

						end; 



				function buscador(c: string; codigo: arrs):integer;
				
				var i: integer;
					
					begin
						buscador:=0;
							
							for i:=1 to 5 do
										begin
										
											if c=codigo[i] then buscador:=i;
										
										end;
					end;
				


				procedure consultar(nombre,codigo: arrs;cantidad: arri; precio,total: arrr);
					var
						c: string;
						i: integer;
		
						begin
							clrscr();
								writeln('Ingresa el Codigo'); 
									readln(c);
							
									if buscador(c,codigo)<>0 then 
															begin 
																i:=buscador(c,codigo);
																		
																		writeln('Codigo: ',codigo[i]);
																		writeln('producto: ',nombre[i]);
					
																		writeln('Cantidad: ',cantidad[i]);
																		writeln('Precio:',precio[i]:0:2);
							
																		writeln('Total: ',total[i]:0:2);
															end
														else
															begin
															
																writeln('No existe');
																
															end;
							readkey();
						end;

			procedure modificar(var nombre,codigo: arrs; var cantidad: arri; var precio,total: arrr);
			
			var 
			c: string;
			i,r: integer;
		
						begin
							clrscr();
								writeln('Ingresa el Codigo'); 
									readln(c);
							clrscr();
									
									if buscador(c,codigo)<>0 then 
															begin 
																i:=buscador(c,codigo);
																	writeln('Codigo: ',codigo[i]);
																	writeln('producto: ',nombre[i]);
																	writeln('Cantidad: ',cantidad[i]);
																	writeln('Precio:',precio[i]:0:2);
							                                        writeln('Total: ',total[i]:0:2);
							                                        writeln();
																		writeln('1..nombre del Producto   ');
																		writeln('2..cantidad del Producto ');
																		writeln('3..Precio del Producto   ');
																		writeln('0..Salir ');
																		readln(r);
																clrscr();
																	writeln('escribe lo que vas a cambiar');
																		case r of 
																			1: readln(nombre[i]);
																			2: readln(cantidad[i]);  
																			3: readln(precio[i]); 
																		end;
												
															end
														else
															begin
																writeln(' No existe ');
																readkey();
															end;

							end;

	function  menu2: integer; 
		
				begin
				clrscr();
                               
							writeln('1..codigo');
							writeln('2..nombre');
							writeln('3..Cantidad');
							writeln('4..precio');
							writeln('5..total');
							writeln('0..Salir');
						readln(menu2);
				end;
	
	
	
	Procedure Listar2(nombre,codigo: arrs;cantidad: arri;precio,total: arrr);
				
			var
			i,resp: integer;
			
		begin	
			resp:=9;
				while not (resp=0) Do
							
							begin
								resp:=menu2;
									clrscr();
									case resp of
									
										1:	begin 
												writeln('Codigo');
											
												for i:= 1 to 5 Do
															begin
																writeln();
																writeln(codigo[i]);
															end;
											readln();
											end;
											 
										2: begin 
												writeln('Nombre de producto');

												for i:= 1 to 5 Do
															begin
															writeln(nombre[i]);
															end;
												readln();
											 end;
									
										3: begin 
												writeln('Cantidad');
							
												for i:= 1 to 5 Do
															begin
																writeln();
																writeln(cantidad[i]);
															end;
											readln();
											end;
											 
											 
										4: begin 
												writeln('precio');
												
												
												for i:= 1 to 5 Do
															begin
																writeln();
																writeln(precio[i]:0:2);
															end;
											 readln();
											 end;
											 
											 
										5: begin 
												writeln(' Total');
												
												
												for i:= 1 to 5 Do
															begin
																writeln();
																writeln(total[i]:0:0);
															end;
											   readln();
											   end;
									
								           end;
							
							 end;
				
				
		
		
	
			
			
end;

	{Programa}
	
		begin
			
			resp:=9;
			while not (resp=0) Do
				
					begin
					resp:=menu;
						case resp of
							1: inlcuir(nombre,codigo,cantidad,precio,total);
							2: Listar(nombre,codigo,cantidad,precio,total);  
							3: calcular(cantidad,precio,total);							
							4: consultar(nombre,codigo,cantidad,precio,total); 
							5: modificar(nombre,codigo,cantidad,precio,total); 
							6: Listar2(nombre,codigo,cantidad,precio,total); 
							0: resp:=0;
							
							
						end;
					
					end; 
				
		end.