alter table empregado add uf_emp char (2) null

select *
from empregado

select *
from aluno

select *
from dependente

alter table empregado drop column uf_emp

alter table empregado drop constraint pk_emp

alter table dependente drop constraint pk_dep


alter table dependente add constraint pk_dep primary key(matemp, nomdep)

