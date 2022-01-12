use bd_empresa

/*
Formatação de Resultados usando Concatenação, RTRIM, LTRIM, TRIM, UPPER, LOWER, CONVERT e ISNULL
*/

-- Juntar campos texto para que seja exibidos juntos

-- Usamos o '+' para simbolizar essa ação de concatenar juntas termos nos resultados das querys

select nom_empregado as nome, nom_cidade + '-' + sig_uf as Endereço
from empregado


select nom_empregado as nome, dsc_endereco + '/' + sig_uf as Endereço
from empregado


-- Para retirar espaços em um campo texto, usando RTRIM, LTRIM e TRIM

SELECT  'x' + (' '+nom_depto + ' ') + 'x' AS com_espaços,
		'x' + RTRIM(' '+nom_depto + ' ') + 'x' AS com_RTRIM,
		'x' + LTRIM(' '+nom_depto + ' ') + 'x' AS com_LTRIM,
		'x' + TRIM(' '+nom_depto + ' ') + 'x' AS com_TRIM
FROM departamento
WHERE nom_depto = 'Compras'

-- Para exibir um texto em caixa alta ou baixa

-- ATENÇÃO: As funções UPPER e LOWER ficam de cor diferente porque são termos restritos o que significa que não se pode usar em outros locais

-- Dica: É possível selecionar funções no SQL e usar a combinação de teclas SHIFT + F1 para ser direcionado para o HELP Oficial da Microsoft, link abaixo
-- link: https://docs.microsoft.com/pt-br/sql/t-sql/functions/functions?view=sql-server-ver15

select nom_depto,
		upper(nom_depto) as upper,
		lower(nom_depto) as 'lower'
from departamento


-- Converter diversos tipos de dados - CONVERT

select nom_empregado,
		'Salário:'+CONVERT(varchar(10), val_salario) as Salário
from empregado
where sig_uf = 'MG'

-- Tratando dados NULL na conversão

select nom_empregado,
		'cod depto:'+convert(varchar(10), cod_depto) as Depto,
		'cod depto:'+isnull(convert(varchar(10), cod_depto),'-') as Depto1,
		isnull (cod_depto, 0) -- Também é possível substituir por número
from empregado
where sig_uf = 'SP'

-- Convertendo data e hora em texto

select nom_empregado,
		'Data de nascimento:'+
		convert(varchar(10),dat_nascimento,103) as [Data de nascimento]
from empregado
where sig_uf = 'MG'
