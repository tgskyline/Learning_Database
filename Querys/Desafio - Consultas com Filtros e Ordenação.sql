/*DESAFIO - Consultas com Filtros e Ordenação*/

/*Acesse o banco de dados bd_filmes e construa consultas SQL conforme solicitado em cada item:

1 - Liste os filmes que estão sem link de foto considerando também os registros sem dados

2 - Liste nome e data de lançamento dos filmes que contenham a palavra 'Bela'

3 - Liste apenas os nomes dos filmes que contenham a palavra 'Bela'  retirando os itens duplicados

4 - Liste a descrição e a quantidade de votos dos filmes que tiveram mais de 1000 votos, ordenar pela quantidade de votos em ordem decrescente

5 - Liste os filmes da série '007' com quantidade de votos acima de 3000 ou nota média acima de 65

6 - Liste nome e o índice de popularidade dos 5 filmes da série '007' com maior popularidade*/

-- 1º Desafio

select * 
from filmes

select * 
from filmes_genero

select * 
from generos

select *
from filmes
where dsc_link_foto is null

-- 2º Desafio

select dsc_filme, dat_lancamento
from filmes
where dsc_filme like '%bela%'

-- 3º Desafio

select distinct dsc_filme
from filmes
where dsc_filme like '%bela%'

-- 4º Desafio

select dsc_filme, qtd_votos
from filmes
where qtd_votos > 1000
order by qtd_votos desc

-- 5º Desafio

select *
from filmes
where dsc_filme like '%007%'
and (qtd_votos > 3000
or num_nota_media > 65)

-- 6º Desafio

select top 5 dsc_filme, num_popularidade
from filmes
where dsc_filme like '%007%'
order by num_popularidade desc