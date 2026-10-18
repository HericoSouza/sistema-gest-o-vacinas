 <div align="center">

# 💉 Sistema de Gestão de Vacinação e Monitoramento de Doenças

**Modelagem e implementação de banco de dados relacional para gerenciamento de vacinação.**

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Modelagem-F29111?style=for-the-badge&logo=databricks&logoColor=white)
![Projeto Acadêmico](https://img.shields.io/badge/Projeto-Acad%C3%AAmico-2E8B57?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-blue?style=for-the-badge)

[📂 Repositório](https://github.com/HericoSouza/sistema-gest-o-vacinas) · [📄 Script SQL](./sistgest.sql)

</div>

---

## 📖 Sobre o projeto

O **Sistema de Gestão de Vacinação e Monitoramento de Doenças** é um projeto acadêmico desenvolvido para a disciplina **DIM0114 — Banco de Dados**, ministrada pelo professor Marcus Vinicius Alencar Terra.

O objetivo é aplicar conceitos de modelagem e implementação de bancos de dados relacionais em um cenário de saúde pública, organizando informações sobre pacientes, profissionais da saúde, unidades de atendimento, vacinas, campanhas e aplicações de doses.

O projeto utiliza SQL para definir a estrutura das tabelas, os relacionamentos entre as entidades e as restrições necessárias para manter a integridade dos dados.

> 🎓 Este projeto foi desenvolvido com finalidade acadêmica e pode servir como base para estudos e futuras expansões de sistemas de informação na área da saúde.

## 🎯 Objetivos

- Estruturar um banco de dados relacional para gerenciamento de vacinação.
- Representar entidades e relacionamentos por meio de um modelo de dados.
- Aplicar chaves primárias e estrangeiras para manter a integridade referencial.
- Organizar informações de pacientes, unidades e profissionais de saúde.
- Modelar campanhas de vacinação e registrar as doses aplicadas.
- Praticar a utilização de SQL e PostgreSQL na criação de estruturas de banco de dados.

## ✨ Estrutura do banco de dados

O script `sistgest.sql` define oito tabelas principais.

| Tabela | Responsabilidade |
|---|---|
| `unidade_atendimento` | Armazena nome, endereço, telefone e capacidade de atendimento das unidades. |
| `paciente` | Registra dados dos pacientes e sua associação com uma unidade de atendimento. |
| `profissional_saude` | Armazena os dados dos profissionais, suas especialidades e unidades associadas. |
| `vacina` | Registra nome, fabricante, quantidade de doses e intervalo entre doses. |
| `campanha` | Armazena informações das campanhas, período de realização e público-alvo. |
| `dose_aplicada` | Registra a data da aplicação, o número da dose e as entidades relacionadas. |
| `campanha_vacina` | Relaciona campanhas às vacinas utilizadas. |
| `campanha_profissional` | Relaciona campanhas aos profissionais envolvidos. |

### 🔗 Relacionamentos

A modelagem utiliza chaves estrangeiras para estabelecer relações entre as entidades.

- Uma unidade de atendimento pode estar associada a diversos pacientes e profissionais.
- Uma campanha pode estar associada a uma unidade de atendimento.
- A tabela `dose_aplicada` relaciona pacientes, vacinas, profissionais e unidades.
- As tabelas `campanha_vacina` e `campanha_profissional` representam relacionamentos entre campanhas e, respectivamente, vacinas e profissionais.

As tabelas associativas utilizam chaves primárias compostas para identificar cada associação de maneira única.

## 🛠️ Tecnologias utilizadas

| Tecnologia | Aplicação |
|---|---|
| **PostgreSQL** | Sistema gerenciador de banco de dados relacional. |
| **SQL** | Linguagem utilizada para definir as tabelas e restrições. |
| **BR Modelo Web** | Ferramenta utilizada no contexto da modelagem de dados. |

## 🚀 Instalação e execução

### 1. Pré-requisitos

Antes de executar o projeto, é necessário ter:

- [PostgreSQL](https://www.postgresql.org/download/) instalado.
- Um cliente SQL, como o [pgAdmin](https://www.pgadmin.org/) ou o terminal `psql`.
- O arquivo `sistgest.sql`, disponível neste repositório.

### 2. Clone o repositório

Abra o terminal e execute:

```bash
git clone https://github.com/HericoSouza/sistema-gest-o-vacinas.git
cd sistema-gest-o-vacinas
```

Alternativamente, baixe o repositório como ZIP pelo GitHub e extraia os arquivos.

### 3. Crie o banco de dados

No terminal, utilizando o PostgreSQL, execute:

```bash
createdb -U postgres sisgest
```

Esse comando cria um banco chamado `sisgest`. O usuário `postgres` é o nome padrão mais comum, mas você deve substituí-lo caso utilize outro usuário.

### 4. Execute o script SQL

Na pasta onde está o arquivo `sistgest.sql`, execute:

```bash
psql -U postgres -d sisgest -f sistgest.sql
```

O comando executa o script e cria as tabelas e os relacionamentos definidos no arquivo.

**Alternativa com pgAdmin:**

1. Abra o pgAdmin e conecte-se ao servidor PostgreSQL.
2. Crie um banco de dados chamado `sisgest`.
3. Selecione o banco recém-criado.
4. Abra a ferramenta **Query Tool**.
5. Abra ou cole o conteúdo de `sistgest.sql`.
6. Execute o script e verifique se as tabelas foram criadas.

### 5. Verifique as tabelas criadas

No `psql`, conecte-se ao banco:

```bash
psql -U postgres -d sisgest
```

Liste as tabelas:

```sql
\dt
```

Para consultar a estrutura de uma tabela específica:

```sql
\d paciente
```

## 🧪 Exemplos de consultas SQL

Após criar as tabelas, você pode consultar as informações utilizando comandos SQL.

### Consultar pacientes cadastrados

```sql
SELECT *
FROM paciente;
```

### Consultar vacinas disponíveis no cadastro

```sql
SELECT
    id_vacina,
    nome,
    fabricante,
    quantidade_doses,
    intervalo_doses
FROM vacina;
```

### Consultar doses aplicadas com informações do paciente e da vacina

```sql
SELECT
    p.nome AS paciente,
    v.nome AS vacina,
    d.data_aplicacao,
    d.numero_dose,
    d.id_unidade
FROM dose_aplicada d
JOIN paciente p
    ON p.id_paciente = d.id_paciente
JOIN vacina v
    ON v.id_vacina = d.id_vacina
ORDER BY d.data_aplicacao;
```

Esses exemplos permitem explorar as relações definidas no banco. Caso ainda não tenham sido inseridos dados, as consultas retornarão conjuntos vazios.

## 🧠 Conceitos de banco de dados aplicados

O projeto permite praticar conceitos importantes da disciplina:

- **Modelagem conceitual:** representação das entidades e de seus relacionamentos.
- **Modelo lógico relacional:** organização dos dados em tabelas.
- **Chave primária (`PRIMARY KEY`):** identificação única dos registros.
- **Chave estrangeira (`FOREIGN KEY`):** estabelecimento de relacionamentos e integridade referencial.
- **Restrições (`NOT NULL` e `UNIQUE`):** exigência de campos obrigatórios e prevenção de duplicidades em atributos específicos.
- **Relacionamentos muitos-para-muitos:** utilização de tabelas associativas.
- **Tipos de dados:** escolha de tipos como `VARCHAR`, `INTEGER`, `DATE` e `SERIAL`.
- **Consultas relacionais:** recuperação de informações por meio de `SELECT` e `JOIN`.

## 📁 Estrutura do repositório

```text
sistema-gest-o-vacinas/
├── README.md
└── sistgest.sql
```

- `README.md`: documentação do projeto, instruções de instalação e exemplos de uso.
- `sistgest.sql`: script de criação do esquema do banco de dados.

## 🔭 Possíveis melhorias futuras

O projeto pode ser expandido com novas funcionalidades, como:

- Inserção de dados de exemplo para testes.
- Consultas para identificar pacientes com doses pendentes.
- Consultas de cobertura vacinal por unidade ou campanha.
- Controle de estoque e lotes de vacinas.
- Regras para validar intervalos entre doses.
- Estruturas específicas para registro e acompanhamento de doenças.
- Consultas e relatórios gerenciais para campanhas de vacinação.

Essas são sugestões de evolução, não funcionalidades já implementadas pelo script atual.

## ⚠️ Escopo da versão atual

A versão documentada concentra-se na criação do esquema relacional de vacinação, campanhas, pacientes, profissionais e unidades de atendimento. Embora o nome do projeto também mencione monitoramento de doenças, o script SQL atual não define uma tabela específica de doenças nem implementa uma aplicação completa com interface de usuário.

## 🎓 Contexto acadêmico

**Disciplina:** DIM0114 — Banco de Dados  
**Professor:** Marcus Vinicius Alencar Terra  
**Autor:** Hérico Marques de Melo Mendes de Souza

O projeto foi desenvolvido como exercício prático de modelagem relacional e implementação de estruturas de banco de dados com SQL e PostgreSQL.

---

<div align="center">

**Projeto acadêmico — Banco de Dados**

[⬆ Voltar ao início](#-sistema-de-gestão-de-vacinação-e-monitoramento-de-doenças)

</div>
