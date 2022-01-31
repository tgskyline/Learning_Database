/*
Manipulação  do banco de dados com INSERT
*/

--  A sintaxe do comando insert é INSERT INTO

insert into empregado (MatEmp, NomEmp, EndEmp, CidEmp) 
values (10, 'Marcos Ramos', 'Rua X', 'Itabira');

select *
from empregado

/*
No exemplo abaixo é mostrado que é possível fazer inserções sem descrever os campos,
mas é necessário ter conhecimento das caracteristicas deles, como quais são númericos ou caracteres
*/

insert into empregado values (11, 'Marcos Ramos', null, 'SP');

insert into empregado (MatEmp, NomEmp, EndEmp, CidEmp) 
values (12, 'Mario Andrade', 'Rua 4', 'Belo Horizonte');

/*
Inserindo Dependentes
*/

insert into dependente (nomdep, datnasc, matemp)
values ('Carlos Ramos', '2003-01-10', 10); 

insert into dependente (nomdep, datnasc, matemp)
values ('Carlos Ramos', '2003-01-10', 11); 

select *
from dependente

/*
Deleção de dados
*/

delete 
from empregado
where matemp = 12

/*
Update
*/

update empregado
set EndEmp = 'Rua Branca'
where matemp = 10

update dependente
set nomdep = 'Joa Andrade'
where matemp = 11


/*
Prática

Agora altere a tabela dependente para propagar a exclusão de um registro
empregado a todos os seus dependentes.
*/

--Uso do comando cria um relacionamento de deleção em cascata quando o registro pai for excluído os relacionado também serão.

alter table dependente drop constraint fk_emp_dep

alter table dependente add constraint fk_emp_dep foreign key
(matemp) references empregado (matemp) On delete cascade

delete 
from empregado
where matemp = 11

select *
from empregado

select *
from dependente