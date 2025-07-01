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
