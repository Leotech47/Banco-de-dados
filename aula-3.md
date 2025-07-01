### 📘 Aula SQL — **Comandos `UPDATE` e `DELETE`**

---

## 🎯 Objetivo:

Aprender como **atualizar** e **remover** registros em uma tabela usando os comandos `UPDATE` e `DELETE`, com filtros usando a cláusula `WHERE`.

---

## 1. ✏️ **Atualizando dados com `UPDATE`**

### Sintaxe:

```sql
UPDATE nome_tabela
SET coluna1 = valor1, coluna2 = valor2, ...
WHERE condição;
```

> ⚠️ **Importante:** sempre use `WHERE`, ou todos os registros serão atualizados!

---

### ✅ Exemplo:

```sql
UPDATE usuarios 
SET endereco = 'Nova Rua, 123' 
WHERE email = 'joao@example.com';
```

### 📌 Explicação:

* **Tabela:** `usuarios`
* **Campo a ser alterado:** `endereco`
* **Novo valor:** `'Nova Rua, 123'`
* **Filtro:** apenas onde o `email` for `'joao@example.com'`

> 📍 Resultado: somente o usuário com este e-mail terá seu endereço atualizado.

---

## 2. 🗑️ **Removendo dados com `DELETE`**

### Sintaxe:

```sql
DELETE FROM nome_tabela
WHERE condição;
```

> ⚠️ Sem `WHERE`, todos os dados da tabela serão apagados!

---

### ✅ Exemplo:

```sql
DELETE FROM reservas 
WHERE status = 'cancelada';
```

### 📌 Explicação:

* **Tabela:** `reservas`
* **Filtro:** remove registros onde o `status` for `'cancelada'`

> 📍 Resultado: todas as reservas com status de "cancelada" serão excluídas do banco.

---

## ⚠️ Boas práticas:

| Dica                                        | Explicação                                    |
| ------------------------------------------- | --------------------------------------------- |
| Sempre use `WHERE`                          | Para evitar afetar toda a tabela              |
| Faça `SELECT` antes do `UPDATE` ou `DELETE` | Para conferir os registros que serão afetados |
| Mantenha backup dos dados                   | Principalmente em ambientes de produção       |

---

## ✅ Resumo final

| Comando  | Função                   | Exemplo                                               |
| -------- | ------------------------ | ----------------------------------------------------- |
| `UPDATE` | Altera valores de campos | `UPDATE usuarios SET endereco = 'Novo' WHERE id = 1;` |
| `DELETE` | Remove registros         | `DELETE FROM reservas WHERE status = 'cancelada';`    |

---

