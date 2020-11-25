  
Program Autodromo;
type
	t_corredor = record
		codigo:		integer;
		dni:		LongInt;
		edad:		integer;
		vehiculo:	integer;
		marca:		integer;
		posicion:	integer;
	end;

	function corredorEnPodio( corredor : t_corredor ) : boolean;
	Begin
		corredorEnPodio:=( corredor.posicion <= 3 ) AND ( corredor.codigo = 70 );
	End;

	procedure ingrese( nombre_dato : string );
	begin
		writeln( '    Ingrese ', nombre_dato, '.' );
	end;

	function datoCorredor( nombre_dato : string ) : integer;
	begin
		ingrese( nombre_dato );
		readln( datoCorredor );
	end;

	function datoDNI( nombre_dato : string ) : LongInt;
	begin
		ingrese( nombre_dato );
		readln( datoDNI );
	end;

	function getCodigo( var corredor : t_corredor ; var n_corredor : integer ) : boolean;
	begin
		writeln( 'Datos corredor ', n_corredor, ':' );

		n_corredor:=n_corredor+1;

		corredor.codigo:=datoCorredor( 'código' );

		getCodigo:=( corredor.codigo <> -1 );
	end;

	procedure datosCorredor( var corredor : t_corredor );
	Begin
		corredor.dni:=datoDNI( 'dni' );
		corredor.edad:=datoCorredor( 'edad' );
		corredor.vehiculo:=datoCorredor( 'vehiculo' );
		corredor.marca:=datoCorredor( 'marca' );
		corredor.posicion:=datoCorredor( 'posicion' );
	end;

	procedure infoCorredorDNI( corredor : t_corredor );
	begin
		writeln( 'Corredor ', corredor.codigo, ':' );
		writeln( '	DNI: ', corredor.dni );
		writeln( '	Edad: ', corredor.edad );
	end;

	procedure maxDNI( var corr_dni_a : t_corredor ; var corr_dni_b : t_corredor ; corr_current : t_corredor );
	begin
		if( corr_current.dni > corr_dni_a.dni )
		then
			begin
				corr_dni_b:=corr_dni_a;

				corr_dni_a:=corr_current;
			end
		else
			begin
				if( corr_current.dni > corr_dni_b.dni ) then
				begin
					corr_dni_b:=corr_current;
				end;
			end;
	end;
var
	corr_dni_a : t_corredor;
	corr_dni_b : t_corredor;

	corredor_current: t_corredor;
	corredor_count: integer;
	carreras_count: integer;

	podio_count : integer;
	prom_count : integer;
	prom_pos_acum: integer;
Begin
	corr_dni_a.dni:=0;
	corr_dni_b.dni:=0;

	podio_count:=0;

	prom_pos_acum:=0;
	prom_count:=0;

	for carreras_count:=1 to 3 do
	begin
		writeln( 'Info Carrera ', carreras_count );

		corredor_count:=1;

		while( getCodigo( corredor_current , corredor_count ) ) do
		begin
			datosCorredor( corredor_current );

			if ( corredorEnPodio( corredor_current ) ) then
			begin
				podio_count:=podio_count+1;
			end;

			if ( corredor_current.marca = 5 ) then
			begin
				prom_pos_acum:=prom_pos_acum+corredor_current.posicion;
				prom_count:=prom_count+1;
			end;

			maxDNI( corr_dni_a , corr_dni_b , corredor_current );
		end;
	end;

	writeln( 'a) Cantidad de carreras en las que el competidor con código 70 finalizó en elpodio:', podio_count );

	writeln( 'b) Posición final promedio para los vehículos con código de marca igual a 5: ', prom_pos_acum/prom_count );

	writeln( 'c) Códigos y edades de los dos competidores con mayor número de DNI:' );
		infoCorredorDNI( corr_dni_a );
		infoCorredorDNI( corr_dni_b );

End.;