1. Listar los nombres y ciudades donde viven los proveedores que han enviado piezas color azul.

    Algebra relacional:

    ```
    Π{snombre,ciudadproveedor}(σ{snum = proveedor_snum AND pnum = pieza_pnum  AND  pieza.color = 'azul'}(proveedor  × envio × pieza))
    ```
    
    Consulta sql:
    ```sql
    SELECT snombre,ciudadproveedor FROM proveedor, envio, pieza WHERE snum = proveedor_snum AND pnum = pieza_pnum AND pieza.color = 'azul' ;
    ```

2. Cuanto es el peso promedio de las piezas.

    Algebra relacional:

    ```
    Π{AVG(peso)}(pieza)
    ```
    
    Consulta sql:
    ```sql
    SELECT AVG(peso) FROM pieza;
    ```

3. Listar los nombres de proveedores, nombres y cantidades de piezas enviadas de proveedores que viven en Londres.

    Algebra relacional:

    ```
    Π{snombre, pnombre, cant}(σ{snum = proveedor_snum AND pnum = pieza_pnum  AND  proveedor.ciudadproveedor = 'Londres'}(proveedor  × envio × pieza))
    ```
    
    Consulta sql:
    ```sql
    SELECT snombre, pnombre, cant FROM proveedor, envio, pieza WHERE snum = proveedor_snum AND pnum = pieza_pnum AND proveedor.ciudadproveedor = 'Londres' ;
    ```

4. Listar los promedios de piezas enviadas por proveedor, mostrando nombre de proveedor y la ciudad donde vive.

    Algebra relacional:

    ```
    Π{snombre, ciudadproveedor, AVG(cant)}(σ{envio.proveedor_snum = "S1"}(proveedor × envio × pieza))
    ```
    
    Consulta sql:
    ```sql
    SELECT snombre, ciudadproveedor, AVG(cant) FROM proveedor, envio, pieza WHERE envio.proveedor_snum = 'S1' ;
    ```

5. Obtener los valores de PNUM para los proveedores que suministren las piezas de P4 y P5.

    Algebra relacional:

    ```
    Π{pnum}(σ{proveedor . snum = envio . proveedor_snum AND envio . pieza_pnum = 'P4' AND envio . pieza_pnum = 'P5'}(proveedor × pieza × envio))
    ```
    
    Consulta sql:
    ```sql
    SELECT pnum  FROM proveedor, pieza, envio WHERE proveedor.snum = envio.proveedor_snum AND envio.pieza_pnum = 'P4' AND envio.pieza_pnum = 'P5' ;
    ```

6. Obtener información de SNUM de los proveedores que han enviado todas las piezas.

    Algebra relacional:

    ```
    Π{snum}(envio)  ⋈ proveedor
    ```
    
    Consulta sql:
    ```sql
    SELECT * FROM (SELECT envio.proveedor_snum FROM envio)alias1  NATURAL JOIN proveedor group by (proveedor_snum);
    ```