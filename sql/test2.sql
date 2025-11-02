-- Скрипт 2/2: Вопросы 51 - 90 (Продолжение загрузки)

-- 1. Убедимся, что расширение для UUID включено
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. DO блок для объявления переменных и атомарного выполнения
DO $$
DECLARE
    -- Переменная для категории
    category_id_var UUID;

    -- Переменные для вопросов и ответов
    q_id_var UUID;
    -- Начинаем с 51 вопроса
    q_number INTEGER := 51; 
    category_name CONSTANT TEXT := 'Интеллектуальные системы обработки больших данных';

BEGIN
    ------------------------------------------------------------------------------------------------
    -- 3. ПОИСК КАТЕГОРИИ
    ------------------------------------------------------------------------------------------------
    -- Получаем ID существующей категории
    SELECT id INTO category_id_var FROM test_categories WHERE name = category_name LIMIT 1;

    -- Проверка, чтобы убедиться, что категория найдена
    IF category_id_var IS NULL THEN
        RAISE EXCEPTION 'Категория "%" не найдена. Убедитесь, что вы сначала выполнили Скрипт 1.', category_name;
    END IF;

    ------------------------------------------------------------------------------------------------
    -- 4. ВСТАВКА ВОПРОСОВ И ОТВЕТОВ (Q51 - Q90)
    ------------------------------------------------------------------------------------------------

    -- Q51: Что такое «Veracity» (достоверность) в Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое «Veracity» (достоверность) в Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Надежность и точность данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Скорость обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Объем информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разнообразие форматов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Ценность данных', FALSE);

    -- Q52: Какое значение имеет NoSQL в обработке больших данных?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое значение имеет NoSQL в обработке больших данных?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Гибкость схемы и горизонтальное масштабирование', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Строгая схема и ACID-транзакции', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Использование только SQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Медленная скорость записи данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение только структурированных данных', FALSE);

    -- Q53: Что такое Elasticsearch?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Elasticsearch?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Поисковый движок и аналитическая платформа', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления ресурсами Hadoop', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система для Big Data', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для создания отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык программирования', FALSE);

    -- Q54: Что такое Data Quality?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Quality?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Совокупность мер по обеспечению точности и полноты данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Объем хранилища данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Скорость передачи данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Форматирование файлов', FALSE);

    -- Q55: Какая из баз данных является NoSQL?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая из баз данных является NoSQL?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MongoDB', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'PostgreSQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Oracle', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MySQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'SQL Server', FALSE);

    -- Q56: Для чего используется Apache Pig?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Для чего используется Apache Pig?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Платформа для выполнения запросов над большими наборами данных в Hadoop', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление кластером', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных NoSQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение файлов', FALSE);

    -- Q57: Какая роль отводится R в анализе данных?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая роль отводится R в анализе данных?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Статистический анализ и графическое представление данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание веб-интерфейсов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разработка операционных систем', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление базами данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сетевое администрирование', FALSE);

    -- Q58: Что такое Data Lineage?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Lineage?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Журнал, который отслеживает путь данных от источника до потребителя', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Способ хранения данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык программирования', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для сжатия файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных', FALSE);

    -- Q59: Какая технология применяется для работы с графовыми данными?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая технология применяется для работы с графовыми данными?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Graph Databases (например, Neo4j)', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Реляционные СУБД', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'HDFS', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MapReduce', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Apache Kafka', FALSE);

    -- Q60: Что такое Real-time Analytics?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Real-time Analytics?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ данных сразу после их поступления', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ архивных данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание годовых отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Форматирование файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие данных', FALSE);

    -- Q61: Что такое Feature Engineering в машинном обучении?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Feature Engineering в машинном обучении?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Процесс создания новых признаков из сырых данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обучение модели', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация результатов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Администрирование базы данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сбор данных', FALSE);

    -- Q62: Какое преимущество у Spark перед MapReduce?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое преимущество у Spark перед MapReduce?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обработка данных в оперативной памяти (in-memory processing)', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Меньший объем данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Более сложный код', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Отсутствие поддержки SQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Использование только HDFS', FALSE);

    -- Q63: Что такое Hadoop YARN?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Hadoop YARN?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления ресурсами кластера', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов', FALSE);

    -- Q64: Что такое Hive?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Hive?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранилище данных, предоставляющее SQL-интерфейс для Hadoop', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'NoSQL база данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Фреймворк для машинного обучения', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система потоковой обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент визуализации', FALSE);

    -- Q65: Что такое Data Mart?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Mart?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Предметно-ориентированное хранилище данных (подмножество Data Warehouse)', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Центральное хранилище всех данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система для потоковой обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Локальный файл с данными', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);

    -- Q66: Какое значение имеет Data Catalog?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое значение имеет Data Catalog?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инвентаризация и метаданные всех данных в организации', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение сырых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для машинного обучения', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сервис для координации кластера', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);

    -- Q67: Что такое Time Series Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Time Series Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Данные, индексированные по времени', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Данные в виде графа', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Только неструктурированные данные', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Данные в формате JSON', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Большой объем текста', FALSE);

    -- Q68: Что такое ETL?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое ETL?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Извлечение, Преобразование, Загрузка (Extract, Transform, Load)', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов к базам данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Программа для сжатия файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Вид неструктурированных данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления ресурсами', FALSE);

    -- Q69: Какой инструмент используется для мониторинга кластера Hadoop?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какой инструмент используется для мониторинга кластера Hadoop?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Ambari', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Spark', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Hive', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Kafka', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MongoDB', FALSE);

    -- Q70: Что такое Machine Learning Model?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Machine Learning Model?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Математическая функция, обученная на данных для прогнозирования', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Операционная система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сервер для хранения данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент визуализации', FALSE);

    -- Q71: Какое значение имеет Spark SQL?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое значение имеет Spark SQL?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Модуль Spark для работы со структурированными данными через SQL', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных SQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления ресурсами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для потоковой обработки', FALSE);

    -- Q72: Что такое Data Security в Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Security в Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Меры по защите данных от несанкционированного доступа', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сбор данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление метаданными', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие данных', FALSE);

    -- Q73: Что такое Predictive Analytics?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Predictive Analytics?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Использование данных для прогнозирования будущих событий', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ текущих данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сбор исторических данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Удаление дубликатов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Форматирование файлов', FALSE);

    -- Q74: Какая из следующих технологий не является частью NoSQL?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая из следующих технологий не является частью NoSQL?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MySQL', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MongoDB', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Cassandra', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Neo4j', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Redis', FALSE);

    -- Q75: Что такое Data Pipeline?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Pipeline?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Серия шагов для перемещения и обработки данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система для сжатия файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных NoSQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент визуализации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык программирования', FALSE);

    -- Q76: Что такое Data Streaming?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Streaming?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Постоянный поток данных, который обрабатывается непрерывно', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение данных в облаке', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание резервных копий', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Пакетная обработка данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);

    -- Q77: Какой инструмент используется для сбора логов?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какой инструмент используется для сбора логов?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Flume / Logstash', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Hive', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Spark SQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'YARN', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Sqoop', FALSE);

    -- Q78: Что такое MapReduce Job?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое MapReduce Job?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Единица работы, выполняющая распределенные вычисления', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент визуализации', FALSE);

    -- Q79: Какое из утверждений верно для Data Lake?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое из утверждений верно для Data Lake?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранит сырые данные без предопределенной схемы', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранит только структурированные данные', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Использует только SQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Предназначен только для отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Имеет строгую схему', FALSE);

    -- Q80: Что такое Data Silo?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Silo?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Изолированное хранилище данных, недоступное другим отделам', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Центральное хранилище всех данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Потоковая обработка данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система для сжатия файлов', FALSE);

    -- Q81: Что такое MongoDB?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое MongoDB?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Документная NoSQL база данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Реляционная база данных SQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык программирования', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);

    -- Q82: Какова роль Apache Flink?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какова роль Apache Flink?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Фреймворк для обработки потоковых и пакетных данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления ресурсами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранилище данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация данных', FALSE);

    -- Q83: Что такое Bias в данных?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Bias в данных?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Систематическое искажение или смещение данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Высокая достоверность данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Большой объем данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Быстрая обработка', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разнообразие форматов', FALSE);

    -- Q84: Какое значение имеет ZooKeeper в экосистеме Hadoop?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое значение имеет ZooKeeper в экосистеме Hadoop?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Координация, управление конфигурацией и синхронизация распределенных сервисов', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обработка данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);

    -- Q85: Что такое «Value» (ценность) в Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое «Value» (ценность) в Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Возможность извлечения полезной информации и прибыли', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Размер данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Скорость обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Достоверность данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разнообразие форматов', FALSE);

    -- Q86: Что такое Hadoop Common?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Hadoop Common?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Базовые утилиты, необходимые для поддержки других модулей Hadoop', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система для потоковой обработки', FALSE);

    -- Q87: Какая роль у Cassandra?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая роль у Cassandra?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Распределенная NoSQL база данных с высокой доступностью', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык программирования', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для ETL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для визуализации', FALSE);

    -- Q88: Что такое Text Mining?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Text Mining?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Извлечение полезной информации из текстовых данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ числовых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация графиков', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание резервных копий', FALSE);

    -- Q89: Какая область применения не относится к Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая область применения не относится к Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Локальная обработка файлов Word', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Персонализированная медицина', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Финансовый мониторинг', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Рекомендательные системы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ поведения потребителей', FALSE);

    -- Q90: Что такое Data Cleansing?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Cleansing?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Процесс обнаружения и исправления ошибок в данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача данных', FALSE);

END $$;