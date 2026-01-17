-- 4. Análise completa: Professores, turmas e alunos
SELECT
    pro.nome AS professor,
    di.nome AS disciplina,
    COUNT(DISTINCT tu.id_turma) AS numero_turmas,
    COUNT(DISTINCT a.id_aluno) AS total_alunos_nessa_disciplina,
    GROUP_CONCAT(DISTINCT a.nome, ', ') AS lista_alunos
FROM professor pro
LEFT JOIN Turma tu ON pro.id_professor = tu.id_professor
LEFT JOIN disciplina di ON tu.id_disciplina = di.id_disciplina
LEFT JOIN Aluno a ON tu.id_aluno = a.id_aluno
GROUP BY pro.id_professor, di.id_disciplina
ORDER BY pro.nome, di.nome;

-- 5. Carga horária dos professores
SELECT
    pro.nome AS professor,
    COUNT(DISTINCT tu.id_turma) AS total_turmas,
    SUM(
        CAST(
            REPLACE(di.carga_horária, '_horas', '') AS INTEGER
        )
    ) AS carga_horaria_total,
    GROUP_CONCAT(DISTINCT di.nome, ' (', di.carga_horária, ')', ', ') AS disciplinas_e_cargas
FROM professor pro
JOIN Turma tu ON pro.id_professor = tu.id_professor
JOIN disciplina di ON tu.id_disciplina = di.id_disciplina
GROUP BY pro.id_professor
ORDER BY carga_horaria_total DESC;

-- 6. Análise de desempenho por professor
SELECT
    pro.nome AS professor,
    AVG(CAST(di.nota AS REAL)) AS media_notas_turmas,
    COUNT(DISTINCT tu.id_turma) AS total_turmas,
    COUNT(DISTINCT a.id_aluno) AS total_alunos,
    GROUP_CONCAT(DISTINCT ft.feedback, ' | ') AS feedbacks_recebidos
FROM professor pro
LEFT JOIN Turma tu ON pro.id_professor = tu.id_professor
LEFT JOIN disciplina di ON tu.id_disciplina = di.id_disciplina
LEFT JOIN Aluno a ON tu.id_aluno = a.id_aluno
LEFT JOIN Feedback_turma ft ON ft.id_professor = pro.id_professor AND ft.id_turma = tu.id_turma
GROUP BY pro.id_professor
ORDER BY media_notas_turmas DESC;

-- 7. Horários dos professores
SELECT
    pro.nome AS professor,
    tu.periodo,
    tu.horario_aula,
    di.nome AS disciplina,
    COUNT(DISTINCT tu.id_turma) AS turmas_nesse_horario
FROM professor pro
JOIN Turma tu ON pro.id_professor = tu.id_professor
JOIN disciplina di ON tu.id_disciplina = di.id_disciplina
GROUP BY pro.id_professor, tu.periodo, tu.horario_aula
ORDER BY 
    CASE tu.periodo
        WHEN '1°_turno' THEN 1
        WHEN '2°_turno' THEN 2
        WHEN '3°_turno' THEN 3
        ELSE 4
    END,
    pro.nome;
