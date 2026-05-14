CREATE TABLE unidade_atendimento (
    id_unidade SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(20),
    capacidade_atendimento INTEGER
);

CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo VARCHAR(20),
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    id_unidade INTEGER,
    FOREIGN KEY (id_unidade) REFERENCES unidade_atendimento(id_unidade)
);

CREATE TABLE profissional_saude (
    id_profissional SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    id_unidade INTEGER,
    FOREIGN KEY (id_unidade) REFERENCES unidade_atendimento(id_unidade)
);

CREATE TABLE vacina (
    id_vacina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100),
    quantidade_doses INTEGER NOT NULL,
    intervalo_doses INTEGER
);

CREATE TABLE campanha (
    id_campanha SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    publico_alvo VARCHAR(100),
    id_unidade INTEGER,
    FOREIGN KEY (id_unidade) REFERENCES unidade_atendimento(id_unidade)
);

CREATE TABLE dose_aplicada (
    id_dose SERIAL PRIMARY KEY,
    data_aplicacao DATE NOT NULL,
    numero_dose INTEGER NOT NULL,
    id_paciente INTEGER NOT NULL,
    id_vacina INTEGER NOT NULL,
    id_profissional INTEGER NOT NULL,
    id_unidade INTEGER NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_vacina) REFERENCES vacina(id_vacina),
    FOREIGN KEY (id_profissional) REFERENCES profissional_saude(id_profissional),
    FOREIGN KEY (id_unidade) REFERENCES unidade_atendimento(id_unidade)
);

CREATE TABLE campanha_vacina (
    id_campanha INTEGER NOT NULL,
    id_vacina INTEGER NOT NULL,
    PRIMARY KEY (id_campanha, id_vacina),
    FOREIGN KEY (id_campanha) REFERENCES campanha(id_campanha),
    FOREIGN KEY (id_vacina) REFERENCES vacina(id_vacina)
);

CREATE TABLE campanha_profissional (
    id_campanha INTEGER NOT NULL,
    id_profissional INTEGER NOT NULL,
    PRIMARY KEY (id_campanha, id_profissional),
    FOREIGN KEY (id_campanha) REFERENCES campanha(id_campanha),
    FOREIGN KEY (id_profissional) REFERENCES profissional_saude(id_profissional)
);
