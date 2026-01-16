-----TABELA ALUNO----------
BEGIN TRANSACTION;
Create table Aluno(
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT, 
    nome TEXT(80) NOT NULL,
    cpf TEXT(14) NOT NULL,
    telefone TEXT(16) NOT NULL,
    email TEXT NOT NULL
);

------TABELA MATRICULA-------
Create table Matricula(
    id_matricula INTEGER PRIMARY KEY AUTOINCREMENT,
    rgm TEXT(8) NOT NULL,
    curso TEXT(80) NOT NULL,
    id_aluno INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

------TABELA PROFESSOR-------
Create table professor(
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(80) NOT NULL,
    siape TEXT(20) NOT NULL,
    data_contratacao TEXT NOT NULL,
    email TEXT NOT NULL
);

-----TABELA DISCIPLINA-------
Create table disciplina(
    id_disciplina INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(80) NOT NULL,
    semestre TEXT(3), 
    carga_horária TEXT,
    nota TEXT, 
    avaliacoes INT,
    atividades_extracurriculares TEXT,
    id_aluno INTEGER,
    id_professor INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

------TABELA TURMA-------
Create table Turma(
    id_turma INTEGER PRIMARY KEY AUTOINCREMENT,
    alunos INT,
    periodo TEXT,
    horario_aula TEXT NOT NULL,
    id_disciplina INTEGER,
    id_aluno INTEGER,
    id_professor INTEGER,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

--------TABELA FEEDBACK_TURMA----
Create table Feedback_turma(
    feedback TEXT(100),
    id_turma INTEGER,
    id_professor INTEGER,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor) 

    commit
);

