{
	Proyecto Final de Clases 
	Calculos usando array estaticos 
	Estilo cajero 
	Practica de Pascal
}
program Tarea;
	uses crt;
	
	const 
		max= 10;
	
	
		type 
			num = 0..11;
			cadena= array [1..max] of string;
			precio= array [1..max] of real;
			entero= array [1..max] of word;
		
		
		var 
		nom,cod: cadena;
		pre,tot: precio;
		can: entero;
		 x: char;
		 k,k1: num;
		
			function  MENU: char; 
			
				var
				r: char;
				y: integer;
				begin
					y:=8;
					repeat begin
						clrscr();
						
							textcolor(white);
							
							gotoxy(18,y);writeln(' -->                     <--');
							textbackground(red);
							gotoxy(16,2);writeln('                                   ');
							gotoxy(16,3);writeln('        Bienvenido Al Menu!        ');
							gotoxy(16,4);writeln('                                   ');
							
						textbackground(blue);
							gotoxy(22,8); writeln('       Incluir       ');
							gotoxy(22,10);writeln('    Listar Todos     ');
							gotoxy(22,12);writeln('       Calcular      ');
							gotoxy(22,14);writeln(' Consulta Por Codigo ');
							gotoxy(22,16);writeln('      Modificar      ');
							gotoxy(22,18);writeln('  Listar Especifico  ');
							gotoxy(22,20);writeln('        Salir        ');
					textbackground(black);					
					gotoxy(1,25);r:=readkey();
										case r of
										#72: begin y:=y-2; if y<8 then y:=8 end;
										#80: begin y:=y+2; if y>20 then y:=20 end;
										end; {fin del case}
						
				end; 
				until r=#13; clrscr(); { fin del repeat}
				
					case y of
						
						8: menu:='1';
						10: menu:='2';
						12: menu:='3';
						14: menu:='4';
						16: menu:='5';
						18: menu:='6';
						20: menu:='0';
					end;
				
				end;
				
			Procedure Borra(var nom,cod: cadena; var pre,tot: precio; var can: entero; var k: num);
				var
				i:num;
						begin
						
							for i:= 1 to k Do
							
								begin
								cod[i]:='';
								nom[i]:='';
								pre[i]:=0;
								can[i]:=0;
								tot[i]:=0;
								
								end;
							k:=0;
						
						
						end;
	
			function  iguales(codigo: string; cod: cadena): boolean;
			
				var 
				i: integer;
						begin
								iguales:= false;
							for i:=1 to max Do
							
								begin
								
									if cod[i]=codigo then iguales:=true; 
								
								end;
					
				
						end;
			
			procedure incluir(var nom,cod: cadena; var pre,tot: precio; var can: entero; var k: num);
					var
						r: char;
						codigo: string;
							begin
							
								if k=max then 
								
											begin
											
												repeat 
													textbackground(11);
													gotoxy(16,5);writeln('                                     ');
													gotoxy(16,6);writeln(' Limite de Productos superados 10/10 ');
													gotoxy(16,7);writeln('                                     ');
													
													textbackground(5);
													gotoxy(16,10);writeln(' Presiona "ESC" para Liberar   ');
													gotoxy(16,11);writeln(' espacio o "ENTER" para Salir  ');
												
												
													textbackground(black);
													r:=readkey();
												until (r=#13) or (r=#27);
												
												if (r=#27) then Borra(nom,cod,pre,tot,can,k);
											
											end
											
										else 
											begin
												repeat 
													k:=k+1;
													clrscr();
													
														if k<5 then textbackground(11);
														if (k>4) and (k<8) then textbackground(yellow);
														if k>7 then textbackground(red);
														gotoxy(4,2);write('Espacio para Almacenar productos ',k,'/',max); 
															textbackground(black);
														
														
														repeat
															repeat
																gotoxy(4,5);write('Codigo del Producto:  #'); readln(codigo);
															until not (codigo='');
																codigo:='#'+codigo;
																
																if iguales(codigo,cod)= true then begin clrscr();  textbackground(red); gotoxy(4,2);writeln('Codigo ya Existente'); textbackground(black); end;
														until iguales(codigo,cod)= false;
														cod[k]:=codigo;
													
														repeat
															gotoxy(4,7);write('Nombre del Producto:  '); readln(nom[k]);
														until not (nom[k]='');
														
														repeat
															gotoxy(4,9);write('Cantidad del Producto:  '); {$I-}readln(can[k]);{$I+}
														until ioresult=0;
															
														repeat
															gotoxy(4,11);write('Precio del Producto:  ');{$I-} readln(pre[k]);{$I+}
														until ioresult=0;
													
													
															
															repeat 
																begin
																	clrscr();
																	textbackground(red);
																		gotoxy(16,4);writeln('   Agregar Otro Producto ?   ');
																		gotoxy(16,5);writeln('                             '); 
																		gotoxy(16,6);writeln(' Pulsa:    "ENTER" para SI   ');
																		gotoxy(16,7);writeln('             "ESC" para NO   ');
																	gotoxy(1,24);r:=readkey();
																	textbackground(black);
																end;
															until (r=#27) or (r=#13);
										
												until (r=#27) or (k=max);
							
											end;
							
							end;
					
					
					
			Procedure ListarT(nom,cod: cadena; pre,tot: precio; can: entero; k,k1: num);
				
				var 
				i: num;
				total: real;
						begin
						
						total:=0;
						clrscr();
							
							textbackground(5);
								gotoxy(4,4);write(' Codigo ');
							textbackground(red);
								gotoxy(13,4);write(' Producto ');
							textbackground(blue);
								gotoxy(24,4);write(' Cantidad ');
							textbackground(11);
								gotoxy(35,4);write('    Precio     ');
							textbackground(yellow);
								gotoxy(51,4);writeln('     Total     ');
							textbackground(black);
						
						
							if not (k=0) then 
							
							
												begin
												
													for i:=1 to K Do
													
														begin
														
															gotoxy(4,5+i);write(Cod[i]);
						
															gotoxy(13,5+i);write(nom[i]);
						
															gotoxy(27,5+i);write(Can[i]);
							
															gotoxy(35,5+i);write(Pre[i]:0:2,' Bsf');
							
															gotoxy(51,5+i);writeln(tot[i]:0:2,' Bsf');
																total:=total+tot[i];
														
														end;


													if k1 = 1 then 
																begin
																	textbackground(red);
																		gotoxy(16,20);writeln('Total a Pagar es de: ',total:0:2,' Bsf');
																	textbackground(black);
																	
																end;
																
								
												
												end;
						
						readkey();
						
						end; 
	
	
	
			procedure calcular (can:entero; pre:precio; var k1: num; k:num; var tot: precio);

					var 
					i: num;
					
						begin
							k1:=1;
								for i:=1 to k Do
									begin
									tot[i]:= can[i]*pre[i];
									end;
							clrscr();
								textbackground(5);
									gotoxy(16,7);writeln('                                     ');
									gotoxy(16,8);writeln(' El Total Fue Calculado Exitosamente ');
									gotoxy(16,9);writeln('                                     ');
								textbackground(black);
							readkey();

						end; 



				function buscador(aux: string; cod: cadena):word ;
				
				var i: num;
					
					begin
						buscador:=0;
						for i:=1 to max do
										begin
										
											if aux=cod[i] then buscador:=i;
										
										end;
					end;
				


				procedure consultar(nombres,codigo: cadena; precios,totales:precio; cantidad: entero);
					var
						aux: string;
						i: num;
		
						begin
							clrscr();
								textbackground(blue);
								gotoxy(4,7); write('                                              '); 
								gotoxy(4,6); write('                                              ');
								gotoxy(4,5); write('                                              ');
								gotoxy(4,6); write(' Ingresa el Codigo del Producto: #'); readln(aux);
								 
								textbackground(black);
							clrscr();
										aux:='#'+aux;

									if buscador(aux,cod)<>0 then 
															begin 
																i:=buscador(aux,cod);
																		textbackground(5);
																			gotoxy(4,4);write(' Codigo ');
																		textbackground(red);
																			gotoxy(13,4);write(' Producto ');
																		textbackground(blue);
																			gotoxy(24,4);write(' Cantidad ');
																		textbackground(11);
																			gotoxy(35,4);write('    Precio     ');
																		textbackground(yellow);
																			gotoxy(51,4);writeln('     Total     ');
																		textbackground(black);
																		gotoxy(4,6);write(Codigo[i]);
																		gotoxy(14,6);write(nombres[i]);
																		gotoxy(29,6);write(Cantidad[i]);
																		gotoxy(35,6);write(Precios[i]:0:2,' Bsf');
																		gotoxy(51,6);write(totales[i]:0:2); writeln(' bsf');
																		
															
															end
														else
															begin
																textbackground(5);
																	gotoxy(16,7);writeln('                          ');
																	gotoxy(16,8);writeln(' Producto No Registrado...');
																	gotoxy(16,9);writeln('                          ');
																textbackground(black);
															end;
							readkey();
						end;
	
			procedure Borra2(i: num; var nom,cod: cadena; var pre,tot: precio; var can: entero; var k,k1:num);
			
			var 
			c: num;
					begin
					
						for c:=i to k-1 DO
							begin
							
							cod[c]:=cod[c+1];
							nom[c]:=nom[c+1];
							can[c]:=can[c+1];
							pre[c]:=pre[c+1];
							tot[c]:=tot[c+1]
							end;
							
							cod[k]:='';
							nom[k]:='';
							can[k]:=0;
							pre[k]:=0;
							tot[k]:=0;
						
						k:=k-1;
						K1:=0;
					
					end;
	
			procedure modificar(var nom,cod: cadena; var pre,tot: precio; var can: entero);
			
			var 
			r: char;
			aux: string;
			i: num;
		
						begin
							clrscr();
								textbackground(blue);
								gotoxy(4,7); write('                                              '); 
								gotoxy(4,6); write('                                              ');
								gotoxy(4,5); write('                                              ');
								gotoxy(4,6); write(' Ingresa el Codigo del Producto: #'); readln(aux);
								 aux:='#'+aux;
								textbackground(black);
							clrscr();
									
									if buscador(aux,cod)<>0 then 
															begin 
																
																	repeat 
																		begin
																			i:=buscador(aux,cod);
																				textbackground(green);
																					gotoxy(4,4);write(' Codigo');
																				textbackground(red);
																					gotoxy(12,4);write(' Producto ');
																				textbackground(blue);
																					gotoxy(24,4);write(' Cantidad ');
																				textbackground(11);
																					gotoxy(36,4);write('    Precio    ');
																				textbackground(yellow);
																					gotoxy(52,4);writeln('    Total      ');
																				textbackground(black);
																					gotoxy(4,6);write(Cod[i]);
																					gotoxy(12,6);write(nom[i]);
																					gotoxy(29,6);write(Can[i]);
																					gotoxy(36,6);write(Pre[i]:0:2,' Bsf');
																					gotoxy(51,6);write(tot[i]:0:2,' Bsf');
																		
																					gotoxy(6,10);writeln('Presiona: "N" para modificar nombre del Producto   ');
																					gotoxy(6,12);writeln('          "C" para modificar cantidad del Producto ');
																					gotoxy(6,14);writeln('          "P" para modificar Precio del Producto   ');
																					gotoxy(6,16);writeln('          "B" para Borrar el Producto de la lista  ');
																					gotoxy(6,18);writeln('          "S" Salir ');
																						r:=readkey();
																						
																	end;
																		until (r='n') or (r='c') or (r='p') or (r='s') or (r='b');
																			clrscr();
																				textbackground(red);
																				gotoxy(16,4);writeln('                     ');
																				gotoxy(16,5);writeln('  Ingresa El Cambio  ');
																				gotoxy(16,6);writeln('                     ');
																				textbackground(black);
																				
																					gotoxy(16,8);
																				
																					case r of 
																					
																					'n': readln(nom[i]);
																					
																					'c': readln(can[i]);  
																							
																					'p': readln(pre[i]); 
																					
																					'b': Borra2(i,nom,cod,pre,tot,can,k,k1); 
																						
																					
																					
																					end;
											
																	clrscr();
																		textbackground(5);
																		gotoxy(16,7);writeln('                                 ');
																		gotoxy(16,8);writeln(' Cambios Efectuados Exitosamente ');
																		gotoxy(16,9);writeln('                                 ');
																		textbackground(black);
																	readkey();	
																	
															end
														else
															begin
															textbackground(5);
																	gotoxy(16,7);writeln('                         ');
																	gotoxy(16,8);writeln(' Codigo No Registrado... ');
																	gotoxy(16,9);writeln('                         ');
																textbackground(black);
															readkey();
															end;
								
								
							end;
	
	
	function  menuLE: char; 
			
				var
				r: char;
				y: integer;
				begin
					y:=8;
					repeat begin
						clrscr();
						
							textcolor(white);
							
							gotoxy(18,y);writeln(' -->                      <--');
							textbackground(red);
							gotoxy(16,2);writeln('                                   ');
							gotoxy(16,3);writeln('         Listar Especifico         ');
							gotoxy(16,4);writeln('                                   ');
							
						textbackground(blue);
							gotoxy(22,8); writeln('       Codigos        ');
							gotoxy(22,10);writeln(' Nombre de Productos  ');
							gotoxy(22,12);writeln('       Cantidades     ');
							gotoxy(22,14);writeln('       Precios        ');
							gotoxy(22,16);writeln('       Totales        ');
							gotoxy(22,18);writeln('        Salir         ');
					
					textbackground(black);					
					gotoxy(1,25);r:=readkey();
										case r of
										#72: begin y:=y-2; if y<8 then y:=8 end;
										#80: begin y:=y+2; if y>18 then y:=18 end;
										end; {fin del case}
						
				end; 
				until r=#13; clrscr(); { fin del repeat}
				
					case y of
						
						8: menule:='a';
						10: menule:='b';
						12: menule:='c';
						14: menule:='d';
						16: menule:='e';
						18: menule:='s';
						
					end;
				
				end;
	
	
	
	Procedure LE(nombres,codigo: cadena; precios,totales:precio; cantidad: entero; k:num);
				
			var
			r: char;
			i: num;
			
	begin	
	
		if k<>0 then 
		
				begin
					r:='z';
						while not (r='s') Do
							
							begin
							r:='z';
								r:=menule;
									clrscr();
									case r of
									
										'a': begin 
												textbackground(red);
												gotoxy(16,5);writeln('                     ');
												gotoxy(16,3);writeln('                     ');
												gotoxy(16,4);writeln(' Codigo de Productos ');
												textbackground(black);
												
												for i:= 1 to k Do
															begin
																writeln();
																gotoxy(18,6+i);writeln(i,') ',cod[i]);
															end;
											 
												readkey();
											 end;
											 
										'b': begin 
												textbackground(5);
												gotoxy(16,5);writeln('                     ');
												gotoxy(16,3);writeln('                     ');
												gotoxy(16,4);writeln(' Nombre de Productos ');
												textbackground(black);
												
												for i:= 1 to k Do
															begin
																
																gotoxy(17,6+i);writeln(i,') ',nom[i]);
																
															end;
											 
												readkey();
											 end;
									
										'c': begin 
												textbackground(11);
												gotoxy(16,5);writeln('                       ');
												gotoxy(16,3);writeln('                       ');
												gotoxy(16,4);writeln(' Cantidad de Productos ');
												textbackground(black);
												
												for i:= 1 to k Do
															begin
																writeln();
																gotoxy(20,6+i);writeln(i,') ',can[i]);
															end;
											 
												readkey();
											 end;
											 
											 
										'd': begin 
												textbackground(blue);
												gotoxy(16,5);writeln('                      ');
												gotoxy(16,3);writeln('                      ');
												gotoxy(16,4);writeln(' Precio de Productos  ');
												textbackground(black);
												
												for i:= 1 to k Do
															begin
																writeln();
																gotoxy(18,6+i);writeln(i,') ',pre[i]:0:2,' Bsf');
															end;
											 
												readkey();
											 end;
											 
											 
										'e': begin 
												textbackground(yellow);
												gotoxy(16,5);writeln('                    ');
												gotoxy(16,3);writeln('                    ');
												gotoxy(16,4);writeln(' Total de Productos ');
												textbackground(black);
												
												for i:= 1 to k Do
															begin
																writeln();
																gotoxy(18,6+i);writeln(i,') ',tot[i]:0:2,' Bsf');
															end;
												readkey();
												
											 end;
									
								end;
							
							end;
				
				end
		
		
		else
		
			begin
				textbackground(5);
				gotoxy(16,5);writeln('                                        ');
				gotoxy(16,7);writeln('                                        ');
				gotoxy(16,6);writeln('  No Se ha Incluido Ningun Producto...  ');
				textbackground(black);
				readkey();
			end;
			
			
		end;
	
	
					Procedure BYE;
				
					begin
						clrscr();
							textbackground(red);
							gotoxy(10,4);writeln('                                                   ');
							gotoxy(10,5);writeln('    Programa Realizado por  Armando Rojas          ');
							gotoxy(10,6);writeln('         3er Semestre de ING Sistema               ');
							gotoxy(10,7);writeln('            UNEFA Junio del 2016                   ');
							gotoxy(10,8);writeln('                                                   ');
							textbackground(black);
						readkey();
					end;
	
	
	
	
	
	{    --------------------------          Programa Principal       ------------------      }
	
		begin
			k:=0;
			k1:=0;
			x:='z';
			while not (x='0') Do
				
					begin
					x:=menu;
						case x of
							'1': incluir(nom,cod,pre,tot,can,k);
							'2': ListarT(nom,cod,pre,tot,can,k,k1);  
							'3': calcular(can,pre,k1,k,tot);							
							'4': consultar(nom,cod,pre,tot,can); 
							'5': modificar(nom,cod,pre,tot,can); 
							'6': Le(nom,cod,pre,tot,can,k); 
							'0': bye;
							
							
						end;{ end del case del menu}
					
					end;  {End del while del Menu}
				
		end.  { fin del programa Principal}