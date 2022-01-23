/*
Desafio 4 - Unindo resultados de queries - UNION
Neste desafio você vai utilizar o SQL Management Studio para fazer algumas consultas unindo resultado de queries diferentes. Se necessário acesse Videoaula - Preparação do ambiente de prática para realizar a configuração.

Acesse o banco de dados bd_filmes e construa consultas SQL conforme solicitado em cada item:

1 - Listar os filmes que são do gênero Guerra ou do Gênero Ação

2 - Listar os filmes que são do gênero Guerra e também do Gênero Ação

3 - Listar os filmes que são do gênero Guerra e não são do Gênero Ação

 */

 -- 1 - Listar os filmes que são do gênero Guerra ou do Gênero Ação

 use bd_filmes

 sp_help

 select *
 from filmes

 select *
 from filmes_genero

  select *
 from generos

 select f.dsc_filme, g.dsc_genero
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Guerra'

UNION

 select f.dsc_filme, g.dsc_genero
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Ação'

order by dsc_genero 

-- 2 - Listar os filmes que são do gênero Guerra e também do Gênero Ação

 select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Guerra'

INTERSECT

 select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Ação'

order by dsc_genero 

-- 3 - Listar os filmes que são do gênero Guerra e não são do Gênero Ação

select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Guerra'

EXCEPT

 select f.dsc_filme
from filmes f
join filmes_genero fg on fg.id_filme = f.id_filme
join generos g on g.id_genero = fg.id_genero
where g.dsc_genero = 'Ação'

order by dsc_genero 


-- Resoluções com duas opções pela professora

-- 1 - Listar os filmes que são do gênero Guerra ou do Gênero Ação

-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
UNION
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Opção 2
SELECT DISTINCT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero IN ('Guerra', 'Ação')

-- 2 - Listar os filmes que são do gênero Guerra e também do Gênero Ação

-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
INTERSECT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Opção 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme IN 
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'Ação')

-- 3 - Listar os filmes que são do gênero Guerra e não são do Gênero Ação

-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
EXCEPT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação'

-- Opção 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme NOT IN 
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'Ação')