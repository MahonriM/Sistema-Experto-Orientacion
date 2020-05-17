:-use_module(library(pce)). % libreria para trabajar modo gr�fico
:-use_module(library(pce_style_item)).%activa los estilos de la libreria
:-pce_image_directory('./programa'). % Indica directorio donde se tiene la imagen para el programa
resource(imagen_inicio, image, image('im_inicio.jpg')). % cargue de imagen
:- dynamic color/2.


%interfaz principal
%
comenzar:- new(D,dialog('SISTEMA EXPERTO ORIENTACION VOCACIONAL UANL 2020',size(560,400))),% crea la ventana principal

new(Label1,label(text,'--------UNIVERSIDAD AUTONOMA DE NUEVO LEON UANL---------')),% label contenido texto informacion inicial

	send(Label1,colour,black),
new(Label2,label(text,'........................... SISTEMAS EXPERTOS...............................')),
	send(Label2,colour,black),
new(Label3,label(text,'.')),
	send(Label3,colour,blue),
new(Label4,label(text,'Sistema Experto de orientacion vocacional para la eleccion')),
	send(Label4,colour,blue),
new(Label5,label(text,'de carrera universitaria, enfocado principalmente a carreras')),
	send(Label5,colour,blue),
new(Label6,label(text,'En "cienciasdelasalud" y "cienciasexactas".')),
	send(Label6,colour,blue),
new(Label7,label(text,'')),
	send(Label7,colour,blue),
new(Label8,label(text,'Diseñado por :Mahonri')),
	send(Label8,colour,black),
new(Label9,label(text,'Estudinate de Licenciatura de Tecnologia de Informacion')),
	send(Label9,colour,black),
	new(Label12,label(text,'')),
	send(Label12,colour,blue),

 %llamada a los label declarados anteriorente

 send(D,append(Label1)),
 send(D,append(Label2)),
 send(D,append(Label3)),
 send(D,append(Label4)),
 send(D,append(Label5)),
 send(D,append(Label6)),
 send(D,append(Label7)),
 send(D,append(Label8)),
 send(D,append(Label9)),
 send(D,append(Label12)),

 % declaracion de botones ventana principal

 new(Boton1,button('COMENZAR',and(message(@prolog,main),
 and(message(D,open),message(D,free))))),
 send(Boton1,colour,blue),
 new(Bcancelar,button('CANCELAR',and(message(D,destroy),message(D,free)))),

 send(Bcancelar,colour,blue),
 send(D,append(Boton1)),
 send(D,append(Bcancelar)),
 send(D,open_centered).

:-comenzar.

%llamada al metodo principal
%

main:-
	new(D2, dialog('ORIENTACION VOCACIONAL-ELIGIENDO TU CARRERA',size(500,400))),
	new(Label10, label(nombre,'')),send(Label10,colour,red),


	new(@texto,label(text,'Una vez finalizado el TEST podras ver los resultados:')),
	new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),

%creaci�n del boton para dar inicio al TEST.

	new(@boton,button('INICIAR EL TEST',message(@prolog,botones))),

	send(D2, append(Label10)),
	new(@btncarrera,button('�diagnostica?')),
	send(D2, display,Label10,point(10,20)),
	send(D2, display,@boton,point(100,80)),
	send(D2, display,@texto,point(50,40)),
	send(D2, display,Salir,point(125,200)),
	send(D2, display,@respl,point(70,90)),
	send(D2,open_centered).


% Aqui se especifican las hipotesis de las vocaciones, se etsa haciendo
% uso del corte (!.) para que una vez validad una hipotesis se detenga y
%el resultado.

hipotesis(ingenieria_de_sistemas):-ingenieria_de_sistemas,!.
hipotesis(cienciasdelasalud):-cienciasdelasalud,!.
hipotesis(cienciassocialesyadministrativas):-cienciassocialesyadministrativas,!.
hipotesis(militar):-militar,!.
hipotesis(cienciasnaturalesyexactas):-cienciasnaturalesyexactas,!.
hipotesis(desconocido). /* no existe */
% detalle de las profesiones, se declaran todas las preguntas para las
% vocaiones.

/*INGENIERIA_DE_SISTEMAS*/
ingenieria_de_sistemas:-vocacion_ingenieria_de_sistemas,
	consultar('Eres habil resolviendo problemas?'),
	consultar('Te gustan las matematicas?'),
	consultar('Resuelves calculos con facilidad?'),
	consultar('Te gusta reolver probleas utilizando herramientas tecnologicas?'),
	consultar('Te gusta crear cosas?'),
	consultar('Te emociona diseñar cosas?').

/*MEDICINA*/
cienciasdelasalud:-vocacion_cienciasdelasalud,
	consultar('Te gusta servir a los demas?'),
	consultar('Eres paciente con las otras personas?'),
	consultar('Te preocupa el estado actual del sistema de salud del pa�s?'),
	consultar('Si estuviese dentro de tus posibilidades, te gustaria descrubrir la cura de alguna enfermedad?'),
	consultar('Ayudarias a una persona que se encuentre herida?'),
	consultar('Eres sensible al dolor ajeno?'),
        consultar('Atender y cuidar a los enfermos'),
	consultar('tiene un cambio en los habitos intestinales').


/*ECONOMIA*/
cienciassocialesyadministrativas:-vocacion_cienciassocialesyadministrativas,
	consultar('Te gustaria trabajar en un Banco?'),
        consultar('Te gusta salir de excursión'),
        consultar('Te parece importante discutir en clase o dar tu punto de vista acerca de un tema'),
        consultar('Te ves ayudando como técnico de apoyo al personal de gerencia en una oficina'),
        consultar('Te gusta en analisis de numeros'),
	consultar('Te gusta contar dinero?'),
	consultar('Te apasionan los negocios?').

/*MILITAR*/
militar:-vocacion_militar,
	consultar('Te consideras una persona ruda?'),
	consultar('Te apasiona la adrenalina?'),
	consultar('Te gusta superar tus miedos?'),
	consultar('Consideras que eres competitivo?'),
	consultar('Te gustan las armas?').
cienciasnaturalesyexactas:-vocacion_cienciasnaturalesyexactas,
        consultar('Diseñar programas de computación y explorar nuevas aplicaciones tecnológicas para el uso de internet'),
	consultar('Investigar sobre áreas verdes, medio ambiente y cambios climáticos'),
	consultar('Ilustrar, dibujar y animar digitalmente'),
	consultar('Hacer experimentos de Biología, Física o Química'),
	consultar('Te gusta el estudio de la estructura de la tierra, los minerales, las rocas, las piedras y conocer mas de la tierra').

    
/*ELIGIENDO LA VOCACI�N*/

desconocido:-se_desconoce_vocacion.


%reglas para tomar la ruta

vocacion_ingenieria_de_sistemas:-consultar('Eres habil resolviendo problemas?'),!.
vocacion_cienciasdelasalud:-consultar('Te gusta servir a los demas?'),!.
vocacion_cienciassocialesyadministrativas:-consultar('Te gustaria trabajar en un Banco?'),!.
vocacion_militar:-consultar('Te consideras una persona ruda?'),!.
vocacion_cienciasnaturalesyexactas:-consultar('Diseñar programas de computación y explorar nuevas aplicaciones tecnológicas para el uso de internet'),!.
% creaci�n del dialogo de preguntas.
%

:-dynamic si/1,no/1.

preguntar(Problema):-new(Di,dialog('TEST VOCACIONAL')),
	new(L9,label(texto,'responde las siguientes preguntas')),
	new(L10,label(text,Problema)),

% botones de verificaci�n


	new(B1,button(si,and(message(Di,return,si)))),
	new(B2,button(no,and(message(Di,return,no)))),
	send(Di,gap,size(25,25)),

% agregar label y botones de cuadro de dialogos

	send(Di,append(L9)),
	send(Di,append(L10)),
	send(Di,append(B1)),
	send(Di,append(B2)),

	send(Di,default_button,si),
	send(Di,open_centered), get(Di,confirm,Answer),
	write(Answer), send(Di,destroy),

%llamdo a la sentencia para determinar respuestas

 (   (Answer==si)->assert(si(Problema));
 assert(no(Problema)),fail).


consultar(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
deshacer:-retract(si(_)),fail.
deshacer:-retract(no(_)),fail.
deshacer.


botones:-borrado,
	send(@boton,free),
	send(@btncarrera,free),

% Vocacion de acuerdo a respuestas dadas

hipotesis(Vocacion),
	send(@texto, selection('De acuerdo a sus respuestas su Vocaci�n es::')),
	send(@respl,selection(Vocacion)),
	new(@boton, button('Iniciar su evaluacion',message(@prolog, botones))),
	send(Menu, display,@boton,point(40,600)),
	send(Menu, display,@btncarrera,point(20,50)),
	send(Menu, append, new(Ayuda, popup(Ayuda))),
	deshacer.

borrado:-send(@respl,selection('')).