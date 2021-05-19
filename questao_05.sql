---- QUESTÃO 05
/*5. Considere o seguinte problema

São fornecidas duas tabelas: Alunos e Notas.

Alunos contém três colunas: ID, Nome e Valor.

Coluna	Tipo
ID	Inteiro
Nome	String
Valor	Inteiro
Notas possui os seguintes dados:

Nota	Valor_Min	Valor_Max
1	0	9
2	10	19
3	20	29
4	30	39
5	40	49
6	50	59
7	60	69
8	70	79
9	80	89
10     	90             	100            

Joana dá a Eva a tarefa de gerar um relatório contendo três colunas: Nome, Nota e Valor. Joana não quer os Nomes dos alunos que receberam uma nota inferior a 8. O relatório deve estar em ordem decrescente por nota, ou seja, as notas mais altas são inseridas primeiro. Se houver mais de um aluno com a mesma nota (8-10) atribuído a eles, ordene esses alunos em particular por seus nomes em ordem alfabética. Por fim, se a nota for inferior a 8, use "NULL" como nome e liste-os por notas em ordem decrescente. Se houver mais de um aluno com a mesma nota (1-7) atribuído a eles, ordene esses alunos em particular por suas notas em ordem crescente.

Escreva uma consulta SQL para ajudar Eva.

Exemplo de entrada
ID	Nome	Valor
1	Julia	81
2	Carol	68
3	Maria	99
4	Andreia	78
5	Jaqueline	63
6	Marcela	88
Exemplo de saída
Maria 10 99
Marcela 9 88
Julia 9 81
Andreia 8 78
NULL 7 63
NULL 7 68
Observação: Imprima "NULL" no nome se a nota for inferior a 8.

Explicação
Considere a seguinte tabela com as notas atribuídas aos alunos:

ID	Nome	Valor 	Nota
1	Julia	81	9
2	Carol	68	7
3	Maria	99	10
4	Andreia	78	8
5	Jaqueline	63	7
6	Marcela	88	9

Assim, os seguintes alunos obtiveram notas 8, 9 ou 10:
Maria (10)
Marcela (9)
Julia (9)
Andreia (8)*/

SELECT
CASE WHEN NOTA < 8 THEN 'NULL' ELSE NOME END AS NOME,
NOTA,
VALOR
      FROM (SELECT NOME,
            VALOR,
            (SELECT NOTA FROM NOTAS WHERE ALUNOS.VALOR BETWEEN NOTAS.VALOR_MIN AND NOTAS.VALOR_MAX ) AS NOTA  
            FROM ALUNOS)
ORDER BY NOTA DESC, VALOR ASC

