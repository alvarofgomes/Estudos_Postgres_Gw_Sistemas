-- terça 18/11/2025

-- Tipos Numericos

	-- INTEGER
	-- REAL
	-- SERIAL
	-- NUMERIC

-- Tipos Texto

	-- VARCHAR(N)
	-- CHAR (N)
	-- TEXT

-- Tipos Boolean

	 -- BOOLEAN

-- Tipos Data/Hora

	-- DATE
	-- TIME
	-- TIMESTAMP

CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT, 
	idade INTEGER,
	dinheiro NUMERIC,
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula DATE,
	matriculado_em TIMESTAMP
);

UPDATE aluno
	SET nome = 'Nico',
	cpf = '12345678901',
	observacao = 'textoooooooooooooooooo', 
	idade = 38,
	dinheiro = 15,23,
	altura = 1.90,
	ativo = FALSE
	data_nascimento = '1980-01-15',
	hora_aula DATE = '13:00:00',
	matriculado_em = '2020-02-02' WHERE id = 1;

INSERT INTO aluno(id,nome,cpf,observacao,idade,dinheiro,altura,data_nascimento,hora_aula,matriculado_em) 
VALUES (3,'joão','13345678901','textoooo',35,100.50,1.81,'1984-08-27','12-09-2000','2020-02-08 12:32:45');

SELECT * FROM aluno WHERE id = 1;

SELECT nome FROM aluno;

-- filtro LIKE / NOT LIKE

	-- Funciona como se fosse um parecido

SELECT * FROM aluno WHERE nome LIKE '_iogo';

	-- NOT LIKE 

	-- ignora o que foi passado

SELECT * FROM aluno WHERE nome NOT LIKE 'Di_go';

-- Vai encontrar todos que tem D

SELECT * FROM aluno WHERE nome LIKE 'D%';

-- Filtros IS NULL / IS NOT NULL

	-- Retorna tudo que for nulo

SELECT * FROM aluno WHERE cpf IS NULL;

	-- Retorna tudo não está nullo

SELECT * FROM aluno WHERE id IS NOT NULL;	

CREATE TABLE curso(
id INTEGER PRIMARY KEY,
nome VARCHAR(255)
);

SELECT * FROM aluno_curso;
SELECT * FROM curso;

CREATE TABLE aluno_curso(
aluno_id INTEGER,
curso_id INTEGER,
PRIMARY KEY(aluno_id,curso_id)

FOREIGN KEY (aluno_id)
REFERENCES aluno(id),

FOREIGN KEY (curso_id)
REFERENCES curso(id)

);

SELECT aluno.nome AS "Nome do Aluno", curso.nome AS "Nome do Curso" FROM aluno JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id;

-- quarta 19/11/2025

/*
lembrar de colocar o id como SERIAL e LEMBRAR DE DEIXAR O SERIAL gerar os id para o serial não ficar travado 
em loop como se tivesse gerando o id 1 sendo que já definimos o id 1 na mão ele não consegue replicar o id 1
pq já existe ent trava e vai ter que definir na mão todos id. é tbm não colocar not null porque ele tbm solicita
o id manual obrigando sempre ter mesmo com o serial.
*/

INSERT INTO aluno(nome) VALUES ('guilherme');
INSERT INTO curso(id,nome) VALUES (3,'CSS');
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1),(3,1);

SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM aluno_curso;

SELECT aluno.nome AS "Nome do aluno", curso.nome AS "Nome do curso" 
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id;

-- LEFT JOIN: vai ter dados da tabela da esquerda e não vai ter dados da tabela da direita
-- ex: da tabela aluno ele vai trazer todos aluno até os que não estão cadastrados em um curso

SELECT aluno.nome AS nome_do_aluno, curso.nome AS nome_do_curso FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
LEFT JOIN curso ON curso.id = aluno_curso.curso_id;
-- inverso do left
SELECT aluno.nome AS nome_do_aluno, curso.nome AS nome_do_curso FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id;
-- FULL JOIN tras todos os dados
SELECT aluno.nome AS nome_do_aluno, curso.nome AS nome_do_curso FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id;

-- CROSS JOIN: o comamdo replica todos os dados para os alunos nesse caso de tabela chama todos dados para todos ele replica os dados paraa cada um da tabela

SELECT aluno.nome AS "nome do aluno", curso.nome AS "nome do curso" FROM aluno
CROSS JOIN curso;

-- DELETE CASCADE: 
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso(
aluno_id INTEGER,
curso_id INTEGER,
PRIMARY KEY(aluno_id, curso_id),

FOREIGN KEY(aluno_id)
REFERENCES aluno(id)
ON DELETE CASCADE,

FOREIGN KEY(curso_id)
REFERENCES curso(id)
);

DELETE FROM aluno WHERE id = 1;

-- UPDATE CASCADE

UPDATE aluno SET id = 10 WHERE id = 2;

CREATE TABLE aluno_curso(
aluno_id INTEGER,
curso_id INTEGER,
PRIMARY KEY(aluno_id, curso_id),

FOREIGN KEY(aluno_id)
REFERENCES aluno(id)
ON DELETE CASCADE
ON UPDATE CASCADE,

FOREIGN KEY(curso_id)
REFERENCES curso(id)
);

SELECT aluno.id AS aluno_id, aluno.nome AS "Nome do aluno", curso.id AS curso_id, curso.nome AS "Nome do curso" 
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id;
