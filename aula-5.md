### 📘 Aula SQL — **Chaves Primárias, Auto Incremento e Chaves Estrangeiras**

---

## 🎯 Objetivo:

Aprender a configurar **chaves primárias (`PRIMARY KEY`)**, **auto incremento (`AUTO_INCREMENT`)**, e **chaves estrangeiras (`FOREIGN KEY`)**, além de entender como funciona o **comportamento `ON DELETE CASCADE`**.

---

## 1. 🔑 **Chave Primária (`PRIMARY KEY`) + Auto Incremento**

### O que é uma chave primária?

* Identificador **único** de cada linha em uma tabela.
* Não pode ser **nulo** e não pode se **repetir**.
* Normalmente usada com `id`.

### O que é `AUTO_INCREMENT`?

* Gera **automaticamente** um valor numérico sequencial sempre que um novo registro é inserido.

---

### 🧱 Exemplo: Adicionando chave primária nas tabelas

#### 📄 Tabela `usuarios`:

```sql
ALTER TABLE usuarios
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);
```

#### 📄 Tabela `destinos`:

```sql
ALTER TABLE destinos
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);
```

#### 📄 Tabela `reservas`:

```sql
ALTER TABLE reservas
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);
```

> ✅ Agora, ao inserir novos registros, o campo `id` será gerado automaticamente e servirá como chave única.

---

## 2. ➕ **Inserindo dados sem o campo `id`**

Com `AUTO_INCREMENT`, você **não precisa mais informar o `id` manualmente**:

```sql
-- Inserir em usuarios
INSERT INTO usuarios (nome, email, data_nascimento, endereco)
VALUES ('João Maria', 'joaomaria@example.com', '1990-01-01', 'Rua A, 123');

-- Inserir em destinos
INSERT INTO destinos (nome, descricao)
VALUES ('Praia Teste', 'Destino paradisíaco com belas praias.');

-- Inserir em reservas
INSERT INTO reservas (id_usuario, id_destino, data, status)
VALUES (4, 4, '2023-07-01', 'pendente');
```

> O valor de `id` será gerado automaticamente em cada uma dessas tabelas.

---

## 3. 🔗 **Chaves Estrangeiras (`FOREIGN KEY`)**

### O que são?

São **relacionamentos entre tabelas**, garantindo **integridade referencial** (ou seja, você só pode fazer referência a algo que existe).

---

### 🧱 Exemplo: Relacionando a tabela `reservas`

#### a) Relacionar com `usuarios`:

```sql
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios(id);
```

#### b) Relacionar com `destinos`:

```sql
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_destinos
FOREIGN KEY (id_destino) REFERENCES destinos(id);
```

> Agora, só será possível inserir uma reserva se o `id_usuario` e o `id_destino` **existirem** nas tabelas correspondentes.

---

## 4. 🧨 **Comportamento `ON DELETE CASCADE`**

### O que faz?

Se um **usuário for deletado**, todas as **reservas relacionadas a ele também serão deletadas automaticamente**.

---

### 🧱 Exemplo: Alterar chave estrangeira para `ON DELETE CASCADE`

#### Etapas:

1. Remover a chave estrangeira atual:

```sql
ALTER TABLE reservas
DROP FOREIGN KEY fk_reservas_usuarios;
```

2. Criar novamente com o `ON DELETE CASCADE`:

```sql
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
ON DELETE CASCADE;
```

---

## ✅ Resumo da aula

| Recurso             | Comando-chave                         | Finalidade                                    |
| ------------------- | ------------------------------------- | --------------------------------------------- |
| `PRIMARY KEY`       | `ADD PRIMARY KEY (coluna)`            | Identificador único da tabela                 |
| `AUTO_INCREMENT`    | `MODIFY COLUMN id INT AUTO_INCREMENT` | Geração automática de ID                      |
| `FOREIGN KEY`       | `FOREIGN KEY (...) REFERENCES ...`    | Relaciona dados entre tabelas                 |
| `ON DELETE CASCADE` | Ao apagar pai, apaga filhos           | Automatiza exclusão de registros relacionados |

---

