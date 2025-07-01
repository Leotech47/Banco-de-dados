### 📘 Aula SQL — Inserção de Massa de Dados, Índices e Análise de Consultas

---

## 🎯 Objetivo:

Aprender a inserir muitos dados, usar índices para otimizar consultas e interpretar planos de execução com o comando `EXPLAIN`.

---

## 1. 📝 **Inserção de Massa de Dados**

```sql
INSERT INTO usuarios (nome, email, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
... (outros registros) ...
('Pedro Lima', 'pedro.lima@example.com', '1996-09-27', 'Av. D');
```

### Explicação:

* Insere vários registros em uma única instrução.
* Prático para popular tabelas em ambiente de teste ou inicialização.

---

## 2. 🔍 **Analisando Consultas com `EXPLAIN`**

### Exemplo 1:

```sql
EXPLAIN SELECT * FROM usuarios WHERE nome = "Maria";
```

### Exemplo 2:

```sql
EXPLAIN SELECT * FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario
WHERE nome = "Maria";
```

### O que faz o `EXPLAIN`?

* Mostra como o MySQL planeja executar a consulta.
* Indica se a tabela será escaneada toda (full scan) ou se usará índices.
* Ajuda a identificar consultas lentas e otimizar o banco.

---

## 3. 📈 **Criando Índices para Otimizar Consultas**

```sql
CREATE INDEX idx_nome ON usuarios (nome);
```

### O que é um índice?

* Estrutura que acelera buscas por valores em uma coluna.
* Similar ao índice de um livro, que ajuda a localizar páginas rapidamente.

### Depois de criar índice:

```sql
EXPLAIN SELECT * FROM usuarios WHERE nome = "Maria";
```

* O plano de execução mostrará que agora o índice está sendo usado, tornando a consulta muito mais rápida.

---

## ✅ Resumo da Aula

| Tópico                   | Descrição                                    |
| ------------------------ | -------------------------------------------- |
| Inserção de massa        | `INSERT INTO ... VALUES (...), (...), ...`   |
| EXPLAIN                  | Analisa plano de execução de consultas       |
| Índices (`CREATE INDEX`) | Melhoram desempenho de consultas específicas |

---

