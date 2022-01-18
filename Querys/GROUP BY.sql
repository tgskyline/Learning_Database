/*
Agrupando dados como funções que GROUP BY

Funções para calcular dados agrupados
– COUNT –quantidade
– SUM –soma 
– MIN –menor valor
– MAX –maior valor
– AVG –média dos valores

*/

-- Funções de agrupamento

use bd_empresa

SELECT COUNT(*) AS QTD,
SUM(val_salario) AS Total,
MIN(val_salario) AS Menor,
MAX(val_salario) AS Maior,
AVG(val_salario) As Media
FROM empregado

-- Agrupando dados 

SELECT sig_uf,
COUNT(*) AS QTD,
SUM(val_salario) AS Total,
MIN(val_salario) AS Menor,
MAX(val_salario) AS Maior,
AVG(val_salario) As Media
FROM empregado
GROUP BY sig_uf
ORDER BY 3


/*
HAVING

Comando de filtro para as funções agregadas
HAVING x WHERE
– HAVING filtra o resultado de funções agregadas e
WHERE filtra linhas de uma tabela
*/

-- Usando HAVING

SELECT sig_uf,
COUNT(*) AS QTD,
SUM(val_salario) AS Total,
MIN(val_salario) AS Menor,
MAX(val_salario) AS Maior,
AVG(val_salario) As Media
FROM empregado
GROUP BY sig_uf
HAVING MIN(val_salario) < 1000
ORDER BY 3

/*
Listar a média e a soma dos salários por departamento, quando a soma for 
maior que 2.500,00
*/

SELECT e.cod_depto, AVG(e.val_salario) AS media, SUM(e.val_salario) AS soma 
FROM empregado e
GROUP BY e.cod_depto
HAVING SUM(e.val_salario) > 2500.00

/*
Listar a média e a soma dos salários por departamento, quando a soma for  
maior que 2.500,00 e a média maior que 2.200,00
*/

SELECT e.cod_depto, AVG(e.val_salario) AS media, SUM(e.val_salario) AS soma FROM 
empregado e
GROUP BY e.cod_depto
HAVING SUM(e.val_salario) > 2500.00 
AND AVG(e.val_salario) > 2200.00

/*
Listar os departamentos com 2 ou mais empregados
*/

SELECT e.cod_depto, d.nom_depto, COUNT(*) AS total_func
FROM empregado e 
INNER JOIN departamento d ON e.cod_depto = d.cod_depto
GROUP BY e.cod_depto, d.nom_depto
HAVING COUNT(*) >= 2




