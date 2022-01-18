/*
Desafio 2 - Agrupando dados - GROUP BY
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas utilizando agrupamento de dados. Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Listar a quantidade de empregados com idade média por supervisor

2 - Listar nome dos departamentos com nomes dos empregados e a quantidade de dependentes, se houver.

3 - Listar somente os locais e a quantidade de projetos onde houver mais de 2 projetos alocados
*/

-- 1 - Listar a quantidade de empregados com idade média por supervisor

use bd_empresa

select *
from empregado

SELECT sup.nom_empregado, 
       count(*) AS qtd_empregado, 
       AVG( YEAR(getdate()) - YEAR(e.dat_nascimento)) AS idade_media
FROM empregado e
JOIN empregado sup on sup.num_matricula = e.num_matricula_supervisor
GROUP BY sup.nom_empregado

-- 2 - Listar nome dos departamentos com nomes dos empregados e a quantidade de dependentes, se houver.

select *
from empregado

select * 
from departamento

select *
from dependente

select d.nom_depto, 
	   e.nom_empregado, 
	   count(parent.nom_dependente) as qtd_dependente
from empregado e
left join dependente parent on parent.num_matricula = e.num_matricula
left join departamento d on e.cod_depto = d.cod_depto
group by d.nom_depto, e.nom_empregado
order by 1, 2

-- 3 - Listar somente os locais e a quantidade de projetos onde houver mais de 2 projetos alocados

SELECT nom_local, 
       COUNT(*) qtd_projeto
FROM projeto p
GROUP BY nom_local
HAVING COUNT(*) > 2

