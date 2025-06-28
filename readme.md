## Docente 
    Edgar López

## Asignatura 
    Bases De Datos Estructuradas


## Objetivos de la Asignatura
Desarrollo de habilidades prácticas en manejo de bases de datos: El curso se enfoca en habilidades prácticas más que en teoría pura, lo cual es crucial para aplicaciones reales en tecnologías de información y ciberseguridad.

Gestión de objetos de esquema: Esto implica que los estudiantes aprenderán a manejar y modificar la estructura de las bases de datos, como tablas, vistas, índices, entre otros.
Elaboración de consultas: Serán capaces de crear consultas SQL para extraer y manipular datos de manera efectiva.

Construcción de procedimientos y triggers: 
    Aprenderán a escribir procedimientos almacenados y triggers para automatizar tareas y garantizar la integridad de los datos.
Operación segura de bases de datos: 
    Se enfatizará en las prácticas de seguridad para proteger la información y operar dentro de un marco ético y legal.
Competencias a Desarrollar
    Competencias técnicas: Dominio de SQL, diseño y gestión de bases de datos.
    Competencias en ciberseguridad: Aseguramiento de la integridad y seguridad de los datos.
    Competencias éticas y ciudadanas: Enseñanza de cómo la tecnología se relaciona con la ética y los derechos ciudadanos, especialmente importante en el manejo de información sensible.
Modalidad de Enseñanza
    Presencial con componente online: Esto sugiere una combinación de clases en persona para habilidades prácticas y componentes online para teoría o actividades complementarias, ofreciendo una experiencia de aprendizaje flexible y accesible.

## Contenido del Repositorio

- `***.sql`: Archivo con las ejercicios/soluciones de las clases.
# Guía de Ejercicios - Bases de Datos Estructuradas

Esta guía contiene 20 ejercicios para reforzar los contenidos del curso, alineados con los objetivos de la asignatura **Bases de Datos Estructuradas** (INACAP).

---

## 🟣 Parte 1 - DDL y DML (Definición y manipulación de datos)

1️⃣ **Crea una base de datos**
> Crea una base de datos llamada `ComercioDB` y úsala.

2️⃣ **Crea tablas**
> Crea las tablas `Clientes`, `Productos` y `Ventas` con claves primarias apropiadas.

3️⃣ **Relaciones**
> Agrega claves foráneas entre `Ventas` y `Clientes`, y entre `DetalleVentas` y `Ventas`.

4️⃣ **Modificar tabla**
> Agrega una columna `Descuento` (DECIMAL) a la tabla `Ventas`.

5️⃣ **Eliminar columna**
> Elimina la columna `Descuento` de la tabla `Ventas`.

6️⃣ **Insertar clientes**
> Inserta 5 registros en `Clientes` con nombres, correos y ciudades distintas.

7️⃣ **Insertar productos**
> Inserta 3 productos con nombre, precio y stock.

8️⃣ **Insertar venta**
> Inserta una venta con un detalle asociado en `DetalleVentas`.

9️⃣ **Actualizar stock**
> Modifica el stock de un producto específico.

🔟 **Eliminar cliente**
> Elimina un cliente que no tenga ventas asociadas.

---

## 🟣 Parte 2 - Consultas SQL (DQL)

1️⃣ **LIKE**
> Muestra el nombre y ciudad de los clientes cuyo nombre comienza con ‘M’.

2️⃣ **BETWEEN**
> Lista los productos con precio mayor a 20.000 y menor o igual a 100.000.

3️⃣ **IN**
> Muestra las ventas de los clientes que viven en `Santiago` o `Valparaíso`.

4️⃣ **JOIN**
> Lista el nombre del cliente y la fecha de venta usando un JOIN entre `Clientes` y `Ventas`.

5️⃣ **JOIN múltiple**
> Muestra el nombre de los productos vendidos y la cantidad usando JOIN entre `Productos`, `DetalleVentas` y `Ventas`.

6️⃣ **Filtro por fecha**
> Muestra las ventas realizadas en una fecha específica (`2025-06-01`).

7️⃣ **Clientes sin ventas**
> Muestra los clientes que no han realizado ninguna venta.

8️⃣ **Productos vendidos**
> Muestra el total de productos vendidos por producto, ordenado de mayor a menor.

---
## Ejercicios Prácticos Clase 1
Usando el script "Clase01_Script.sql"
1. Creación de Tablas
Descripción:
    Crea una tabla llamada Estudiantes que contenga las siguientes columnas:
        ID como número entero, que sea la clave primaria y que se autoincremente.
        Nombre como texto (cadena de caracteres) que no puede ser nulo.
        Edad como número entero.
        FechaIngreso como fecha.

2. Creación de Vistas
Descripción:
    Crea una vista llamada VistaEstudiantes que muestre el nombre y la edad de los estudiantes que tengan más de 18 años.

3. Creación de Índices
Descripción:
    Crea un índice para la columna Edad en la tabla Estudiantes para mejorar la velocidad de las consultas que filtren por edad.

## Ejercicios Parte 2:

Usando el script de "Clase01_Script.sql"

1. **Consulta Básica**: Mostrar todos los libros de la tabla "Libros".
2. **Consulta con Filtro**: Mostrar el nombre y nacionalidad del autor del libro con ID 2.
3. **Consulta con JOIN**: Mostrar el título del libro y el nombre del autor de todos los libros.
4. **Actualización de Datos**: Cambiar la nacionalidad del autor con ID 3 a "Argentino - Francés".
5. **Inserción de Datos**: Agregar un nuevo autor a la tabla "Autores" con ID 4, nombre "Isabel Allende" y nacionalidad "Chilena".
6. **Eliminación de Datos**: Eliminar el libro con ID 1 de la tabla "Libros".

## Respuestas: 
1. ```SELECT * FROM Libros;```
2. ```SELECT Autores.Nombre, Autores.Nacionalidad FROM Autores JOIN Libros ON Autores.ID = Libros.Autor_ID WHERE Libros.ID = 2;```
3. ```SELECT Libros.Titulo, Autores.Nombre FROM Libros JOIN Autores ON Libros.Autor_ID = Autores.ID;```
4. ```UPDATE Autores SET Nacionalidad = 'Argentino - Francés' WHERE ID = 3;```
5. ```INSERT INTO Autores (ID, Nombre, Nacionalidad) VALUES (4, 'Isabel Allende', 'Chilena');```
6. ```DELETE FROM Libros WHERE ID = 1;```

## Ejercicios sin solución:

1. **Crear un nuevo libro**:
Inserta un nuevo registro en la tabla "Libros" con los siguientes datos:
   - ID: 4
   - Título: "El amor en los tiempos del cólera"
   - Autor_ID: 1
2. **Actualizar un libro**:
Actualiza el título del libro con ID 2 a "Conversación en la catedral".
3. **Eliminar un autor**:
Elimina el autor con ID 3 de la tabla "Autores" y todos los libros asociados a este autor.
4. **Leer todos los libros de un autor**:
Muestra todos los libros escritos por el autor con ID 1.
5. **Actualizar la nacionalidad de un autor**:
Cambia la nacionalidad del autor con ID 2 a "Peruana".

## Ejercicios Prácticos Clase 2

6. **Creación de una Función**: 
    - Descripción: Crea una función `fn_CantidadEstudiantes` que devuelva el número total de estudiantes.
    - Script: 
      ```sql
      CREATE FUNCTION fn_CantidadEstudiantes() RETURNS INT AS BEGIN
          DECLARE @total INT;
          SELECT @total = COUNT(*) FROM Estudiantes;
          RETURN @total;
      END;
      ```

7. **Uso de la Función**: 
    - Descripción: Utiliza la función creada para mostrar el total de estudiantes.
    - Script: 
      ```sql
      SELECT dbo.fn_CantidadEstudiantes() AS TotalEstudiantes;
      ```

8. **Creación de un Procedimiento Almacenado para Actualizar Edad**:
    - Descripción: Crea un procedimiento almacenado `sp_ActualizarEdad` que permita actualizar la edad de un estudiante dado su ID.
    - Script: 
      ```sql
      CREATE PROCEDURE sp_ActualizarEdad @EstudianteID INT, @NuevaEdad INT AS
      BEGIN
          UPDATE Estudiantes SET Edad = @NuevaEdad WHERE ID = @EstudianteID;
      END;
      ```

9. **Uso del Procedimiento Almacenado para Actualizar Edad**:
    - Descripción: Actualiza la edad del estudiante con ID 1 a 22 años usando el procedimiento `sp_ActualizarEdad`.
    - Script: 
      ```sql
      EXEC sp_ActualizarEdad @EstudianteID = 1, @NuevaEdad = 22;
      ```

10. **Creación de Índices sobre Múltiples Columnas**:
    - Descripción: Crea un índice compuesto en las columnas `Nombre` y `FechaIngreso` para optimizar las consultas que usan estos campos.
    - Script: 
      ```sql
      CREATE NONCLUSTERED INDEX idx_NombreFechaIngreso ON Estudiantes (Nombre, FechaIngreso);
      ```
## Ejercicios sin Solución

1. **Consulta Avanzada de Estudiantes**:
   - Escribe una consulta SQL que liste todos los estudiantes menores de 25 años ordenados por fecha de ingreso de manera ascendente.

2. **Actualización de Información**:
   - Actualiza el registro de los estudiantes para incrementar su edad en un año si han ingresado antes del año 2023.

3. **Eliminar Estudiantes**:
   - Elimina de la tabla `Estudiantes` aquellos que tienen más de 30 años.

4. **Creación de Vistas Complejas**:
   - Crea una vista llamada `VistaEstudiantesActivos` que muestre solamente los estudiantes que tienen menos de 30 años y ordena los resultados por edad de manera descendente.

5. **Función para Calcular la Edad Mínima**:
   - Desarrolla una función llamada `fn_EdadMinimaEstudiantes` que devuelva la edad mínima de los estudiantes.

## Ejercicios Prácticos Clase 3

### Ejercicios en clases

1. **Función para Calcular Años de Antigüedad**:
   - **Descripción**: Crea una función `fn_AntiguedadEmpleado` que calcule la cantidad de años que un empleado ha trabajado en la empresa basado en la fecha de ingreso.
   - **Script**:
     ```sql
     CREATE FUNCTION fn_AntiguedadEmpleado (@FechaIngreso DATE) RETURNS INT AS 
     BEGIN
         RETURN DATEDIFF(YEAR, @FechaIngreso, GETDATE());
     END;
     ```

2. **Consulta de Antigüedad por Departamento**:
   - **Descripción**: Muestra el nombre del empleado, su antigüedad y el departamento al que pertenece.
   - **Script**:
     ```sql
     SELECT 
         FirstName, 
         Department, 
         dbo.fn_AntiguedadEmpleado(HireDate) AS Antiguedad 
     FROM 
         Employees;
     ```

3. **Creación de un Procedimiento para Aumentar Salario**:
   - **Descripción**: Crea un procedimiento almacenado `sp_AumentarSalario` que incremente el salario de los empleados de un departamento específico en un porcentaje dado.
   - **Script**:
     ```sql
     CREATE PROCEDURE sp_AumentarSalario @Departamento NVARCHAR(50), @Porcentaje DECIMAL(5,2) AS
     BEGIN
         UPDATE Employees
         SET Salary = Salary + (Salary * @Porcentaje / 100)
         WHERE Department = @Departamento;
     END;
     ```

4. **Aplicar el Procedimiento de Aumento de Salario**:
   - **Descripción**: Aumenta el salario en un 10% para todos los empleados del departamento "IT".
   - **Script**:
     ```sql
     EXEC sp_AumentarSalario @Departamento = 'IT', @Porcentaje = 10;
     ```

5. **Índice para Acelerar Consultas por Antigüedad**:
   - **Descripción**: Crea un índice en la columna `HireDate` para acelerar las consultas relacionadas con la antigüedad de los empleados.
   - **Script**:
     ```sql
     CREATE INDEX idx_HireDate ON Employees (HireDate);
     ```

  
### Ejercicios sin Solución

1. **Crear una Vista para Empleados con Más de 5 Años**:
   - **Descripción**: Crea una vista `VistaEmpleadosAntiguos` que muestre solo los empleados con más de 5 años de antigüedad en la empresa.

2. **Consulta de Promedio Salarial por Antigüedad**:
   - **Descripción**: Escribe una consulta SQL que muestre el promedio salarial de los empleados que tienen más de 10 años en la empresa.

3. **Procedimiento para Asignar Bonificaciones**:
   - **Descripción**: Crea un procedimiento almacenado que asigne una bonificación del 5% del salario anual a los empleados que tengan más de 15 años de antigüedad.

4. **Eliminar Empleados con Baja Antigüedad**:
   - **Descripción**: Escribe una consulta para eliminar a los empleados que tengan menos de 2 años de antigüedad en la empresa.

5. **Función para Calcular la Edad de los Empleados**:
   - **Descripción**: Desarrolla una función `fn_EdadEmpleado` que devuelva la edad actual de un empleado basado en su fecha de nacimiento.
  
# Clase 4: Procedimientos Almacenados Básicos - Ejercicios

## Ejercicio 1: Actualización Automática de Stock

**Problema:**

En la base de datos de la empresa, cada vez que se recibe una nueva entrega de productos, el stock debe actualizarse manualmente en la tabla `Productos`. Esto es tedioso y propenso a errores.

**Tu Tarea:**

Desarrollar un **procedimiento almacenado** que permita actualizar automáticamente el stock de un producto cuando se recibe una nueva entrega. El procedimiento debe:

1. **Recibir como parámetros** el identificador del producto (`@ProductoID`) y la cantidad de unidades recibidas (`@Cantidad`).
2. **Sumar la cantidad recibida** al stock actual del producto.
3. **Actualizar el registro del producto** en la tabla `Productos` con el nuevo valor de stock.

**Requisitos:**

- Asegúrate de que el procedimiento maneje correctamente los casos en que el `ProductoID` no existe.
- Considera cómo este procedimiento podría integrarse en el sistema de inventario actual para mejorar la eficiencia.

---

## Ejercicio 2: Registro de Nuevo Pedido

**Problema:**

La empresa quiere automatizar el proceso de registro de nuevos pedidos en su base de datos. Actualmente, este proceso se realiza manualmente, lo que puede generar errores en la entrada de datos y retrasos en el procesamiento de pedidos.

**Tu Tarea:**

Desarrollar un **procedimiento almacenado** que permita registrar un nuevo pedido en la tabla `Pedidos`. El procedimiento debe:

1. **Recibir como parámetros** el identificador del cliente (`@ClienteID`) y la fecha del pedido (`@FechaPedido`).
2. **Insertar un nuevo registro** en la tabla `Pedidos` con los datos proporcionados y establecer el estado inicial del pedido como 'Pendiente'.
3. **Generar automáticamente un identificador único para el pedido** utilizando una columna de tipo `IDENTITY`.

**Requisitos:**

- Asegúrate de que el procedimiento maneje casos en que el `ClienteID` no existe o no es válido.
- Considera cómo este procedimiento puede ser utilizado en un sistema más amplio de gestión de pedidos.

---

## Ejercicio 3: Consulta de Pedidos por Cliente

**Problema:**

El equipo de ventas de la empresa necesita poder consultar rápidamente todos los pedidos asociados a un cliente específico para revisar el historial de compras y el estado actual de los pedidos.

**Tu Tarea:**

Desarrollar un **procedimiento almacenado** que permita consultar todos los pedidos de un cliente dado. El procedimiento debe:

1. **Recibir como parámetro** el identificador del cliente (`@ClienteID`).
2. **Devolver un conjunto de resultados** que incluya todos los pedidos asociados a ese cliente, con detalles como la fecha del pedido y el estado actual.

**Requisitos:**

- Asegúrate de que el procedimiento maneje casos en que el `ClienteID` no existe, devolviendo un mensaje adecuado.
- Considera cómo este procedimiento podría integrarse en un sistema de CRM (Customer Relationship Management) para mejorar la experiencia del cliente.

---
