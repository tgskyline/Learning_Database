select *
from empregado

alter table empregado add Salario float null

update empregado
set Salario = 1000

/* Operações aritimeticas */

select nomemp, salario, salario + 300
from empregado

select nomemp, salario, 12*salario + 300
from empregado

select nomemp, salario, 12*(salario + 300)
from empregado

select nomemp as nome, salario as pgto, 12*(salario + 300) as SalarioMarior 
from empregado