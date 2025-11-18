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


