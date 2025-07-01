### Aula: Criando e Manipulando Tabelas com SQL

---

## 📌 **Objetivo da aula**

Ensinar, de forma clara e objetiva, como:

* Criar tabelas com `CREATE TABLE`
* Inserir dados com `INSERT INTO`
* Consultar dados com `SELECT`
* Atualizar dados com `UPDATE`
* Deletar dados com `DELETE`

---

## 1. 📂 **Criação de Tabelas (`CREATE TABLE`)**

### Tabela `usuarios`

```sql
CREATE TABLE usuarios (
  id INT,
  nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
  email VARCHAR(255) NOT NULL UNIQUE COMMENT 'Endereço de e-mail do usuário',
  data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário',
  endereco VARCHAR(50) NOT NULL COMMENT 'Endereço do Cliente'
);
```

* `id INT`: campo numérico para identificar o usuário.
* `nome VARCHAR(255) NOT NULL`: texto de até 255 caracteres; não pode ser nulo.
* `email VARCHAR(255) NOT NULL UNIQUE`: deve ser único e obrigatório.
* `data_nascimento DATE NOT NULL`: armazena a data de nascimento.
* `endereco VARCHAR(50) NOT NULL`: endereço com até 50 caracteres.

> **`COMMENT`**: apenas uma anotação para documentar o campo.

---

### Tabela `viagens.destinos`

```sql
CREATE TABLE viagens.destinos (
  id INT,
  nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
  descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do destino'
);
```

* Armazena os destinos das viagens.
* `nome` é único: não podem existir dois destinos com o mesmo nome.

---

### Tabela `viagens.reservas`

```sql
CREATE TABLE viagens.reservas (
  id INT COMMENT 'Identificador único da reserva',
  id_usuario INT COMMENT 'Referência ao ID do usuário que fez a reserva',
  id_destino INT COMMENT 'Referência ao ID do destino da reserva',
  data DATE COMMENT 'Data da reserva',
  status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada, etc.)'
);
```

* Tabela de reservas ligando usuários e destinos.
* `status` tem valor padrão **`'pendente'`** se nada for informado.

---

## 2. 📥 **Inserção de Dados (`INSERT INTO`)**

```sql
INSERT INTO viagens.usuarios (...) VALUES (...), (...), (...);
```

* Insere vários registros de uma vez.
* A ordem dos campos deve ser a mesma dos valores.

Exemplo:

```sql
INSERT INTO viagens.destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino');
```

---

## 3. 🔍 **Consultas (`SELECT`)**

### a) Todos os dados:

```sql
SELECT * FROM usuarios;
```

### b) Apenas nome e e-mail:

```sql
SELECT nome, email FROM usuarios;
```

### c) Filtrar por nome exato:

```sql
SELECT * FROM usuarios WHERE nome = 'João Silva';
```

### d) Filtrar por data de nascimento:

```sql
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';
```

### e) `LIKE` — busca aproximada:

```sql
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';  -- contém "Silva"
SELECT * FROM usuarios WHERE nome LIKE 'Jo_o%';    -- começa com "Jo", qualquer caractere no "_", seguido de "o"
```

---

## 4. ✏️ **Atualização (`UPDATE`)**

```sql
UPDATE usuarios 
SET endereco = 'Nova Rua, 123' 
WHERE email = 'joao@example.com';
```

* Atualiza o campo `endereco` apenas do usuário com o e-mail informado.

---

## 5. 🗑️ **Exclusão (`DELETE`)**

```sql
DELETE FROM reservas WHERE status = 'cancelada';
```

* Remove as reservas cujo status é **`cancelada`**.

---

## ✅ **Resumo da aula**

| Comando        | Função                               |
| -------------- | ------------------------------------ |
| `CREATE TABLE` | Cria uma nova tabela                 |
| `INSERT INTO`  | Insere dados nas tabelas             |
| `SELECT`       | Consulta dados                       |
| `UPDATE`       | Atualiza registros existentes        |
| `DELETE`       | Remove registros                     |
| `LIKE`         | Filtra com padrões parciais de texto |

