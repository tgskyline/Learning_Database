use bd_filmes

-- Estilos de formatação de Data e Hora

SELECT dat_lancamento, 
CONVERT(varchar,dat_lancamento, 101),
CONVERT(varchar,dat_lancamento, 103),
CONVERT(varchar,dat_lancamento, 114),
CONVERT(varchar,dat_lancamento, 131)
FROM filmes
WHERE dsc_filme = 'Matrix'

/*
Parte de um campo data e hora

• Funções que retornam partes de uma data
–DAY ( date )
–MONTH (date )
–YEAR ( date )
–DATEPART ( datepart , date ) 
*/

use[bd_empresa]
SELECT DATEPART(hh, '19991231 12:10:30.123') as hora,
DATEPART(n,  '19991231 12:10:30.123') as minuto,
DATEPART(ss, '19991231 12:10:30.123') as segundo,
DATEPART(day,  '19991231 12:10:30.123') as dia,
DATEPART(month,'19991231 12:10:30.123') as mes,
DATEPART(year, '19991231 12:10:30.123') as ano,
DATEPART(weekday, '19991231 12:10:30.123') as dia_semana

-- Cálculos entre datas
/*
Posso incrementar, subtrair e até calcular a diferente entre a data atual e o ano da tabela para descobrir a diferente entre anos dias minutos.
*/

/*
• Retornar a data e hora atuais - GETDATE()

SELECT GETDATE()

*/

use[bd_filmes]
SELECT dat_lancamento,
DATEADD (year, 10, dat_lancamento) AS mais_10_anos,
DATEADD (day, -10, dat_lancamento)AS menos_10_dias,
DATEDIFF (year, dat_lancamento, getdate()) AS anos,
DATEDIFF (day, dat_lancamento, getdate()) AS dias
FROM filmes
WHERE dsc_filme = 'Matrix'