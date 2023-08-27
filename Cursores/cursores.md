

**Introducción**
Si estás leyendo este artículo a primera hora de la mañana, seguramente habrás desayunado. Si desayunas en casa, es posible que hayas desayunado un café con leche y una tostada de aceite y queso. Te habrás acercado a la nevera, habrás sacado el pan de molde, el queso, y la leche. A continuación, habrás enchufado la cafetera, habrás puesto el pan a calentar en la tostadora, y mientras se hace el café, el pan se ha calentado. Tratas de optimizar el tiempo que tarda la tostadora y el café. Siempre se hace antes el café; hay que esperar. Acaba el pan, lo colocas en un plato, y pones aceite y el queso. Para finalizar, coges el plato y el café y vas a la mesa del salón a sentarte y desayunar con tranquilidad. Has hecho un trabajo orientado a conjuntos; básicamente has paralelizado acciones atómicas. Es así como normalmente funcionamos. Si lo hiciéramos uno a uno, que es como funcionan los cursores, abrirías la nevera dos veces por separado, harías la tostada y hasta que no acabara no harías el café, o incluso, podrías ir a la mesa a comer la tostada, y después volver a la nevera a sacar la leche para hacerte el café. Depende de lo que sería para ti una unidad “atómica”. Esta segunda forma de funcionar, aunque parezca ridícula, es cómo funcionan los cursores.

**Cursores en SQL Server**
Los cursores son un recurso de programación que se utilizan para operar sobre los registros de las tablas uno a uno. Hay casos de uso en los que no hay más remedio que trabajar con cursores. El objetivo de esta publicación es introducirte a cómo funcionan para que posteriormente puedas replantearte escenarios en los que quizás los estés utilizando.
Hay cursores más malos que otros. Plantearse eliminar todos los cursores de una aplicación, no tiene sentido si no es una decisión apoyada en esfuerzo del cambio y su beneficio. Por ejemplo; si tienes un proceso basado en cursores que se ejecuta una vez al día, cuanto el tiempo no penaliza, y no hay competencia con recursos, probablemente no tiene sentido invertir en cambiarlo.
Sin embargo, si tienes un proceso basado en cursores, que se utiliza de forma concurrente por muchos usuarios, y detectas en esos momentos, picos altos de consumo de recursos del servidor (por ejemplo, CPU), la inversión si será rentable.

**Características de los Cursores**

Los cursores permiten:
- Posicionarse en filas específicas del conjunto de resultados.
- Recuperar una fila o bloque de filas desde la posición actual.
- Modificar datos en las filas de la posición actual.
- Ver cambios realizados por otros usuarios en los datos del conjunto de resultados.
- Dar acceso a los datos de un conjunto de resultados en declaraciones Transact-SQL.

**Tipos de Cursores**
SQL Server ofrece cuatro tipos de cursores:

- Adelante-sólo (Forward-only): No permite desplazamiento y muestra los resultados en orden desde el inicio hasta el final.
- Estático (Static): Muestra el conjunto de resultados tal como estaba cuando se abrió el cursor.
- Conjunto de claves (Keyset): Controlado por un conjunto de identificadores únicos.
- Dinámico (Dynamic): Refleja todos los cambios realizados en las filas de su conjunto de resultados.

**Proceso del Cursor**

El proceso general para todos los cursores en SQL Server incluye:
- Asociar un cursor con el conjunto de resultados de una declaración Transact-SQL.
- Ejecutar la declaración para llenar el cursor.
- Recuperar las filas deseadas.
- Modificar las filas, si es necesario.
- Cerrar el cursor.

**Ejemplo de Cursor**

```sql      
DECLARE @id INT
DECLARE @nombre VARCHAR(50)
DECLARE @apellido VARCHAR(50)
DECLARE @edad INT
DECLARE @pais VARCHAR(50)

DECLARE cursorPersona CURSOR FOR
SELECT id, nombre, apellido, edad, pais
FROM persona

OPEN cursorPersona
FETCH NEXT FROM cursorPersona INTO @id, @nombre, @apellido, @edad, @pais

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID: ' + CAST(@id AS VARCHAR(10)) + ' Nombre: ' + @nombre + ' Apellido: ' + @apellido + ' Edad: ' + CAST(@edad AS VARCHAR(10)) + ' Pais: ' + @pais
    FETCH NEXT FROM cursorPersona INTO @id, @nombre, @apellido, @edad, @pais
END

CLOSE cursorPersona
DEALLOCATE cursorPersona
```

**(Diagnostico de cursores DMVs)[ejemplo_cursor.sql]**




**Recursos para publicacion**

Cursor Location:
https://www.w3schools.com/asp/prop_rs_cursorlocation.asp

client side vs server side:
https://learn.microsoft.com/en-us/sql/ado/guide/data/the-significance-of-cursor-location?view=sql-server-ver16

demo Pinal:
https://blog.sqlauthority.com/2015/01/10/sql-server-what-is-the-query-used-in-sp_cursorfetch-and-fetch-api_cursor/

stackoverflow:
https://stackoverflow.com/questions/56037800/difference-between-ado-client-side-vs-server-side-cursor-when-the-sql-server-dat

https://learn.microsoft.com/es-es/sql/relational-databases/cursors?view=sql-server-ver16


