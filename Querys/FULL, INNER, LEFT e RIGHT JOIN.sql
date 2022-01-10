use bd_empresa

/*
Uso do FULL, INNER, LEFT e RIGHT JOIN
*/

-- Situação 1: Listar todos os empregados e seus departamentos usando JOIN

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
join departamento d on d.cod_depto = e.cod_depto

-- Situação 2: Listar todos os empregados e seus departamentos, incluindo empregados que não tem departamento associado usando LEFT JOIN

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
left join departamento d on d.cod_depto = e.cod_depto

-- Situação 3: Listar todos os empregados e seus departamentos, incluindo departamentos que não tem empregados associados usando RIGTH JOIN

 select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
 from empregado e
 right join departamento d on d.cod_depto = e.cod_depto

 -- Situação 4: Listar todos os empregados e seus departamentos, incluindo empregados sem departamento e departamento de empregados usando FULL JOIN

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
full join departamento d on d.cod_depto = e.cod_depto

-- Situação 5: Listar todos os empregados que não tem departamento associado usando LEFT JOIN com WHERE

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
left join departamento d on d.cod_depto = e.cod_depto
where d.cod_depto is null

-- Situação 6: Listar todos os departamentos que não tem empregado associado RIGHT JOIN com WHERE		

select e.num_matricula, e.nom_empregado, d.cod_depto, d.nom_depto
from empregado e
right join departamento d on d.cod_depto = e.cod_depto
where e.cod_depto is null