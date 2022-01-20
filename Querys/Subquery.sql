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




