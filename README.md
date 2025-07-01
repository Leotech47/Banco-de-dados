---

# 🗃️ Banco de Dados

## O que é um Banco de Dados?

Um **Banco de Dados (BD)** é uma **coleção organizada de dados** que podem ser acessados, gerenciados e atualizados de forma eficiente. Ele permite o armazenamento estruturado de informações, facilitando sua recuperação e manipulação através de linguagens como **SQL (Structured Query Language)**.

> **Exemplo:** Um sistema de vendas pode usar um banco de dados para armazenar informações sobre produtos, clientes, pedidos e pagamentos.

---

# 🧱 Tipos de Bancos de Dados

Os bancos de dados podem ser classificados conforme a estrutura de dados que utilizam para armazenar e organizar informações:

## 1. **Relacional (RDBMS)**

* Baseado em **tabelas com linhas e colunas**.
* Usa SQL para manipulação de dados.
* **Exemplos:** MySQL, PostgreSQL, Oracle, SQL Server.

📌 **Vantagens:**

* Integridade referencial
* Transações ACID
* Amplo suporte da comunidade

---

## 2. **Não Relacional (NoSQL)**

Criado para lidar com grandes volumes de dados, alta escalabilidade e flexibilidade.

### a) **Documento**

* Armazena dados em formato **JSON** ou **BSON**.
* Exemplo: MongoDB.

### b) **Chave-Valor**

* Armazena pares `chave:valor`.
* Exemplo: Redis.

### c) **Colunar**

* Armazena dados por colunas em vez de linhas.
* Exemplo: Apache Cassandra.

### d) **Grafos**

* Representa dados como **nós e arestas**.
* Exemplo: Neo4j.

📌 **Vantagens dos NoSQL:**

* Alta escalabilidade
* Flexível para alterações de schema
* Ótimo desempenho em leitura/escrita em larga escala

---

## 3. **Orientado a Objetos**

* Armazena dados como **objetos**, como em linguagens OOP (Java, C++).
* Exemplo: db4o, ObjectDB.

---

## 4. **Distribuídos**

* Armazena dados em **múltiplos servidores** geograficamente distribuídos.
* Exemplo: Google Bigtable, Amazon DynamoDB.

---

# 🔢 Tipos de Dados (Data Types)

Cada banco de dados possui tipos de dados específicos para definir o formato do valor armazenado em cada campo. Abaixo, uma visão geral dos tipos mais comuns:

## 1. **Numéricos**

| Tipo      | Descrição                         |
| --------- | --------------------------------- |
| `INT`     | Inteiro (ex: 1, 200, -50)         |
| `FLOAT`   | Ponto flutuante (ex: 3.14)        |
| `DOUBLE`  | Ponto flutuante com mais precisão |
| `DECIMAL` | Valores precisos (financeiros)    |
| `TINYINT` | Inteiros pequenos (0 a 255)       |

---

## 2. **Texto (Strings)**

| Tipo         | Descrição                               |
| ------------ | --------------------------------------- |
| `CHAR(n)`    | Cadeia de caracteres de tamanho fixo    |
| `VARCHAR(n)` | Cadeia de tamanho variável (mais comum) |
| `TEXT`       | Grandes blocos de texto                 |

---

## 3. **Datas e Horas**

| Tipo        | Descrição                      |
| ----------- | ------------------------------ |
| `DATE`      | Data (YYYY-MM-DD)              |
| `TIME`      | Hora (HH\:MM\:SS)              |
| `DATETIME`  | Data e hora juntos             |
| `TIMESTAMP` | Data e hora com marca temporal |

---

## 4. **Booleanos**

| Tipo                | Descrição                              |
| ------------------- | -------------------------------------- |
| `BOOLEAN` ou `BOOL` | Verdadeiro (`TRUE`) ou Falso (`FALSE`) |

---

## 5. **Binários**

| Tipo   | Descrição                                   |
| ------ | ------------------------------------------- |
| `BLOB` | Armazena dados binários (imagens, arquivos) |

---

# ✅ Considerações Finais

* A escolha do tipo de banco de dados depende da **natureza da aplicação**, do **volume de dados** e dos **requisitos de performance e escalabilidade**.
* A definição correta dos **tipos de dados** garante integridade, eficiência e menor uso de recursos.

Se quiser, posso gerar um diagrama conceitual ou um modelo ER para ilustrar algum exemplo prático.

---

Abaixo está um **exemplo de diagrama conceitual** (modelo entidade-relacionamento conceitual) para um sistema simples de **pedidos em uma lanchonete**, em formato textual (Markdown com tabelas e estruturação). Depois, posso gerar também como imagem se preferir.

---

# 📊 Diagrama Conceitual – Sistema de Pedidos

## 🔷 Entidades e Relacionamentos

### 🧑 **Cliente**

| Atributo    | Tipo               |
| ----------- | ------------------ |
| id\_cliente | Identificador (PK) |
| nome        | Texto              |
| telefone    | Texto              |
| email       | Texto              |

---

### 🍔 **Produto**

| Atributo    | Tipo               |
| ----------- | ------------------ |
| id\_produto | Identificador (PK) |
| nome        | Texto              |
| preco       | Numérico           |
| estoque     | Inteiro            |

---

### 📦 **Pedido**

| Atributo    | Tipo               |
| ----------- | ------------------ |
| id\_pedido  | Identificador (PK) |
| data        | Data/Hora          |
| id\_cliente | FK → Cliente       |

---

### 🧾 **ItemPedido** (Entidade Associativa entre Pedido e Produto)

| Atributo        | Tipo         |
| --------------- | ------------ |
| id\_pedido      | FK → Pedido  |
| id\_produto     | FK → Produto |
| quantidade      | Inteiro      |
| preco\_unitario | Numérico     |

---

## 🔗 Relacionamentos

* **Cliente** 1\:N **Pedido**
  → Um cliente pode fazer vários pedidos.

* **Pedido** 1\:N **ItemPedido**
  → Um pedido pode conter vários itens.

* **Produto** 1\:N **ItemPedido**
  → Um produto pode estar em vários pedidos.

---

## 🔄 Resumo Visual (texto simplificado)

```
Cliente (id_cliente, nome, telefone, email)
    |
    | 1:N
    ↓
Pedido (id_pedido, data, id_cliente)
    |
    | 1:N
    ↓
ItemPedido (id_pedido, id_produto, quantidade, preco_unitario)
    ↑
    | N:1
Produto (id_produto, nome, preco, estoque)
```

---


