USE actividades; 
#EJERCICIO 1
SELECT nombre FROM articulos;

SELECT nombre, precio FROM articulos;

SELECT nombre FROM articulos WHERE precio <= 200;

SELECT * FROM articulos WHERE precio BETWEEN 60 and 120;

SELECT nombre, (precio*166.386) FROM articulos;

SELECT avg(precio) FROM articulos WHERE fabricante = 2;

SELECT count(precio) FROM articulos WHERE precio >= 180;

SELECT nombre, precio FROM articulos where precio >= 180 ORDER BY precio DESC, nombre ASC;

SELECT * FROM articulos JOIN fabricantes ON (articulos.FABRICANTE = fabricantes.CODIGO);

SELECT articulos.nombre, articulos.precio, fabricantes.nombre FROM articulos JOIN fabricantes ON (articulos.FABRICANTE = fabricantes.CODIGO);

SELECT avg(precio), fabricante FROM articulos GROUP BY fabricante; 

SELECT avg(articulos.precio), fabricantes.nombre FROM articulos JOIN fabricantes ON (articulos.FABRICANTE = fabricantes.CODIGO) GROUP BY fabricante;

SELECT fabricantes.nombre, avg(articulos.precio) FROM fabricantes JOIN articulos ON (articulos.FABRICANTE = fabricantes.CODIGO) GROUP BY fabricantes.nombre HAVING avg(articulos.precio) >= 150;

SELECT nombre, precio FROM articulos WHERE precio = (SELECT MIN(precio) FROM articulos);

SELECT a.nombre, a.precio, f.nombre FROM articulos a, fabricantes f WHERE a.fabricante = f.codigo AND a.precio = (SELECT max(a.precio) FROM articulos a WHERE a.fabricante = f.codigo);

INSERT INTO  articulos(codigo, nombre, precio, fabricante) VALUES (100000, 'altavoces', 70, 2);

UPDATE articulos SET nombre = 'impresora laser' WHERE codigo = 8;

UPDATE articulos SET precio = (precio*0.9);

UPDATE articulos SET precio = (precio - 10) WHERE precio >= 120;


#EJERCICIO 2
SELECT apellidos FROM empleados;

SELECT distinct(apellidos) FROM empleados;

SELECT * FROM empleados WHERE apellidos = 'López';

SELECT * FROM empleados WHERE apellidos IN ('López', 'Perez');

SELECT * FROM empleados WHERE departamento = 14;

SELECT * FROM empleados WHERE departamento IN (37, 77);

SELECT * FROM empleados WHERE apellidos like 'P%';

SELECT sum(presupuesto) FROM departamentos;  

SELECT departamento, count(*) FROM empleados group by departamento;

SELECT * FROM empleados JOIN departamentos  ON empleados.departamento = departamentos.codigo;

SELECT e.nombre, e.apellidos, d.nombre, d.presupuesto FROM empleados e, departamentos d WHERE e.departamento = d.codigo;

SELECT nombre, apellidos FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE presupuesto > 60000);

SELECT * FROM departamentos WHERE presupuesto > (SELECT avg(presupuesto) FROM departamentos);

SELECT nombre FROM departamentos WHERE codigo IN (SELECT departamento FROM empleados GROUP BY departamento HAVING count(*) >2);

INSERT INTO departamentos VALUES (11, 'calidad', 40000);

INSERT INTO empleados VALUES ('89267109', 'Ester', 'Vazquez', 11);

UPDATE departamentos SET presupuesto = presupuesto*0.9;

UPDATE empleados SET departamento = 14 WHERE departamento = 77;

DELETE FROM empleados WHERE departamento = 14;

DELETE FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE presupuesto >= 60000);

DELETE FROM empleados;

#EJERCICIO 3
SELECT * FROM almacenes;

SELECT * FROM cajas WHERE valor > 150;

SELECT distinct contenido FROM cajas;

SELECT avg(valor) FROM cajas;

SELECT almacen, avg(valor) FROM cajas GROUP BY almacen;

SELECT almacen, avg(valor) FROM cajas GROUP BY almacen HAVING avg(valor) > 150;

SELECT numReferencia, lugar FROM almacenes JOIN cajas ON almacenes.codigo = cajas.almacen;

SELECT almacen, count(*) FROM cajas GROUP BY almacen;

SELECT codigo FROM almacenes WHERE capacidad < (SELECT count(*) FROM cajas WHERE almacen = codigo);

SELECT numReferencia FROM cajas WHERE almacen IN (SELECT codigo FROM almacenes WHERE lugar = 'Bilbao');

INSERT INTO almacenes VALUES (1000000, 'Barcelona', 3);

INSERT INTO cajas VALUES ('H5RT', 'Papel', 200, 2);

UPDATE cajas SET valor = valor * 0.85;

#UPDATE cajas SET valor = valor*0.8 WHERE valor > (SELECT avg(valor) FROM cajas);

DELETE from cajas WHERE valor < 100;

#DELETE FROM cajas WHERE almacen IN (SELECT codigo FROM almacenes WHERE capacidad < (SELECT count(*) FROM cajas WHERE almacen = codigo));

#EJERCICIO 4 
SELECT nombre FROM peliculas; 

SELECT distinct calificacionEdad FROM peliculas;

SELECT * FROM peliculas WHERE calificacionEdad is null; 

SELECT * FROM salas WHERE pelicula is null;

SELECT * FROM salas JOIN peliculas ON salas.pelicula = peliculas.codigo;

SELECT * FROM peliculas JOIN peliculas ON salas.pelicula = peliculas.codigo;

SELECT nombre FROM peliculas WHERE codigo NOT IN (SELECT pelicula FROM salas WHERE pelicula IS NOT NULL);

INSERT INTO peliculas VALUES (100000,'Uno, Dos, Tres', 7);

UPDATE peliculas SET calificacionEdad = 13 WHERE calificacionEdad IS NULL; 

#DELETE from salas WHERE pelicula IN (SELECT codigo FROM peliculas WHERE calificacionEdad = 0);


