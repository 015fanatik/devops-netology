# Домашнее задание к занятию 4. «PostgreSQL»

## Задача 1

Используя Docker, поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

Подключитесь к БД PostgreSQL, используя `psql`.

Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.

**Найдите и приведите** управляющие команды для:

- вывода списка БД,
  ~~~
  \l+
  ~~~
- подключения к БД,
  ~~~
  \c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}
                         connect to new database (currently "admin")
   ~~~ 

- вывода списка таблиц,
~~~
  \d[S+] list tables, views, and sequences или
\dt[S+] [PATTERN] list tables
~~~
- вывода описания содержимого таблиц,
 ~~~ 
  \dS+ или \dtS+
 ~~~
- выхода из psql.
~~~
  \q
~~~
## Задача 2

Используя `psql`, создайте БД `test_database`.  

~~~
create database test_database;
~~~

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/virt-11/06-db-04-postgresql/test_data).

Восстановите бэкап БД в `test_database`.

~~~
psql -U admin -W test_database < /mount/backup/test_dump.sql;  
~~~

Перейдите в управляющую консоль `psql` внутри контейнера.

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.
~~~
 \c test_database  
~~~

~~~
test_database=# ANALYZE VERBOSE orders;
INFO:  analyzing "public.orders"
INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
~~~


Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` 
с наибольшим средним значением размера элементов в байтах.  

~~~
test_database=# SELECT avg_width,attname FROM pg_stats WHERE tablename='orders' ORDER BY attname DESC;
 avg_width | attname 
-----------+---------
        16 | title
         4 | price
         4 | id
(3 rows)
~~~

**Приведите в ответе** команду, которую вы использовали для вычисления, и полученный результат.

## Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и
поиск по ней занимает долгое время. Вам как успешному выпускнику курсов DevOps в Нетологии предложили
провести разбиение таблицы на 2: шардировать на orders_1 - price>499 и orders_2 - price<=499.

Предложите SQL-транзакцию для проведения этой операции.

~~~
CREATE TABLE orders_1 (CHECK (price > 499)) INHERITS (orders);
CREATE TABLE orders_2 (CHECK (price <= 499)) INHERITS (orders);
INSERT INTO orders_1 SELECT * FROM orders WHERE price > 499;
DELETE FROM only orders WHERE price > 499;
INSERT INTO orders_2 SELECT * FROM orders WHERE price <= 499;
DELETE FROM only orders WHERE price <= 499;
~~~

Можно ли было изначально исключить ручное разбиение при проектировании таблицы orders?

~~~
Можно, если изначально известное распределение по какому-то из полей.
Если мы заранее знаем, что кол-во записей в БД будет равномерно распредлено по какому-то полю,
то шардировать можно при проектировании. Иначе можем получить ситуацию когда на одном шарде 99% записей, на другом 1%
~~~

## Задача 4

Используя утилиту `pg_dump`, создайте бекап БД `test_database`.

~~~
pg_dump -U admin test_database > /mount/backup/test_database.bak
~~~

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

---

Отредактировать файл бекапа добавив UNIQUE.

~~~
CREATE TABLE public.orders (
    id integer  NOT NULL,
    title character varying(80) UNIQUE NOT NULL,
    price integer DEFAULT 0
~~~

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---

