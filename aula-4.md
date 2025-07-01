### 📘 Aula SQL — **Migração de Dados e Alteração de Estrutura de Tabela**

---

## 🎯 Objetivo:

Aprender a:

* Criar uma nova tabela com estrutura modificada
* Migrar dados de uma tabela antiga para a nova
* Substituir a tabela antiga pela nova
* Ou, alternativamente, alterar diretamente a estrutura de uma coluna

---

## 1. 🆕 **Criando uma nova tabela com alterações**

```sql
CREATE TABLE usuarios_nova (
  id INT,
  nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
  email VARCHAR(255) NOT NULL UNIQUE COMMENT 'Endereço de e-mail do usuário',
  data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário',
  endereco VARCHAR(100) NOT NULL COMMENT 'Endereço do Cliente'
);
```

### 🔎 O que mudou?

* A tabela `usuarios_nova` foi criada com a mesma estrutura da anterior.
* A **coluna `endereco` foi aumentada** de `VARCHAR(50)` para `VARCHAR(100)`.

---

## 2. 🔁 **Migrando os dados da tabela antiga**

```sql
INSERT INTO usuarios_nova
SELECT * FROM usuarios;
```

### Como funciona:

* `SELECT * FROM usuarios` busca todos os dados da tabela antiga.
* `INSERT INTO usuarios_nova` insere esses dados na nova estrutura.

> ⚠️ Importante: as tabelas devem ter as **mesmas colunas e na mesma ordem**.

---

## 3. 🗑️ **Excluindo a tabela antiga**

```sql
DROP TABLE usuarios;
```

> Remove definitivamente a tabela `usuarios` do banco de dados.

> ⚠️ Atenção: **isso apaga tudo** da tabela original. Só execute após verificar que a migração foi feita corretamente.

---

## 4. 🔄 **Renomeando a nova tabela**

```sql
ALTER TABLE usuarios_nova RENAME usuarios;
```

> A nova tabela agora passa a se chamar `usuarios`, substituindo a original com a nova estrutura.

---

## ✅ Alternativa: **Alterar apenas a coluna**

Se quiser apenas **aumentar o tamanho da coluna `endereco`** sem criar nova tabela:

```sql
ALTER TABLE usuarios MODIFY COLUMN endereco VARCHAR(100);
```

### Quando usar essa opção:

* Quando a tabela já está funcionando e só precisa de **ajuste simples**
* Evita ter que migrar e apagar a tabela

> 🔐 Sempre faça backup antes de alterações estruturais.

---

## 📌 Resumo da aula

| Ação                          | Comando                                                     |
| ----------------------------- | ----------------------------------------------------------- |
| Criar nova tabela             | `CREATE TABLE usuarios_nova (...)`                          |
| Copiar dados da tabela antiga | `INSERT INTO usuarios_nova SELECT * FROM usuarios;`         |
| Apagar tabela antiga          | `DROP TABLE usuarios;`                                      |
| Renomear tabela nova          | `ALTER TABLE usuarios_nova RENAME usuarios;`                |
| Alterar coluna diretamente    | `ALTER TABLE usuarios MODIFY COLUMN endereco VARCHAR(100);` |

---

