SubProceso Key <- HashMap ( Letra )
	//Simula un hash de 26 letras como Key.
	definir Key como entero;
	definir Letras Como Caracter;
	definir J como entero;
	
	Letras="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	Key=0;
	Para J=1 Hasta Longitud(Letras)-1 Con Paso 1 Hacer
		si subcadena(Letras,J,J)==Letra
			Key=J;
		FinSi
	FinPara	
	
Fin SubProceso


SubProceso Key <- MapHash ( Numer )
	definir Key como caracter;
	definir Letras Como Caracter;
	definir J como entero;
	
	Letras="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	Key= subcadena(Letras, Numer, Numer);
	
	Fin SubProceso
	

Proceso dijkstra
	// Mi primer programa en PSeInt...
	// Ya soy "científico de datos"?
	// Python Sucks!
	definir Actual como entero;
	definir Inicia Como Caracter;
	definir V1 como entero;
	definir V2 como entero;
	definir Swap como Entero;
	definir Llave como Entero;
	definir MaxVertices como entero;
	definir MaxAristas como entero;
	definir Grafo Como cadena;
	definir Matrix Como cadena;
	definir Vertix como Entero;
	definir Arista Como Entero;
	definir Infinito como entero;
	definir Costo como entero;
	definir Suma como entero;
	
	Inicia= "A";
	Infinito= 999999999;
	MaxVertices= 5;  //Pseudo hashmap basado en letras...
	MaxAristas= 7;		//Numero de Aristas maximo...
	dimension Grafo[MaxAristas,3];
	dimension Matrix[MaxVertices,3];
	
	// El grafo con Vector1, Vector2 y Costo.
	Grafo[1,1]= "A"; Grafo[1,2]= "B"; Grafo[1,3]= "6";
	Grafo[2,1]= "A"; Grafo[2,2]= "D"; Grafo[2,3]= "1";
	Grafo[3,1]= "B"; Grafo[3,2]= "D"; Grafo[3,3]= "2";
	Grafo[4,1]= "B"; Grafo(4,2]= "E"; Grafo[4,3]= "2";
	Grafo[5,1]= "C"; Grafo[5,2]= "B"; Grafo[5,3]= "5";
	Grafo[6,1]= "C"; Grafo[6,2]= "E"; Grafo[6,3]= "5";
	Grafo[7,1]= "D"; Grafo[7,2]= "E"; Grafo[7,3]= "1";
	
	// Genera la matrix de resultados.
	para Arista desde 1 hasta MaxAristas Hacer
		V1= HashMap(Grafo[Arista,1]);
		V2= HashMap(Grafo[Arista,2]);
		Matrix[V1,1]= "0";
		Matrix[V1,2]= convertiratexto(Infinito);
		Matrix[V1,3]= "";
		Matrix[V2,1]= "0";
		Matrix[V2,2]= convertiratexto(Infinito);
		Matrix[V2,3]= "";
	Fin Para
	
	// Establece los datos de inicio.
	Matrix[HashMap(Inicia),2]= "0";
	Matrix[HashMap(Inicia),3]= Inicia;
	
	Repetir
		// Buscar el siguiente actual minimo...
		Actual= 0;
		Costo= Infinito;
		para Vertix desde 1 hasta MaxVertices
			si Matrix[Vertix,1]=="0"
				si convertiranumero(Matrix[Vertix,2])<Costo
					Actual= Vertix;
					Costo= convertiranumero(Matrix[Vertix,2]);
				FinSi
			FinSi
		FinPara
	
		// Recorrer vertices conectados al actual...		
		para Arista desde 1 hasta MaxAristas
			V1= HashMap(Grafo[Arista,1]);
			V2= HashMap(Grafo[Arista,2]);
			si V2==Actual
				Swap= V1; V1= V2; V2= Swap;
			FinSi
			si V1==Actual
				si Matrix[V2,1]=="0"
					Suma= Costo + convertiranumero(Grafo[Arista,3]);
					si suma<Convertiranumero(Matrix[V2,2])
						Matrix[V2,2]= ConvertirATexto(Suma);
						Matrix[V2,3]= MapHash(Actual);
					FinSi
				FinSi
			FinSi
		FinPara
		
		si Actual>0
			Matrix[Actual,1]="1";
		FinSi
	
	Hasta Que Actual==0
	
	// Mostrar matrix final...
	escribir "Algoritmo de Dijkstra!";
	escribir "======================";
	para Arista desde 1 hasta MaxAristas
		escribir "   ", Grafo[Arista,1], " -> ", Grafo[Arista,2], "   ", Grafo[Arista,3];
	FinPara
	escribir "";
	para Vertix desde 1 hasta MaxVertices
		escribir "Ruta de ", Inicia, " a ", MapHash(Vertix), " tiene un costo minimo de ", Matrix[Vertix,2], " pasando por ", Matrix[Vertix,3];
	FinPara
FinProceso

