-------Insert Aluno-------

INSERT INTO aluno(nome,cpf,telefone,email)
VALUES
('Lucas Costa', '123.456.789-12', '4199887-7654', 'email01@gmail.com'),
('Gabrielle Silva', '432.321.123-22', '4199224-0988', 'email02@gmail.com'),
('Gustavo Nascimento', '645.432.756-55', '4192534-2314', 'email03@gmail.com');

select * from aluno;

-------Insert Matricula-------

INSERT INTO matricula(rgm, curso, id_aluno)
VALUES
('12345678', 'mecatronica', '1'),
('87623456', 'biotecnologia', '2'),
('13298467', 'ciencia_da_computacao', '3');

select * from matricula;

-------Isert Professor-------

INSERT INTO professor(nome, siape, data_contratacao, email)
VALUES
('Professor Alessandro Rocha', '23278492', '20-02-2010', 'professor.email01@gmail.com'),
('Professora Katia lima', '13084627', '07-11-1995', 'professora.email@gmail.com'),
('Professor Pablo Oliveira', '09826735', '10-03-2018', 'professor.email02@gmail.com');

select * from professor;

-------Insert Disciplina----------

INSERT INTO disciplina(nome, semestre, carga_horária, nota, avaliacoes, atividades_extracurriculares, id_aluno, id_professor)
VALUES
('eletronica_analogica', '1°', '120_horas', '7', 'prova_1°_semestre', 'participa_do_projeto_e_monitoria', '1','2'),
('quimica_analitica_aplicada', '2°', '320_horas', '8', 'prova_2°_semestre', 'projeto_integrador', '2', '1'),
('modelagem_de_banco_de_dados', '1°', '80_horas', '3', 'recuperacao_2°_semestre', 'felicidade_e_qualidade_de_vida', '3', '3');

select * from disciplina;

--------Insert Turma---------
INSERT INTO turma(alunos, periodo, horario_aula, id_disciplina, id_aluno)
VALUES
('32_alunos', '2°_turno', '13:30-17:30','1','1'),
('29_alunos', '1°_turno', '06:30-11:30','2','2'),
('32_alunos', '3°_turno', '19:30-22:30','3','3');

select * from turma;

--------Insert Feedback Turma----------
INSERT INTO feedback_turma(feedback, id_turma, id_professor)
VALUES
('otimo_desempenho', '1', '2'),
('mediocre_desempenho', '2', '1'),
('pessimo_desempenho', '3', '3');

select * from feedback_turma;

-----JOIN-------
SELECT
    di.id_disciplina,
    di.avaliacoes,
    pro.nome AS professor,
    pro.siape
FROM disciplina di
JOIN professor pro ON pro.id_professor = di.id_professor;


UPDATE professor
set data_contratacao = '10-03-2018'
where id_professor = 3

UPDATE professor
set data_contratacao = '07-11-1995'
where id_professor = 2

UPDATE professor
set data_contratacao = '20-02-2010'
where id_professor = 1


 DELETE FROM Aluno WHERE id_aluno = 6;
 DELETE FROM Aluno WHERE id_aluno = 5;
 DELETE FROM Aluno WHERE id_aluno = 4;
 
select * from aluno;