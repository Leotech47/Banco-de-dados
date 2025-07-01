### 📘 Aula SQL — Funções Agregadas, Agrupamento, Limite e Ordenação

---

## 🎯 Objetivo:

Aprender a usar funções agregadas para cálculo de estatísticas, agrupar resultados, limitar quantidade de linhas retornadas e ordenar os dados.

---

## 1. 🔢 **Funções Agregadas**

São funções que calculam um único valor a partir de várias linhas.

---

### a) Contar registros — `COUNT(*)`

```sql
SELECT COUNT(*) FROM usuarios;
```

> Retorna o **total de usuários cadastrados**.

---

### b) Média da idade — `AVG()`

```sql
SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS idade
FROM usuarios;
```

> Calcula a **média das idades** dos usuários.
> `TIMESTAMPDIFF` calcula a diferença em anos entre a data de nascimento e a data atual.

---

### c) Soma da idade — `SUM()`

```sql
SELECT SUM(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS soma_idades
FROM usuarios;
```

> Soma todas as idades dos usuários.

---

### d) Menor idade — `MIN()`

```sql
SELECT MIN(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS menor_idade
FROM usuarios;
```

> Retorna a **menor idade** entre os usuários.

---

### e) Maior idade — `MAX()`

```sql
SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS maior_idade
FROM usuarios;
```

> Retorna a **maior idade** entre os usuários.

---

## 2. 📊 **Agrupando dados — `GROUP BY`**

### Exemplo: contar reservas por destino

```sql
SELECT id_destino, COUNT(*) AS total_reservas
FROM reservas
GROUP BY id_destino;
```

> Agrupa todas as reservas pelo destino e conta quantas existem para cada um.

---

## 3. 📋 **Limitando resultados — `LIMIT` e `OFFSET`**

* `LIMIT` define o número máximo de registros retornados.
* `OFFSET` pula um número inicial de registros.

---

### Exemplos:

```sql
-- Retorna 1 registro, pulando os 2 primeiros (offset 2)
SELECT id_destino, COUNT(*) AS total_reservas
FROM reservas
GROUP BY id_destino
LIMIT 1 OFFSET 2;

-- Retorna somente 1 registro
SELECT id_destino, COUNT(*) AS total_reservas
FROM reservas
GROUP BY id_destino
LIMIT 1;
```

---

## 4. 🔃 **Ordenando resultados — `ORDER BY`**

### Exemplo 1: ordenar nomes em ordem alfabética crescente (padrão)

```sql
SELECT nome
FROM usuarios
ORDER BY nome;
```

### Exemplo 2: ordenar por data de nascimento e, em caso de empate, por nome crescente

```sql
SELECT nome, data_nascimento
FROM usuarios
ORDER BY data_nascimento, nome;
```

### Exemplo 3: ordenar por data de nascimento crescente e nome em ordem decrescente

```sql
SELECT nome, data_nascimento
FROM usuarios
ORDER BY data_nascimento, nome DESC;
```

---

## ✅ Resumo

| Comando / Função   | O que faz                                     |
| ------------------ | --------------------------------------------- |
| `COUNT(*)`         | Conta o total de registros                    |
| `AVG()`            | Calcula média                                 |
| `SUM()`            | Soma valores                                  |
| `MIN()`            | Retorna o menor valor                         |
| `MAX()`            | Retorna o maior valor                         |
| `GROUP BY`         | Agrupa registros com valores iguais           |
| `LIMIT` e `OFFSET` | Limita e pula registros no resultado          |
| `ORDER BY`         | Ordena os registros por colunas especificadas |

---
