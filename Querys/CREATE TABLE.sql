Create table aluno (matricula int,
nome varchar (30),
constraint pk_matricula primary key (matricula)
);


select * 
from aluno

insert into aluno (matricula, nome) values (10, 'Maria');


Create table empregado
(
MatEmp smallint not null,
NomEmp char (30) not null, 
EndEmp char (80) null,
CidEmp char (20) null,
Constraint PK_EMP primary Key (MatEmp)
);

create table dependente (
nomdep char (30),
datnasc date,
matemp smallint,
constraint pk_dep primary key (matemp, nomdep),
constraint fk_emp_dep foreign key (matemp) references empregado (matemp)
)

drop table dbo.Aluno

drop table dbo.dependente

drop table dbo.Empregado