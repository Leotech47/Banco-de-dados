### 📘 Aula SQL — Joins, Subconsultas e Contagens

---

## 🎯 Objetivo:

Aprender a:

* Inserir dados
* Trabalhar com **JOINS** (INNER, LEFT, RIGHT)
* Utilizar **subconsultas** para exclusão e contagem
* Combinar dados de várias tabelas com eficiência

---

## 1. 🧾 **Inserindo dados**

### ✅ Exemplo:

```sql
INSERT INTO usuarios (nome, email, data_nascimento, rua, numero, cidade, estado) 
VALUES ('Usuario sem reservas', 'semreservar@teste.com', '1990-10-10', 'Rua','123','cidade','estado');
```

> Adiciona um usuário **sem reservas** (importante para testes de joins e subconsultas).

---

## 2. 🔗 **JOINS: combinando dados entre tabelas**

---

### 🔍 **INNER JOIN** — Somente os que têm relação

```sql
SELECT * FROM usuarios us
INNER JOIN reservas rs
  ON us.id = rs.id_usuario;
```

> Traz **apenas os usuários que fizeram reservas**.

---

### 🔍 **LEFT JOIN** — Todos os da esquerda, mesmo sem relação

```sql
SELECT * FROM usuarios us
LEFT JOIN reservas rs
  ON us.id = rs.id_usuario;
```

> Traz **todos os usuários**, incluindo os que **não têm reservas**.

---

### 🔍 **RIGHT JOIN / LEFT JOIN invertido** — Todos os da direita

```sql
SELECT * FROM reservas rs
RIGHT JOIN destinos des
  ON des.id = rs.id_destino;
```

ou

```sql
SELECT * FROM destinos des
LEFT JOIN reservas rs
  ON des.id = rs.id_destino;
```

> Ambos trazem **todos os destinos**, incluindo os que **nunca foram reservados**.

---

## 3. 🔍 **Subconsultas: filtros com base em outra tabela**

---

### ❌ Usuários que **não** fizeram reserva

```sql
SELECT nome
FROM usuarios
WHERE id NOT IN (
  SELECT id_usuario FROM reservas
);
```

> Mostra os usuários **que não aparecem na tabela de reservas**.

---

### ❌ Destinos **sem nenhuma reserva**

```sql
SELECT nome
FROM destinos
WHERE id NOT IN (
  SELECT id_destino FROM reservas
)
ORDER BY id;
```

> Mostra os destinos que **nunca foram reservados**.

---

## 4. 🔢 **Contagem de reservas por usuário**

```sql
SELECT nome,
  (SELECT COUNT(*) 
   FROM reservas 
   WHERE id_usuario = usuarios.id) AS total_reservas
FROM usuarios;
```

> Subconsulta retorna o **número de reservas feitas por cada usuário**, mesmo que seja zero.

---

## ✅ Resumo da aula

| Técnica                | Exemplo                                    | Objetivo                                |
| ---------------------- | ------------------------------------------ | --------------------------------------- |
| `INNER JOIN`           | Usuários **com** reserva                   | Dados relacionados em ambas as tabelas  |
| `LEFT JOIN`            | Todos os usuários, com ou sem reserva      | Inclui quem não tem relacionamento      |
| `RIGHT JOIN`           | Todos os destinos, com ou sem reserva      | Útil para identificar destinos "vazios" |
| `NOT IN (subconsulta)` | Filtrar usuários/destinos **sem reservas** | Excluir com base em outra tabela        |
| `SELECT COUNT(*)`      | Contar reservas por usuário                | Gera relatórios de uso                  |

---

