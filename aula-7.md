### 📘 Aula SQL — **Refatorando Endereço em Colunas Separadas**

---

## 🎯 Objetivo:

Ensinar como **refatorar** um campo de endereço completo (`endereco`) em colunas separadas: `rua`, `numero`, `cidade` e `estado`, usando comandos SQL.

---

## 🧱 1. Adicionando novas colunas à tabela

```sql
ALTER TABLE usuarios
ADD rua VARCHAR(100),
ADD numero VARCHAR(10),
ADD cidade VARCHAR(50),
ADD estado VARCHAR(50);
```

### 🧩 Explicação:

* Estamos **ampliando a estrutura da tabela** `usuarios`.
* Criamos **quatro novas colunas** para armazenar partes do endereço de forma **organizada e separada**.

---

## 🔄 2. Migrando os dados do campo antigo `endereco`

```sql
UPDATE usuarios
SET 
  rua = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 1), ',', -1),
  numero = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 2), ',', -1),
  cidade = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 3), ',', -1),
  estado = SUBSTRING_INDEX(endereco, ',', -1);
```

### 🧠 Como funciona:

Suponha que a coluna `endereco` tenha valores como:

```
'Rua A, 123, Cidade X, Estado Y'
```

* `SUBSTRING_INDEX(texto, ',', n)` divide o texto e retorna até a **n-ésima vírgula**
* Usamos esse comando de forma **encadeada** para extrair partes específicas

| Parte do endereço | Comando aplicado    | Resultado    |
| ----------------- | ------------------- | ------------ |
| Rua               | `..., 1), ',', -1)` | `"Rua A"`    |
| Número            | `..., 2), ',', -1)` | `"123"`      |
| Cidade            | `..., 3), ',', -1)` | `"Cidade X"` |
| Estado            | `..., -1)`          | `"Estado Y"` |

> ⚠️ Esse método **funciona bem se os dados forem consistentes** (sempre 4 partes separadas por vírgula).

---

## 🗑️ 3. Removendo a coluna antiga `endereco`

```sql
ALTER TABLE usuarios
DROP COLUMN endereco;
```

### ✅ Resultado:

* A tabela agora fica **mais normalizada**.
* Endereço estruturado por campos individuais, o que facilita **consultas, ordenações, filtros e relatórios.**

---

## 🔄 Comparação Antes e Depois

| Antes – Campo único              |
| -------------------------------- |
| 'Rua A, 123, Cidade X, Estado Y' |

\| Depois – Campos separados  |

| rua   | numero | cidade   | estado   |
| ----- | ------ | -------- | -------- |
| Rua A | 123    | Cidade X | Estado Y |

---

## 🧩 Boas práticas:

* Sempre **faça backup antes** de atualizar dados ou alterar estrutura.
* Valide os dados com um `SELECT` antes de usar `UPDATE`.
* Considere tratar exceções, como campos com **formato incorreto**.

---

## ✅ Resumo

| Etapa                | Comando                                     | Objetivo                             |
| -------------------- | ------------------------------------------- | ------------------------------------ |
| Adicionar colunas    | `ALTER TABLE ... ADD`                       | Criar estrutura para rua, número etc |
| Migrar dados         | `UPDATE ... SET ... = SUBSTRING_INDEX(...)` | Separar dados do campo original      |
| Remover campo antigo | `ALTER TABLE ... DROP COLUMN endereco`      | Finalizar refatoração                |

---

