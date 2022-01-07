-- AND e OR com Where

select *
from empregado
where val_salario >= 2000
and sex_empregado = 'M'
or sig_uf = 'MG'

-- Aplicação de precedência para firmar uma exatidão na busca

select *
from empregado
where val_salario >= 2000
and (sex_empregado = 'M'
or sig_uf = 'MG')