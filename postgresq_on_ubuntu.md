---
layout: page
title: Установка PostgreSQL на Ubuntu
subtitle: Для подключения к r_keeper 7
published: true
readtime: true
tags:
  - postgresql
  - linux
---

В статье описана установка PostgreSQL 13 на Ubuntu 20.04 и последующая настройка связи r_keeper с удалённым сервером PostgreSQL. Установка PostgreSQL на Debian 11 описана в статье по установке r_keeper 7 на Linux.

Перед установкой обновите систему командой
```shell
sudo apt update
sudo apt -y upgrade
```
После обновления системы выполните перезагрузку, чтобы запустить новое ядро. Можно использовать команды `reboot` или `init 6`.

## Добавление репозитория PostgreSQL 13 в Ubuntu
Добавьте репозиторий PostgreSQL
```shell
sudo apt -y install vim bash-completion wget
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/  '`lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
```

# Установка PostgreSQL 13
Установите PostgreSQL 13:
```shell
sudo apt update
sudo apt install postgresql-13 postgresql-client-13
```
Если после установки сервер баз данных не запустился, то выполните запуск командой:
```shell
sudo pg_ctlcluster 13 main start
```
## Проверка соединения с PostgreSQL
Во время установки автоматически создается пользователь postgres. Этот пользователь имеет полный доступ суперадминистратора ко всему экземпляру PostgreSQL. Системный пользователь, вошедший в систему, должен иметь права sudo перед переключением на эту учетную запись.
```shell
sudo su - postgres
```
Чтобы изменить пароль пользователя на надёжный, введите:
```shell
psql -c "alter user postgres with password 'YourSuperPass';"
```
Если PostgreSQL уже запущен, то укажите запрос:
```shell
alter user postgres with password 'YourSuperPass';
```
Запустите командную строку PostgreSQL:
```shell
psql
	psql (13.3 (Ubuntu 13.3-1.pgdg20.04+1))00
```
Введите `help`, чтобы получить справку.
Детализация подключения:
```shell
\conninfo
	Вы подключены к базе данных "postgres" как пользователь "postgres" через сокет в "/var/run/postgresql", порт "5432".
```
## Создание базы данных
Создайте базу данных:
```shell
CREATE DATABASE RK765;
	CREATE DATABASE
```
Создайте пользователя базы данных с паролем
```shell
CREATE USER ucs WITH ENCRYPTED PASSWORD '123';
	CREATE ROLE
```
Назначьте права созданному пользователю в рамках указанной базы данных
```shell
GRANT ALL PRIVILEGES ON DATABASE rk765 to ucs;   
	GRANT
```
Предоставьте созданному пользователю права создавать роли. Эти права необходимы для работы с r_keeper:
```shell
alter role ucs with createrole;
	ALTER ROLE
```Вывести список баз данных
```shell
\l
	postgres=# \l 
 
   Имя    | Владелец | Кодировка | LC_COLLATE  |  LC_CTYPE   |     Права доступа      
-----------+----------+-----------+-------------+-------------+----------------------- 
postgres  | postgres | UTF8      | ru_RU.UTF-8 | ru_RU.UTF-8 |  
rk765     | postgres | UTF8      | ru_RU.UTF-8 | ru_RU.UTF-8 |  
template0 | postgres | UTF8      | ru_RU.UTF-8 | ru_RU.UTF-8 | =c/postgres          + 
          |          |           |             |             | postgres=CTc/postgres 
template1 | postgres | UTF8      | ru_RU.UTF-8 | ru_RU.UTF-8 | =c/postgres          + 
          |          |           |             |             | postgres=CTc/postgres 
(4 строки)
```
Выход из psql 
```shell
\q
```
Выход из суперпользователя postgres
```shell
exit
	logout
```
# Настройка удалённого подключения
PostgreSQL 13 на Ubuntu по умолчанию принимает соединения только от localhost. В производственных обычно используют сервер базы данных и подключенные к нему удаленные клиенты.
## Разрешение удаленного подключения
Чтобы разрешить удаленные подключения, отредактируйте файл конфигурации PostgreSQL:
```shell
sudo nano /etc/postgresql/13/main/postgresql.conf
```
Откроется конфигурационный файл. В нем раскоментируйте или добавьте строчку на выбор:
- прослушивать все интерфейсы:
```shell
listen_addresses = '*'          # Listen on all interfaces
```
- прослушивать только на заданных адресах:
```shell
listen_addresses = '192.168.1.101' # Listen on specified private IP address
```
В нашем случае выбран адрес `192.168.1.101`, у вас будет другой.


Для текстового редактора nano:
- Чтобы сохранить изменения в файле используйте сочетание клавиш `ctrl + o`
- Для выхода из режима редактирования файла используйте `ctrl + x`

## Разрешение приема удаленных подключений
Настройте PostgreSQL на прием удаленных подключений от разрешенных хостов.
Перейдите в конфигурационный файл:
```shell
sudo nano /etc/postgresql/13/main/pg_hba.conf
```
Раскоментируйте или добавьте новую строчку на выбор:
- прием удаленных подключений от всех
```shell
host all all 0.0.0.0/0 md5   # Accept from anywhere
```
- прием удаленных подключений от разрешенных подсетей
```shell
host all all 10.10.10.0/24 md5    # Accept from trusted subnet
```

После изменения перезапустите службу postgresql.
```shell
sudo systemctl restart postgresql
```
Проверьте адрес прослушивания.
```shell
netstat -tunelp | grep 5432
	tcp 0  0 0.0.0.0:5432   0.0.0.0:*     LISTEN   123    4698674  -  tcp6  0   0 :::5432    :::*    LISTEN   123     4698675
```
PostgreSQL настроен и готовк к подключению удаленных клиентов.