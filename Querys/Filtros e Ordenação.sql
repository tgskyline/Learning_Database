-- Filtrar campos NULL

select *
from empregado

select nom_empregado,num_matricula_supervisor
from empregado
where num_matricula_supervisor is not null

select nom_empregado,num_matricula_supervisor
from empregado
where num_matricula_supervisor is null

select nom_empregado,num_matricula_supervisor
from empregado
where num_matricula_supervisor = null


--  Filtrar texto parcial

-- Començando com 'filh'
select nom_dependente,dsc_parentesco
from dependente
where dsc_parentesco like 'filh%'

-- Terminando com 'o'
select nom_dependente,dsc_parentesco
from dependente
where nom_dependente like '%o'

-- Entre termos que tenham 'a'
select nom_dependente,dsc_parentesco
from dependente
where nom_dependente like '$a %'

-- Filtrar uma lista de valores com IN

select nom_empregado, val_salario
from empregado
where val_salario in (2000,2500,2800,1700)

-- Posso fazer lista com texto desde que seja a senteça inteira
select nom_empregado, val_salario
from empregado
where nom_empregado in ('José da Silva', 'João Oliveira')


-- Filtrar intervalo de valores - BETWEEN

select nom_empregado, val_salario
from empregado
where val_salario BETWEEN 2000 AND 3000

select nom_empregado, val_salario
from empregado
where val_salario > 2000 AND val_salario <= 3000

select nom_empregado, val_salario
from empregado
where nom_empregado BETWEEN 'A' AND 'M'

-- Ordenação crescente  - ORDER BY

-- Decrescente
select nom_empregado, val_salario
from empregado
ORDER BY val_salario DESC

-- Crescente
select nom_empregado, val_salario
from empregado
ORDER BY val_salario


select nom_empregado, val_salario, sex_empregado
from empregado
ORDER BY sex_empregado, val_salario  DESC

select nom_empregado, val_salario, sex_empregado
from empregado
ORDER BY sex_empregado DESC, val_salario  DESC


-- Restrição de quantidade de registros

-- O valor do TOP pode ser de escolha livre mas deve vir logo depois do SELECT
select TOP 3 nom_empregado, val_salario
from empregado
ORDER BY val_salario DESC

-- Retirar linhas com dados duplicados com DISTINCT

select nom_local
from projeto

select DISTINCT TOP 3 nom_local
from projeto
