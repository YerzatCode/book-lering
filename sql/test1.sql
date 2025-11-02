-- Скрипт 1/2: Вопросы 1 - 50 (Создание категории и вопросов)

-- 1. Убедимся, что расширение для UUID включено
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. DO блок для объявления переменных и атомарного выполнения
DO $$
DECLARE
    -- Переменная для категории (будет использоваться во всех INSERT'ах)
    category_id_var UUID;

    -- Переменные для вопросов и ответов
    q_id_var UUID;
    q_number INTEGER := 1;
    category_name CONSTANT TEXT := 'Интеллектуальные системы обработки больших данных';

BEGIN
    ------------------------------------------------------------------------------------------------
    -- 3. ВСТАВКА/ПОИСК КАТЕГОРИИ
    ------------------------------------------------------------------------------------------------
    -- Пытаемся найти существующую категорию, если нет - создаем
    SELECT id INTO category_id_var FROM test_categories WHERE name = category_name LIMIT 1;

    IF category_id_var IS NULL THEN
        category_id_var := uuid_generate_v4();
        INSERT INTO test_categories (id, name, description)
        VALUES (
            category_id_var,
            category_name,
            'Полный тест по дисциплине (Часть 1: Вопросы 1-50).'
        );
    END IF;

    ------------------------------------------------------------------------------------------------
    -- 4. ВСТАВКА ВОПРОСОВ И ОТВЕТОВ (Q1 - Q50)
    ------------------------------------------------------------------------------------------------

    -- Q1: Что такое интеллектуальные системы обработки больших данных?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое интеллектуальные системы обработки больших данных?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ больших данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сервисы данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление потоками', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Облачные решения', FALSE);

    -- Q2: Основная цель таких систем — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Основная цель таких систем — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Использование данных эффективно', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение больших данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача данных быстро', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Удаление старых данных', FALSE);

    -- Q3: Что такое Big Data:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Big Data:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Большие объемы данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Только таблицы данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Облачные серверные данные', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Данные IoT платформ', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Маркетинговые отчеты', FALSE);

    -- Q4: Что не относится к характеристикам Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что не относится к характеристикам Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Конфиденциальность данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Объем информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Скорость обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разнообразие форматов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Достоверность анализа', FALSE);

    -- Q5: Что не является этапом работы с Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что не является этапом работы с Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архивирование старых данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сбор новых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ результатов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);

    -- Q6: Какие данные структурированные?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие данные структурированные?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Таблицы с данными', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Текстовые файлы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Видео и аудио', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Аудиофайлы формата', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Графики и схемы', FALSE);

    -- Q7: Для чего применяются такие системы?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Для чего применяются такие системы?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Выявление закономерностей', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие старых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача потоков данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление информацией', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание отчетов вручную', FALSE);

    -- Q8: Что такое анализ данных?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое анализ данных?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Информация из данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Перенос информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Копирование больших данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Упаковка информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие структур', FALSE);

    -- Q9: Технология Big Data — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Технология Big Data — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Hadoop для данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Excel таблицы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'SQL Server базы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Google Docs файлы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Access приложения', FALSE);

    -- Q10: Концепция предсказания событий называется:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Концепция предсказания событий называется:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Прогноз на основе', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архив данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация анализа', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Структура систем', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Потоковая аналитика', FALSE);

    -- Q11: Какие данные чаще всего используются?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие данные чаще всего используются?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разные типы данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Таблицы больших форматов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Видео мультимедиа файлы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Числовые данные таблиц', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Текстовые данные отчетов', FALSE);

    -- Q12: Что означает Data Mining?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что означает Data Mining?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Выявление закономерностей', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Удаление старых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие больших объемов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация текстов', FALSE);

    -- Q13: Машинное обучение — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Машинное обучение — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Автоматический анализ', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Установка программ', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Настройка параметров', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Ввод данных вручную', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача информации', FALSE);

    -- Q14: Что не относится к системам?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что не относится к системам?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие данных систем', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обработка данных потоков', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ больших объемов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Потоковое управление', FALSE);

    -- Q15: Особенность Hadoop — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Особенность Hadoop — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Распределение данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Память системы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Интерфейс пользователя', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Код баз данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Отчеты аналитики', FALSE);

    -- Q16: Что такое Spark?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Spark?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Платформа для анализа', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Программа хранения данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Устройство передачи файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Облако для обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Таблицы Excel файла', FALSE);

    -- Q17: Полуструктурированные данные — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Полуструктурированные данные — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'С метками, но без', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Таблицы формата данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Видео файлы данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Числа с метками форм', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архивы старых данных', FALSE);

    -- Q18: Какой язык чаще используется?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какой язык чаще используется?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Python для анализа', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'PHP веб-данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'JavaScript для форм', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'HTML структура файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'SQL базы данных', FALSE);

    -- Q19: Что не используется с Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что не используется с Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Word текстовый формат', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Hadoop распределение данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Spark для обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MongoDB базы данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Cassandra NoSQL файлы', FALSE);

    -- Q20: Реальная обработка данных — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Реальная обработка данных — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Поток данных онлайн', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архивирование файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача данных быстро', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранилище для данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Графики обработки данных', FALSE);

    -- Q21: Что такое интеллектуальные системы?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое интеллектуальные системы?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Системы для анализа данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Программы для отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Устройства для хранения', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Методы сжатия информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Базы данных', FALSE);

    -- Q22: Основная характеристика Big Data — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Основная характеристика Big Data — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Большие объемы информации', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение на серверах', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача данных по сети', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архивирование старых файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Компактные данные', FALSE);

    -- Q23: Что не является характеристикой Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что не является характеристикой Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Конфиденциальность информации', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Скорость обработки данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Объем больших данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разнообразие форматов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Достоверность сведений', FALSE);

    -- Q24: Основная цель Big Data — это:
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Основная цель Big Data — это:', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Выявление скрытых закономерностей', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Удаление ненужных данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление серверами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Ускорение сети', FALSE);

    -- Q25: Какие данные относятся к неструктурированным?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие данные относятся к неструктурированным?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Изображения и видео', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Таблицы Excel', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Данные SQL Server', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Массивы чисел', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Формат JSON', FALSE);

    -- Q26: Какие из данных считаются полуструктурированными?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие из данных считаются полуструктурированными?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'XML и JSON данные', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Таблицы с числами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Видео в формате MP4', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Графики в PDF', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архивы старых файлов', FALSE);

    -- Q27: Что включает процесс работы с Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что включает процесс работы с Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ и обработка данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Техническое обслуживание серверов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание резервных копий', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обновление программного обеспечения', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Оцифровка документов', FALSE);

    -- Q28: Что такое Data Lake?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Lake?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранилище для сырых данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сервер с таблицами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архив старых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файлы в облаке', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие информации', FALSE);

    -- Q29: Какие задачи решает Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие задачи решает Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ больших массивов данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Ускорение работы сети', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение резервных копий', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление устройствами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Форматирование файлов', FALSE);

    -- Q30: Какой принцип обработки данных используется в Hadoop?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какой принцип обработки данных используется в Hadoop?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Распределение задач между узлами', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Объединение данных в одном сервере', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Перенос данных в облако', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Упаковка информации для передачи', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Автоматическое резервирование', FALSE);

    -- Q31: Какие системы управления базами данных называются NoSQL?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие системы управления базами данных называются NoSQL?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Не имеют строгой схемы таблиц', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Используют только SQL-запросы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранят данные только в виде текста', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Требуют строгого форматирования', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Используют только локальное хранение', FALSE);

    -- Q32: Что такое Stream Processing?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Stream Processing?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обработка данных в реальном времени', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Архивирование старых данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Обработка данных по расписанию', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание резервных копий', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Форматирование файлов', FALSE);

    -- Q33: Какой инструмент используется для ETL-процессов?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какой инструмент используется для ETL-процессов?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Apache Flume', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MySQL Server', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Google Docs', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Microsoft Word', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Visual Studio', FALSE);

    -- Q34: Для чего используется MapReduce?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Для чего используется MapReduce?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Распределенная обработка больших данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление базами данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация отчетов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание интерфейсов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие файлов', FALSE);

    -- Q35: Что такое Data Warehouse?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Warehouse?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранилище для структурированных данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сервер с неструктурированными данными', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База для потоковой обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Локальный файл с отчетами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для визуализации', FALSE);

    -- Q36: Что означает Velocity (скорость) в Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что означает Velocity (скорость) в Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Скорость генерации и обработки данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Размер данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Разнообразие форматов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Достоверность данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Стоимость хранения', FALSE);

    -- Q37: Какой вид анализа данных используется для прогнозирования?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какой вид анализа данных используется для прогнозирования?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Прогнозный (Predictive)', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Описательный (Descriptive)', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Диагностический (Diagnostic)', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Регламентирующий (Prescriptive)', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуальный', FALSE);

    -- Q38: Какие данные хранятся в HDFS?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какие данные хранятся в HDFS?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Большие массивы данных разных форматов', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Только структурированные таблицы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Только логи и метрики системы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Только видеофайлы', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Программы и скрипты', FALSE);

    -- Q39: Что такое Apache Kafka?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Apache Kafka?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Платформа для потоковой обработки данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных NoSQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для визуализации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления базами данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);

    -- Q40: Какова роль Data Scientist?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какова роль Data Scientist?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ данных и создание моделей машинного обучения', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Администрирование серверов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Написание веб-приложений', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание графического дизайна', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Форматирование текстовых документов', FALSE);

    -- Q41: Что такое Визуализация данных?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Визуализация данных?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Графическое представление данных для лучшего понимания', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Математический расчет показателей', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Передача данных по сети', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Хранение больших объемов информации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие файлов', FALSE);

    -- Q42: Какая технология используется для обработки данных в реальном времени?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая технология используется для обработки данных в реальном времени?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Apache Storm/Spark Streaming', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Hadoop MapReduce (для пакетной)', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MySQL Server', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MongoDB', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'HDFS', FALSE);

    -- Q43: Что такое кластеризация в Data Mining?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое кластеризация в Data Mining?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Группировка схожих объектов без предварительного обучения', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Прогнозирование будущих значений', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Определение правильного ответа', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сжатие данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Визуализация графиков', FALSE);

    -- Q44: Какое из следующих утверждений верно для Spark?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какое из следующих утверждений верно для Spark?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Использует оперативную память для обработки данных', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Работает медленнее, чем MapReduce', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Поддерживает только пакетную обработку', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Это только файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Не поддерживает SQL', FALSE);

    -- Q45: Что такое Hadoop Ecosystem?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Hadoop Ecosystem?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Набор связанных инструментов и проектов', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Единственный сервер для хранения данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Специализированный язык программирования', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Только HDFS и MapReduce', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Облачное хранилище', FALSE);

    -- Q46: Что такое ZooKeeper?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое ZooKeeper?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Сервис для координации распределенных систем', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'База данных NoSQL', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык программирования', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Файловая система', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент визуализации', FALSE);

    -- Q47: Что такое Scoop?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Scoop?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для передачи данных между Hadoop и реляционными СУБД', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов к Hadoop', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система управления ресурсами', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Компонент для потоковой обработки', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для машинного обучения', FALSE);

    -- Q48: Что не является компонентом Hadoop?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что не является компонентом Hadoop?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MySQL Server', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'HDFS', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'MapReduce', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'YARN', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Common', FALSE);

    -- Q49: Какая основная проблема решается Big Data?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Какая основная проблема решается Big Data?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Анализ и хранение сверхбольших объемов информации', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Локальное хранение небольших файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Создание веб-сайтов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Управление сетью', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Написание программ на Python', FALSE);

    -- Q50: Что такое Data Governance?
    q_id_var := uuid_generate_v4();
    INSERT INTO questions (id, category_id, question_text, question_number) VALUES (q_id_var, category_id_var, 'Что такое Data Governance?', q_number);
    q_number := q_number + 1;
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Совокупность политик и процедур для управления данными', TRUE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Система для сжатия файлов', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Инструмент для визуализации', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Язык запросов к базам данных', FALSE);
    INSERT INTO answers (question_id, answer_text, is_correct) VALUES (q_id_var, 'Физическое хранилище данных', FALSE);

END $$;