-- Lista el primer apellido de todos los empleados.
SELECT apellido1 FROM empleado;
-- Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT apellido1 FROM empleado GROUP BY apellido1;
-- Lista todas las columnas de la tabla empleado.
SELECT * FROM empleado;
-- Lista el nombre y los apellidos de todos los empleados.
SELECT nombre, apellido1, apellido2 FROM empleado;
-- Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT codigo_departamento FROM empleado WHERE NOT codigo_departamento IS NULL;
-- Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.
SELECT codigo_departamento FROM empleado GROUP BY codigo_departamento;
-- Lista el nombre y apellidos de los empleados en una única columna.
SELECT CONCAT(nombre, apellido1, apellido2) AS nombre_completo FROM empleado;
-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(CONCAT(nombre, apellido1, apellido2)) AS nombre_completo FROM empleado;
-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(CONCAT(nombre, apellido1, apellido2)) AS nombre_completo FROM empleado;
-- Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, presupuesto FROM departamento ORDER BY presupesto ASC;
-- Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM departamento ORDER BY nombre ASC;
-- Lista el nombre de todos los departamentos ordenados de forma desscendente.
SELECT nombre FROM departamento ORDER BY nombre DESC;
-- Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
SELECT apellido1, apellido2, nombre FROM empleado ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC limit 3;
-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC limit 3;
-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT nombre, gastos FROM departamento ORDER BY gastos DESC limit 2;
-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT nombre, gastos FROM departamento ORDER BY gastos ASC limit 2;
-- Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT * FROM empleado WHERE codigo >= 3 limit 5;
-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 150000;
-- Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT nombre, presupuesto FROM departamento WHERE gastos <= 5000;
-- Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000;
-- Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT nombre FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000;
-- Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE presupuesto BETWEEN 100000 AND 200000;
-- Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM departamento WHERE NOT presupuesto BETWEEN 100000 AND 200000;
-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos > presupuesto;
-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos < presupuesto;
-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos = presupuesto;
-- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT nombre FROM empleado WHERE apellido2 IS NULL;
-- Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT nombre FROM empleado WHERE NOT apellido2 IS NULL;
-- Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT nombre FROM empleado WHERE NOT apellido2 = 'López';
-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT * FROM empleado WHERE apellido2 = 'Díaz' OR  apellido2 = 'Moreno';
-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT * FROM empleado WHERE apellido2 IN ('Díaz', 'Moreno');
-- Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT empleado.nombre, apellido1, apellido2, nif FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento WHERE departamento.codigo = 3;
-- Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT empleado.nombre, apellido1, apellido2, nif FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento WHERE departamento.codigo IN (2,4,5);
-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select * FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento;
-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.
select * FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento ORDER BY departamento.nombre, apellido1, apellido2, empleado.nombre ASC;
-- Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT departamento.codigo, departamento.nombre FROM departamento JOIN empleado ON departamento.codigo = codigo_departamento WHERE NOT codigo_departamento IS NULL;
-- Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
SELECT departamento.codigo, departamento.nombre, (presupuesto - gastos) AS presupuesto_actual  FROM departamento JOIN empleado ON departamento.codigo = codigo_departamento WHERE NOT codigo_departamento IS NULL;
-- Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT departamento.nombre FROM departamento  JOIN empleado ON departamento.codigo = codigo_departamento WHERE nif = '38382980M';
-- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT departamento.nombre FROM departamento  JOIN empleado ON departamento.codigo = codigo_departamento WHERE empleado.nombre = 'Pepe' AND empleado.apellido1 = 'Ruiz' AND empleado.apellido2 = 'Santana';
-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT * FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento WHERE departamento.nombre = 'I+D' ORDER BY empleado.nombre ASC;
-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT * FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento WHERE departamento.nombre = 'Sistemas' OR departamento.nombre = 'Sistemas' OR departamento.nombre = 'Sistemas' ORDER BY empleado.nombre ASC;
-- Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
SELECT empleado.nombre FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento WHERE presupuesto BETWEEN 100000 and 200000;
-- Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
SELECT departamento.nombre FROM departamento JOIN empleado ON departamento.codigo = codigo_departamento WHERE apellido2 IS NULL GROUP BY nombre;
-- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
SELECT empleado.nombre FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento;
-- Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT empleado.apellido1 FROM empleado JOIN departamento ON departamento.codigo = codigo_departamento;

-- Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
-- Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
-- Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
