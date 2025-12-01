-----Aluno+disciplina+professor------
Select
    di.id_disciplina,
    di.nome AS nome_disciplina,
    a.nome AS nome_aluno,
    pro.id_professor
FROM Aluno a                ----Tabela principal
JOIN disciplina di
    ON a.id_aluno = di.id_aluno ----JOIN A+Di
JOIN professor pro                
    ON pro.id_professor = di.id_professor;      -----JOIN pro+di

---------Aluno+Matricula---------
------ Filtrar Aluno----------
Select
    a.nome AS aluno,
    a.cpf,
    ma.id_matricula,
    ma.rgm AS rgm_aluno
FROM Aluno a            ----Tabela principal
JOIN Matricula ma
    ON a.id_aluno = ma.id_aluno;

---------Aluno+Turma--------------
Select
   a.id_aluno,
   a.nome AS nome_aluno,
   pro.id_professor,
   tu.periodo AS periodo_turma,
   pro.nome AS nome_professor
FROM Aluno a                ----Tabela principal
JOIN Turma tu
    ON a.id_aluno = tu.id_aluno     -----JOIN a+tu
JOIN professor pro
    ON pro.id_professor = tu.id_professor;     -----JOIN pro+tu
    



