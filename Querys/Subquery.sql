-- Subconsulta - SUBQUERY

use bd_empresa

/*
Listar o nome do empregado com o maior salário
*/

select e.nom_empregado
from empregado as e
where e.val_salario =
(select max(val_salario) from empregado)

/*
Listar o nome dos empregados que ganham o maior salário 
do seu respectivo departamento
*/

select e.nom_empregado, 
       e.val_salario,
	   e.cod_depto
from empregado e
where e.val_salario =
(select max(val_salario)
from empregado
where cod_depto = e.cod_depto)

/*
Listar o nome dos empregados que ganham mais do que 
a média de salário do seu departamento
*/

select e.nom_empregado, e.val_salario, e.cod_depto
from empregado e
where e.val_salario >
(select avg(val_salario)
from empregado
where cod_depto = e.cod_depto)


/*
Outros operadores

– IN
• Verificar se o valor de uma ou mais colunas estão contidas no resultado de uma subquery
– EXISTS
• Verificar se existe pelo menos uma linha retornada pela subquerycom campos correlacionados

*/

-- Listar o nome dos empregados que possuem dependentes

SELECT e.nom_empregado
FROM empregado AS e
WHERE e.num_matricula IN 
(SELECT num_matricula FROM dependente)

-- Listar o nome dos empregados que não possuem dependentes

SELECT e.nom_empregado
FROM empregado AS e
WHERE e.num_matricula NOT IN 
(SELECT num_matricula FROM dependente)

-- Listar o nome dos empregados que possuem dependente

SELECT e.nom_empregado
FROM empregado as e 
WHERE e.num_matricula IN (SELECT num_matricula FROM dependente)

SELECT e.nom_empregado
FROM empregado AS e WHERE EXISTS (SELECT * FROM dependente AS d WHERE d.num_matricula = e.num_matricula)

SELECT DISTINCT e.nom_empregado FROM empregado as e
JOIN dependente as d ON e.num_matricula = d.num_matricula

-- Listar o nome dos empregados que não possuem dependente

SELECT e.nom_empregado
FROM empregado as e 
WHERE e.num_matricula NOT IN (SELECT num_matricula FROM dependente)

SELECT e.nom_empregado
FROM empregado AS e WHERE NOT EXISTS (SELECT * FROM dependente AS d WHERE d.num_matricula = e.num_matricula)

SELECT DISTINCT e.nom_empregado FROM empregado as e 
LEFT JOIN dependente as d ON e.num_matricula = d.num_matricula
WHERE d.nom_dependente IS NULL

-- Subquerycomo tabela

SELECT x.num_matricula, 
x.nom_empregado
FROM (SELECT * 
FROM empregado) as x

-- Listar o nome dos empregados que ganham o maior salário do seu respectivo departamento

SELECT e.nom_empregado, 
e.val_salario, 
e.cod_depto 
FROM empregado AS e JOIN (SELECT cod_depto, MAX(val_salario) AS maior 
FROM empregado GROUP BY cod_depto) as M ON e.cod_depto = M.cod_depto WHERE e.val_salario = M.maior

-- Listar o nome do empregado e o total de dependentes e cada um deles (exibir todos os empregado)

SELECT e.nom_empregado, 
(SELECT COUNT(*) 
FROM  dependente d 
WHERE d.num_matricula = e.num_matricula) 
AS total
FROM empregado e