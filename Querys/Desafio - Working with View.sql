use bd_filmes

/*
Desafio 5 - Utilizando VIEW
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas utilizando VIEW. Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_filmes e construa consultas SQL conforme solicitado em cada item:

1 - Crie uma view com o nome vw_filmes para listar todos os filmes com descrição, gênero e quantidade de votos 

2 - Utilize a view criada para listar:

a) 3 gêneros mais votados
b) 3 gêneros mais votados entre aqueles com menos de 600 mil votos

 
*/

select *
from filmes

select *
from filmes_genero

select *
from generos

create view vm_filmes
as
select distinct f.dsc_filme, g.dsc_genero, f.qtd_votos
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero

sp_help vm_filmes

sp_helptext vm_filmes

select *
from vm_filmes
order by 3 desc


/*
2 - Utilize a view criada para listar:

a) 3 gêneros mais votados
b) 3 gêneros mais votados entre aqueles com menos de 600 mil votos
*/

-- a) 3 gêneros mais votados

select top 3 dsc_genero
from vm_filmes
order by qtd_votos desc

select top 3 dsc_genero, sum(qtd_votos) as qtd_votos
from vm_filmes
group by dsc_genero
order by qtd_votos desc


-- b) 3 gêneros mais votados entre aqueles com menos de 600 mil votos

select top 3 dsc_genero
from vm_filmes
where qtd_votos < '600'
order by qtd_votos desc

select top 3 dsc_genero, sum(qtd_votos) as qtd_votos
from vm_filmes
group by dsc_genero
having sum(qtd_votos) < 600000
order by qtd_votos desc

-- Respostas da professora

-- 1 - Crie uma view com o nome vw_filmes para listar todos os filmes com descrição, gênero e quantidade de votos 

CREATE VIEW vw_filmes
AS 
  SELECT dsc_filme, 
         dsc_genero, 
         qtd_votos
  FROM filmes f
  JOIN filmes_genero fg ON fg.id_filme = f.id_filme
  JOIN generos g ON g.id_genero = fg.id_genero

-- 2 - Utilize a view criada para listar:

-- a) 3 gêneros mais votados

SELECT dsc_genero, sum(qtd_votos) AS qtd_votos
FROM vm_filmes
GROUP BY dsc_genero
ORDER BY 2 DESC

-- b) 3 gêneros mais votados entre aqueles com menos de 600 mil votos

SELECT dsc_genero, 
       sum(qtd_votos) AS qtd_votos
FROM vm_filmes
GROUP BY dsc_genero
HAVING sum(qtd_votos) < 600000
ORDER BY 2 DESC