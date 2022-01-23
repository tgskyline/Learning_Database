use bd_empresa

/*
Operações de Conjuntos
UNION e UNION ALL
– União entre dois conjuntos A e B (UNION) irá incluir os elementos de A e B 
– UNION ALL inclui os elementos duplicados
– A e B devem ter a mesma estrutura (mesmo número de colunas e mesmo 
tipo de dados)
*/

-- Listar o nome dos empregados que são gerentes ou são supervisores com UNION

SELECT e.nom_empregado
FROM empregado e JOIN departamento d 
ON e.num_matricula = d.num_matricula_gerente 

UNION

SELECT e.nom_empregado FROM empregado e 
JOIN empregado sup
ON e.num_matricula = sup.num_matricula_supervisor

-- Listar o nome dos empregados que são gerentes ou são supervisores com UNION ALL

SELECT e.nom_empregado
FROM empregado e JOIN departamento d 
ON e.num_matricula = 
d.num_matricula_gerente 

UNION ALL

SELECT e.nom_empregado
FROM empregado e 
JOIN empregado sup
ON e.num_matricula = 
sup.num_matricula_supervisor

-- Listar o nome dos empregados que são gerentes ou são supervisores, identificando cada um deles

SELECT e.nom_empregado , 'GER' as tipo 
FROM empregado e JOIN departamento d 
ON e.num_matricula = 
d.num_matricula_gerente

UNION

SELECT e.nom_empregado , 'SUP' as tipo FROM empregado e 
JOIN empregado sup
ON e.num_matricula = sup.num_matricula_supervisor

/*
EXCEPT
Retorna todas as linhas do primeiro SELECT, 
exceto as linhas que aparecem nos demais 
SELECTs da query. 
*/

-- Listar o nome dos empregados que são gerentes e não são supervisores com EXCEPT

SELECT e.nom_empregado
FROM empregado e JOIN departamento d 
ON e.num_matricula = d.num_matricula_gerente

EXCEPT

SELECT e.nom_empregado
FROM empregado e 
JOIN empregado sup
ON e.num_matricula = sup.num_matricula_supervisor

/*
INTERSECT
Executa todas as queries associadas a ele, e 
retorna apenas as linhas com registros iguais em 
todas as consultas
*/

-- Listar o nome dos empregados que são gerentes e também são supervisores com INTERSECT

SELECT e.nom_empregado
FROM empregado e JOIN departamento d 
ON e.num_matricula = d.num_matricula_gerente

INTERSECT

SELECT e.nom_empregado
FROM empregado e 
JOIN empregado sup
ON e.num_matricula = sup.num_matricula_supervisor