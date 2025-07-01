### 📘 Aula SQL — **Comandos `INSERT INTO` e `SELECT`**

---

## 🎯 Objetivo:

Aprender como inserir dados em tabelas com `INSERT INTO` e consultar dados com `SELECT`, incluindo filtros com `WHERE` e buscas com `LIKE`.

---

## 1. 📥 **Inserindo dados nas tabelas (`INSERT INTO`)**

A estrutura do comando é:

```sql
INSERT INTO nome_tabela (coluna1, coluna2, ...) 
VALUES (valor1, valor2, ...);
```

Você pode inserir **vários registros de uma só vez**, separando os conjuntos de valores por vírgula.

### ✅ Exemplo 1 — Tabela `viagens.usuarios`:

```sql
INSERT INTO viagens.usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');
```

> Insere três usuários, com dados completos: nome, e-mail, data de nascimento e endereço.

---

### ✅ Exemplo 2 — Tabela `viagens.destinos`:

```sql
INSERT INTO viagens.destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');
```

> Insere três destinos turísticos.

---

### ✅ Exemplo 3 — Tabela `viagens.reservas`:

```sql
INSERT INTO viagens.reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');
```

> Insere três reservas, ligando usuários aos destinos, com a data da viagem e o status.

---

## 2. 🔎 **Consultando dados com `SELECT`**

A estrutura básica é:

```sql
SELECT coluna1, coluna2 FROM nome_tabela WHERE condição;
```

---

### 📄 a) Selecionar todos os dados:

```sql
SELECT * FROM usuarios;
```

> Traz todas as colunas e todos os registros da tabela `usuarios`.

---

### 📧 b) Selecionar apenas nome e e-mail:

```sql
SELECT nome, email FROM usuarios;
```

> Mostra apenas as colunas `nome` e `email`.

---

### 🔍 c) Filtrar por nome específico:

```sql
SELECT * FROM usuarios WHERE nome = 'João Silva';
```

> Traz apenas o registro onde o nome é exatamente **"João Silva"**.

---

### 📅 d) Filtrar por data de nascimento:

```sql
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';
```

> Mostra os usuários nascidos **antes de 1º de janeiro de 1990**.

---

### 🔡 e) Pesquisas com `LIKE`:

* **`%`**: qualquer sequência de caracteres
* **`_`**: exatamente um caractere

```sql
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';
```

> Encontra nomes que **contêm** "Silva" em qualquer posição.

```sql
SELECT * FROM usuarios WHERE nome LIKE 'Jo_o%';
```

> Encontra nomes que **começam com "Jo", têm uma letra qualquer no lugar do "\_" e depois continuam com "o"** (ex: João, Jogo...).

---

## ✅ Conclusão

| Comando                   | Função                                   |
| ------------------------- | ---------------------------------------- |
| `INSERT INTO`             | Insere dados em uma tabela               |
| `SELECT *`                | Retorna todos os dados da tabela         |
| `SELECT coluna1, coluna2` | Retorna colunas específicas              |
| `WHERE`                   | Filtra os dados com base em uma condição |
| `LIKE`                    | Busca com padrões parciais de texto      |

---

Ótimo! Abaixo está o **passo a passo completo** para rodar esse script no **MySQL local**, incluindo:

1. ✅ Instalação (caso não tenha)
2. 🛠️ Abertura do MySQL
3. 📄 Execução do script SQL

---

## ✅ 1. Instalar o MySQL (se ainda não tiver)

Você pode usar:

* **MySQL Community Edition**: [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/)
* Ou instalar o **XAMPP** (vem com MySQL + PHP + Apache): [https://www.apachefriends.org/pt\_br/index.html](https://www.apachefriends.org/pt_br/index.html)

---

## 🛠️ 2. Acessar o MySQL

Você pode usar:

* **MySQL Workbench** (interface gráfica)

* **Linha de comando (CMD/Terminal)** com:

  ```bash
  mysql -u root -p
  ```

* Ou, se estiver usando o XAMPP:

  * Acesse `http://localhost/phpmyadmin`
  * Vá até "SQL" para colar e executar o script.

---

## 📄 3. Script SQL Completo para MySQL

> 💡 Salve isso em um arquivo com extensão `.sql` ou cole direto no Workbench/phpMyAdmin.

```sql
-- Criar schema e usar
CREATE DATABASE IF NOT EXISTS viagens;
USE viagens;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
  id INT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
  email VARCHAR(255) NOT NULL UNIQUE COMMENT 'Endereço de e-mail do usuário',
  data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário',
  endereco VARCHAR(50) NOT NULL COMMENT 'Endereço do Cliente'
);

-- Tabela de destinos
CREATE TABLE IF NOT EXISTS destinos (
  id INT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
  descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do destino'
);

-- Tabela de reservas
CREATE TABLE IF NOT EXISTS reservas (
  id INT PRIMARY KEY COMMENT 'Identificador único da reserva',
  id_usuario INT COMMENT 'Referência ao ID do usuário que fez a reserva',
  id_destino INT COMMENT 'Referência ao ID do destino da reserva',
  data DATE COMMENT 'Data da reserva',
  status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada, etc.)',
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
  FOREIGN KEY (id_destino) REFERENCES destinos(id)
);

-- Inserir usuários
INSERT INTO usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');

-- Inserir destinos
INSERT INTO destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

-- Inserir reservas
INSERT INTO reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');

-- SELECTs de exemplo
SELECT * FROM usuarios;
SELECT nome, email FROM usuarios;
SELECT * FROM usuarios WHERE nome = 'João Silva';
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';
SELECT * FROM usuarios WHERE nome LIKE 'Jo_o%';

-- Atualizar endereço
UPDATE usuarios 
SET endereco = 'Nova Rua, 123' 
WHERE email = 'joao@example.com';

-- Excluir reservas canceladas
DELETE FROM reservas 
WHERE status = 'cancelada';
```

---

