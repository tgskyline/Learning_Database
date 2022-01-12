/*
Desafio 4 - Formatando o resultado
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas formatando o resultado final. Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_empresa e construa consultas SQL conforme solicitado em cada item:

1 - Liste o número de matrícula e nome dos empregados e seus dependentes, exibindo a coluna 'dependentes' com nome do dependente e o parentesco entre parêntesis . Exemplo: Zezinho (filho)

2 - Liste os departamentos, com seu respectivos gerentes e a data de início da gerência no formato dia-mês-ano

3 - Liste os empregados e horas de alocação em cada projeto no formato abaixo:
       Nome: Rodrigo Moreira Projeto: Migração para SQL 2005 - 10 horas
      Considere todos os funcionários, incluindo os que não tem projeto

 
*/

-- 1 - Liste o número de matrícula e nome dos empregados e seus dependentes, exibindo a coluna 'dependentes' com nome do dependente e o parentesco entre parêntesis . Exemplo: Zezinho (filho)

use bd_empresa

SELECT e.num_matricula, 
       e.nom_empregado, 
       d.nom_dependente + ' (' + RTRIM(d.dsc_parentesco) +')' as dependentes
FROM empregado e
JOIN dependente d ON d.num_matricula = e.num_matricula


-- 2 - Liste os departamentos, com seu respectivos gerentes e a data de início da gerência no formato dia-mês-ano

SELECT nom_empregado, 
       d.nom_depto, 
       convert(varchar(10),d.dat_inicio_gerente, 105) inicio_gerencia
FROM empregado e 
JOIN departamento d on e.num_matricula = d.num_matricula_gerente

/*
3 - Liste os empregados e horas de alocação em cada projeto no formato abaixo:
       Nome: Rodrigo Moreira Projeto: Migração para SQL 2005 - 10 horas
      Considere todos os funcionários, incluindo os que não tem projeto
*/

select 'Nome: '+ nom_empregado + 
       ' Projeto: '+ isnull(nom_projeto, '-')+' - ' + 
       convert (varchar(2), isnull(num_horas,0)) + ' horas' as Alocacao
from empregado e
LEFT JOIN alocacao a on a.num_matricula = e.num_matricula
LEFT JOIN projeto p on p.cod_projeto = a.cod_projeto