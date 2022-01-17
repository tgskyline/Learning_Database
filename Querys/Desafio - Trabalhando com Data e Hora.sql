/*
Desafio 1 - Trabalhando com data e hora
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas utilizando campos do tipo data e hora. Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Gerar a lista de aniversariantes da empresa com mês, dia e nome do empregado ordem cronológica

2 - Listar os departamentos e seus gerentes com tempo de gerência em anos ordenando pelo mais antigo

3 - Listar os funcionários  que terão mais que 65 a partir de 2021
*/

use bd_empresa

-- 1 - Gerar a lista de aniversariantes da empresa com mês, dia e nome do empregado ordem cronológica

SELECT MONTH(dat_nascimento) AS Mês, 
       DAY (dat_nascimento) AS Dia, 
       nom_empregado
FROM empregado
ORDER BY 1, 2

-- 2 - Listar os departamentos e seus gerentes com tempo de gerência em anos ordenando pelo mais antigo

-- Opção 1
SELECT nom_depto, 
       nom_empregado, 
       YEAR(getdate()) - YEAR(dat_inicio_gerente) tempo_gerencia
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente
ORDER BY 3 DESC

-- Opção 2
SELECT nom_depto, 
       nom_empregado, 
       DATEDIFF(year, dat_inicio_gerente, getdate())tempo_gerencia
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente
ORDER BY 3 DESC

-- 3 - Listar os funcionários  que terão mais que 65 a partir de 2021

-- Opção 1
SELECT nom_empregado, 
       YEAR(getdate()) - YEAR(dat_nascimento) AS idade_atual,
       YEAR(getdate()) + 1 - YEAR(dat_nascimento) AS idade_proximo_ano
FROM empregado
WHERE YEAR(getdate()) + 1 - YEAR(dat_nascimento) >= 65

-- Opção 2
SELECT nom_empregado, 
       DATEDIFF(year, dat_nascimento, getdate()) AS idade_atual,
       DATEDIFF(year, dat_nascimento, DATEADD(year, 1, getdate()) ) AS idade_proximo_ano
FROM empregado
WHERE YEAR(getdate()) + 1 - YEAR(dat_nascimento) >= 65
