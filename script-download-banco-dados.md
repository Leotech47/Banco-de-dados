### 💾 Aula SQL — Criando um **Script de Backup Automático** no MySQL

---

## 🎯 Objetivo:

Aprender como gerar **backups automáticos de um banco de dados MySQL**, usando ferramentas nativas (`mysqldump`) e agendadores (como o **Agendador de Tarefas do Windows**).

---

## 📌 Ferramenta principal: `mysqldump`

É um utilitário do MySQL que exporta o banco como um script `.sql` (estrutura + dados).

---

## 🛠️ 1. Script de Backup (.bat ou .sh)

### ✔️ Windows (arquivo `.bat`)

```bat
@echo off
:: Data atual no formato AAAA-MM-DD
set DATE=%DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%

:: Caminho onde será salvo o backup
set BACKUP_PATH=C:\backups

:: Nome do arquivo com data
set FILENAME=viagens_backup_%DATE%.sql

:: Comando mysqldump
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" -u root -pSUA_SENHA viagens > "%BACKUP_PATH%\%FILENAME%"

echo Backup concluído: %FILENAME%
pause
```

> 🔒 **Substitua `SUA_SENHA` pela senha do seu MySQL**
> 📁 Crie a pasta `C:\backups` ou altere o caminho conforme desejar.
> 💡 Dica: rode manualmente primeiro para testar.

---

### ✔️ Linux/macOS (arquivo `.sh`)

```bash
#!/bin/bash

DATA=$(date +%Y-%m-%d)
BACKUP_DIR="/home/seu_usuario/backups"
FILENAME="viagens_backup_$DATA.sql"

/usr/bin/mysqldump -u root -p'SUA_SENHA' viagens > "$BACKUP_DIR/$FILENAME"
echo "Backup concluído: $FILENAME"
```

> 💡 Rode com `chmod +x backup.sh` e execute com `./backup.sh`

---

## ⏱️ 2. Automação com Agendador

### 🖥️ Windows:

1. Abra o **Agendador de Tarefas**
2. Crie uma nova tarefa
3. Defina a frequência (diário, semanal etc.)
4. Na aba **Ações**, selecione "Iniciar um programa"
5. Aponte para o `.bat` criado

### 🐧 Linux (via `crontab`):

Edite o crontab:

```bash
crontab -e
```

Adicione:

```bash
0 2 * * * /caminho/para/backup.sh
```

> Isso executa o backup **todos os dias às 2h da manhã**

---

## 📁 Resultado esperado:

Você terá arquivos como:

```
C:\backups\viagens_backup_2025-07-01.sql
```

Com todo o conteúdo do banco `viagens`, que pode ser restaurado com:

```bash
mysql -u root -p viagens < viagens_backup_2025-07-01.sql
```

---


