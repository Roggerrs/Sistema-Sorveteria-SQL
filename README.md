# 🔵 **MODELO LÓGICO — RELACIONAMENTOS E CARDINALIDADES (SORVETERIA)**

A seguir está a explicação completa do **modelo lógico do banco de dados da sorveteria**, **sem SELECTs**, contendo apenas a descrição dos **relacionamentos e cardinalidades**, no mesmo padrão do modelo de referência.

---

# 👤 **1. CLIENTE → PEDIDO (1:N)**

### ✔ Relacionamento:

Um **cliente** pode realizar **vários pedidos**.

### ✔ Cardinalidade:

* **CLIENTE (1)** —— realiza ——> **(N) PEDIDOS**
* Na tabela **PEDIDO** existe: `CLIENTE_ID_CLIENTE` como chave estrangeira apontando para `CLIENTE.ID_CLIENTE`.

### ✔ Interpretação:

Cada pedido pertence a **um único cliente**, porém um cliente pode fazer **vários pedidos ao longo do tempo**.

---

# 🧾 **2. PEDIDO → SORVETE (1:N)**

### ✔ Relacionamento:

Um **pedido** pode conter **vários sorvetes**.

### ✔ Cardinalidade:

* **PEDIDO (1)** —— contém ——> **(N) SORVETES**
* Na tabela **SORVETE** existe: `PEDIDO_ID_PEDIDO` como chave estrangeira.

### ✔ Interpretação:

Cada sorvete está associado a **um único pedido**, mas um pedido pode ter **quantos sorvetes forem necessários**.

---

# 📏 **3. TAMANHO → SORVETE (1:N)**

### ✔ Relacionamento:

Um **tamanho** pode ser utilizado em **vários sorvetes**.

### ✔ Cardinalidade:

* **TAMANHO (1)** —— define ——> **(N) SORVETES**
* Na tabela **SORVETE** existe: `TAMANHO_ID_TAMANHO` como chave estrangeira.

### ✔ Interpretação:

Cada sorvete possui **um único tamanho**, porém o mesmo tamanho (ex: Médio, Grande) pode ser usado em vários sorvetes diferentes.

---

# 🍦 **4. SORVETE → SABOR (N:N)**

### ✔ Relacionamento:

Um **sorvete** pode ter **um ou mais sabores**, e um **sabor** pode estar presente em vários sorvetes.

### ✔ Cardinalidade:

* **SORVETE (N)** —— possui ——> **(N) SABORES**
* Relacionamento implementado pela tabela associativa **SORVETE_has_SABOR**.

### ✔ Estrutura da Tabela Associativa:

* `SORVETE_ID_SORVETE` → FK para `SORVETE.ID_SORVETE`
* `SABOR_ID_SABOR` → FK para `SABOR.ID_SABOR`
* Chave primária composta (`SORVETE_ID_SORVETE`, `SABOR_ID_SABOR`)

### ✔ Interpretação:

Esse relacionamento permite representar corretamente sorvetes com **múltiplos sabores**, como por exemplo: chocolate com morango.

---

# 🎯 **RESUMO GERAL DOS RELACIONAMENTOS**

| Tabela Pai | Tabela Filha | Cardinalidade | Explicação                                   |
| ---------- | ------------ | ------------- | -------------------------------------------- |
| CLIENTE    | PEDIDO       | 1 → N         | Um cliente pode fazer vários pedidos         |
| PEDIDO     | SORVETE      | 1 → N         | Um pedido pode conter vários sorvetes        |
| TAMANHO    | SORVETE      | 1 → N         | Um tamanho pode ser usado em vários sorvetes |
| SORVETE    | SABOR        | N → N         | Um sorvete pode ter vários sabores           |

---

# 🔥 **MODELO VISUAL (ER SIMPLIFICADO)**

```
CLIENTE (1) ----< (N) PEDIDO (1) ----< (N) SORVETE >---- (1) TAMANHO
                                   |
                                   V
                             (N) SORVETE_has_SABOR >---- (1) SABOR
```

---

📌 *Modelo lógico desenvolvido para fins acadêmicos, seguindo boas práticas de modelagem relacional.*
