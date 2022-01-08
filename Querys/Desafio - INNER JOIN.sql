/*Desafio 2 - Consultas juntando tabelas com INNER JOIN
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas juntando dados de tabelas diferentes.

Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Liste o número de matrícula e nome do empregados e nome e parentesco de todos os dependentes

2 - Liste nome dos departamentos com número de matrícula e nome de todos os funcionário. Ordene o resultado por departamento e nome do empregado.

3 - Para cada departamento um dos funcionários tem a função de gerência. Liste nome dos departamentos com número de matrícula e nome do gerente responsável.

4 - Liste o número de matrícula e nome dos supervisores e número de matrícula e nome dos funcionários sob sua supervisão. Ordene os supervisores e empregados em ordem alfabética

5 - Liste os funcionários dos projetos de BH com o total de horas alocado.  Exibir nome e local do projeto, número de matrícula e nome do empregado e o total de horas alocado.

 */

 -- 1 - Liste o número de matrícula e nome do empregados e nome e parentesco de todos os dependentes

 select * 
 from empregado

 select *
 from dependente

 select *
 from departamento

 select E.num_matricula, E.nom_empregado, D.dsc_parentesco, D.nom_dependente
 from empregado E
 join dependente D on E.num_matricula = D.num_matricula

 -- 2 - Liste nome dos departamentos com número de matrícula e nome de todos os funcionário. Ordene o resultado por departamento e nome do empregado.

 select * 
 from empregado

 select *
 from departamento

 select d.nom_depto, e.num_matricula, e.nom_empregado
 from empregado e
 join departamento d on e.cod_depto = d.cod_depto
 order by nom_depto, nom_empregado

 -- 3 - Para cada departamento um dos funcionários tem a função de gerência. Liste nome dos departamentos com número de matrícula e nome do gerente responsável.

 select * 
 from empregado

 select *
 from departamento

 select d.nom_depto, e.num_matricula, e.nom_empregado
 from empregado e
 join departamento d on e.num_matricula = d.num_matricula_gerente

 -- 4 - Liste o número de matrícula e nome dos supervisores e número de matrícula e nome dos funcionários sob sua supervisão. Ordene os supervisores e empregados em ordem alfabética

 select * 
 from empregado

 select *
 from departamento

 select sup.num_matricula as matricula_supervisor,
		sup.nom_empregado as nome_supervisor,
		e.num_matricula as matricula_empregado, 
		e.nom_empregado as nome_empregado
 from empregado e
 join empregado sup on e.num_matricula = sup.num_matricula_supervisor

 -- 5 - Liste os funcionários dos projetos de BH com o total de horas alocado.  Exibir nome e local do projeto, número de matrícula e nome do empregado e o total de horas alocado.

  select * 
 from empregado

  select *
 from alocacao

  select *
 from projeto

  select p.nom_projeto as nome_projeto, 
		 p.nom_local as local_projeto, 
		 e.num_matricula as matricula_empregado,
		 e.nom_empregado as nome_empregado, 
		 al.num_horas as total_horas
 from projeto p
 inner join alocacao al on p.cod_projeto = al.cod_projeto
 inner join empregado e on e.num_matricula = al.num_matricula
 Where nom_local = 'BH'

