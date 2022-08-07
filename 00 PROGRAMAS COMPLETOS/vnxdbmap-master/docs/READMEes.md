
vnxdbmap: Mapeador de base de datos a codigo
============================================

Mini framework (marco de trabajo), que genera el codigo de las bases de datos para desarrollo Gambas.

Crea el código entidad-relacion de cada tabla y vista en dos capas de acceso a datos, 
las clases "DAO" de la capa de datos y las clases "VO" de la capa de aplicacion.
El software esta originalmente en: http://mapbdvistas.blogspot.com.es/

Acerca del codigo generado DAO/VO
---------------------------------

Este codigo generado es la representacion entidad-relacion, definido en dos capas, 
una mas cercana a base de datos (DAO) y otra mas cercana a la aplicacion (VO).

* *Clases VO* abstrae o representa el contenido de los elementos de base de datos.
* *Clases DAO* para crear, actualizar, borrar y obtener datos en la base de datos.

El equivalente mas cercano es la combinacion de Clases Beans de Java, esto es similar.

Uso y funcionamiento
--------------------

Require tener instalado el software Gambas de la serie o release 3 y Linux preferiblemente.
Simple, instale el programa o descarge el ejecutable, al arrancar dele el esquema de la base de datos, 
este despues de analizarlo, generara el codigo fuente en un proyecto Gambas nuevo.

Si prefiere lo ultimo de la moda, puede compilarlo desde el git:

`git clone https://github.com/venenux/vnxdbmap.git`

Una vez clonado el repositorio abralo con el IDE Gambas y ejecutelo.

HISTORY
=======

Julio Sánchez Berro es el creador, el programa esta aqui porque se le continuo el desarrollo para 
extender su funcionalidad ya que el prgrama asumia bases de datos sqlite con caracteristicas especificas.
Fue el programa que más tiempo le tomo desarrollar en gambas. Surgió cuando al crear aplicaciones que 
usaban bases de datos con varias tablas, se generaba muchas lineas de código muy parecidas unas a otras, 
y por lo tanto mucho trabajo de "codificar" y mecanografiar todo, y un cambio en las tablas 
(nombre de los campos, aumentar o disminuir el número de campos), generaba un trabajo muy tedioso de 
comprobación y repaso del código para adaptarlo  a las nuevas condiciones de las tablas.

Creo entonces un programa que fuera capaz de leer la base de datos y generar el código para poder manipular 
los registros de las tablas y vistas.
Así, si hubiese un cambio en la base de datos, simplemente usando otra vez el programa, se volvía a 
generar el código "nuevo", que simplemente habría que sustituirlo por el antiguo en el programa que 
estuviéramos haciendo.

Tiempo despues esto tenia demasiadas limitantes, no soportadaba tipos de datos SQL 2000, las definiciones 
debian ser con fines de lineas, y adicional cada campo no podia tener comentarios o valores iniciales.
Por tanto se continuo el desarrollo para en vez de solo soportar SQLite, tratar de soportar cualquier 
base de datos, especialmente ODBC y PostgreSQL las cuales llevarina el programa a verdadera utilidad, 
esto porque SQLite es un sistema de DB pequeño, y la ayuda se requeria en sistemas grandes.
