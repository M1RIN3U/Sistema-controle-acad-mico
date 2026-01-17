-- Aluno + Disciplina + Professor
SELECT
    di.id_disciplina,
    di.nome AS nome_disciplina,
    a.nome AS nome_aluno,
    pro.nome AS nome_professor,
    pro.id_professor,
    di.semestre,
    di.nota
FROM Aluno a                -- Tabela principal
JOIN disciplina di
    ON a.id_aluno = di.id_aluno -- JOIN Aluno + Disciplina
JOIN professor pro                
    ON pro.id_professor = di.id_professor -- JOIN Professor + Disciplina
ORDER BY a.nome, di.nome;

-- Aluno + Matrícula
SELECT
    a.nome AS aluno,
    a.cpf,
    a.email,
    ma.id_matricula,
    ma.rgm AS rgm_aluno,
    ma.curso
FROM Aluno a            -- Tabela principal
JOIN Matricula ma
    ON a.id_aluno = ma.id_aluno
ORDER BY a.nome;

-- Aluno + Turma + Disciplina + Professor 
SELECT
   a.id_aluno,
   a.nome AS nome_aluno,
   di.nome AS disciplina,
   tu.periodo AS periodo_turma,
   tu.horario_aula,
   pro.nome AS nome_professor,
   pro.id_professor
FROM Aluno a                -- Tabela principal
JOIN Turma tu
    ON a.id_aluno = tu.id_aluno     -- JOIN Aluno + Turma
JOIN disciplina di
    ON tu.id_disciplina = di.id_disciplina -- JOIN Turma + Disciplina
JOIN professor pro
    ON pro.id_professor = tu.id_professor -- JOIN Professor + Turma
ORDER BY tu.periodo, a.nome;
