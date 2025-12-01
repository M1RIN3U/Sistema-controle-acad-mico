select * from professor
Order by data_contratacao ASC;

-------quantas aulas cada professor deu para cada turma-----

Select
    pro.nome AS Professor,
    COUNT(tu.id_turma) AS total_aulas
FROM Turma tu
JOIN professor pro ON pro.id_professor = tu.id_professor
GROUP BY pro.nome
HAVING COUNT(tu.id_turma) = 3
Order BY pro.nome;


-------quantas aulas cada aluno participou em cada turma-----
SELECT
    a.nome AS nome_aluno,
    COUNT(tu.id_turma) AS total_aulas
FROM Turma tu
JOIN Aluno a ON a.id_aluno = tu.id_aluno
GROUP BY a.nome  
HAVING COUNT(tu.id_turma) = 3
ORDER BY a.nome;
