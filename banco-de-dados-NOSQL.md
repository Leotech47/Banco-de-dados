---

## 🎓 Aula: Banco de Dados Não Relacional (NoSQL)

---

### 1️⃣ CONCEITO

**NoSQL** (Not Only SQL) é uma classe de bancos de dados que **não seguem o modelo relacional tradicional (tabelas com linhas e colunas)**.
São ideais para **grandes volumes de dados, com estrutura flexível e em constante evolução**.

🔹 Principais características:

* Escalabilidade horizontal (servidores distribuídos)
* Alta performance em leituras/gravações
* Estrutura de dados flexível (documentos, grafos, chave-valor, etc.)
* Ideal para dados semi-estruturados e não estruturados

---

### 2️⃣ MODELOS DE BANCOS NoSQL

| Modelo         | Exemplo          | Características principais              | Uso comum                              |
| -------------- | ---------------- | --------------------------------------- | -------------------------------------- |
| 📄 Documento   | MongoDB, CouchDB | JSON ou BSON como estrutura de dados    | APIs, microserviços, apps web/móveis   |
| 🔑 Chave-valor | Redis, DynamoDB  | Dados acessados por uma chave única     | Cache, sessões de usuário, filas       |
| 🧱 Colunar     | Cassandra, HBase | Armazena colunas por bloco              | Big Data, análise de dados massivos    |
| 🔗 Grafos      | Neo4j, ArangoDB  | Foco em relacionamentos entre entidades | Redes sociais, motores de recomendação |

---

### 3️⃣ APLICAÇÕES PRÁTICAS

✅ **Plataformas de streaming:** histórico e recomendações personalizadas
✅ **E-commerces dinâmicos:** gerenciamento de produtos com diferentes atributos
✅ **Jogos online e apps móveis:** armazenam dados de sessão, progresso e eventos
✅ **Sistemas de IoT:** coleta de dados em tempo real de milhares de sensores
✅ **Redes sociais:** modelagem de conexões entre usuários com grafos

---

### 4️⃣ PASSO A PASSO: CRIANDO UM BANCO NoSQL

Vamos usar o **MongoDB**, um dos bancos NoSQL mais populares do mercado.

#### 🛠️ Pré-requisitos:

* Instalar o [MongoDB Compass](https://www.mongodb.com/try/download/compass) (interface gráfica)
* Ou usar o [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) (versão em nuvem gratuita)

#### Passo 1 – Criar banco e coleção:

```js
// No MongoDB, criamos coleções (semelhantes a tabelas)
use hamburgueria

db.pedidos.insertOne({
  cliente: "João Silva",
  itens: [
    { produto: "X-Burguer", qtd: 1, preco: 18.5 },
    { produto: "Refrigerante", qtd: 1, preco: 6.0 }
  ],
  total: 24.5,
  data: new Date()
})
```

#### Passo 2 – Buscar documentos:

```js
db.pedidos.find()
```

#### Passo 3 – Filtrar por cliente:

```js
db.pedidos.find({ cliente: "João Silva" })
```

#### Passo 4 – Atualizar pedido:

```js
db.pedidos.updateOne(
  { cliente: "João Silva" },
  { $set: { total: 25.0 } }
)
```

#### Passo 5 – Excluir documento:

```js
db.pedidos.deleteOne({ cliente: "João Silva" })
```

---

### 5️⃣ DIFERENÇAS RESUMIDAS: SQL vs NoSQL

| Aspecto          | SQL                         | NoSQL                              |
| ---------------- | --------------------------- | ---------------------------------- |
| Estrutura        | Tabelas                     | Documentos, grafos, chave-valor    |
| Esquema (schema) | Fixo                        | Flexível                           |
| Escalabilidade   | Vertical (1 servidor maior) | Horizontal (vários servidores)     |
| Consistência     | Alta (ACID)                 | Eventual, mas altamente disponível |
| Flexibilidade    | Menor                       | Alta                               |

---

### ✅ CONCLUSÃO

🔹 **NoSQL** é ideal quando você precisa de:

* Flexibilidade de dados
* Escalabilidade em larga escala
* Performance em tempo real

🔹 Aprender bancos NoSQL, como **MongoDB**, é essencial para atuar com aplicações modernas, Big Data, e sistemas distribuídos.

---

