/*Dicas úteis para o SQL Management Studio
*/

-- Comentário para uma linha

/*Comentário para várias linhas*/

-- Trocar de banco de Dados
USE bd_filmes

--Acessar tabela de outro banco de dados
select *
from bd_filmes..filmes

-- OU
select *
from bd_filmes.dbo .filmes


/*Comando para listar as tabelas do banco de dados*/

sp_help

-- Para listar os detalhes de uma tabela

sp_help filmes
