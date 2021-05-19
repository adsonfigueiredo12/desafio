-----  QUESTÃO 08
/*8. Informações sobre animais de estimação são mantidos em duas tabelas separadas:

TABLE dogs
id INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL

TABLE cats
id INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL

Escreva uma consulta SQL que selecione o nome de todos os animais de estimação de maneira distinta.*/


SELECT
DISTINCT(NAME) AS NAME
FROM (SELECT NAME FROM CATS
      UNION SELECT NAME FROM DOGS)