/*
Desafio 3 - Utilizando subquery
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas utilizando subquery. Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Listar o nome do empregado e o nome do respectivo departamento para todos os empregados que não estão alocados em projetos, resolver com:

a) NOT EXISTS

b) NOT IN

c) LEFT JOIN

2 - Listar o empregado, o número de horas e o projeto cuja alocação de horas no projeto é maior do que a média de alocação do referido projeto.
*/

use bd_empresa

select *
from empregado

select *
from departamento

select *
from projeto

select *
from alocacao

-- LEFT JOIN

SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
LEFT JOIN alocacao a on a.num_matricula = e.num_matricula 
WHERE a.num_matricula is null

-- NOT EXISTS

SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE NOT EXISTS (SELECT 1 
FROM alocacao a 
WHERE a.num_matricula = e.num_matricula)

-- NOT IN

SELECT nom_empregado, 
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE e.num_matricula NOT IN 
                    (SELECT num_matricula FROM alocacao a)

--2 - Listar o empregado, o número de horas e o projeto cuja alocação de horas no projeto é maior do que a média de alocação do referido projeto.

SELECT a.cod_projeto,
       nom_empregado,  
       nom_projeto, 
       media, 
       SUM(num_horas) AS qtd_horas
FROM empregado e
JOIN alocacao a on a.num_matricula = e.num_matricula
JOIN projeto p on p.cod_projeto = a.cod_projeto
JOIN (SELECT cod_projeto, AVG (num_horas) media
FROM alocacao a 
GROUP BY cod_projeto) a_media ON a.cod_projeto = a_media.cod_projeto
GROUP BY a.cod_projeto, nom_empregado, nom_projeto, media
HAVING SUM(num_horas) > media