CREATE TABLE articles (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    author TEXT NOT NULL,
    date_published DATE,
    status TEXT
);
INSERT INTO articles (id, title, content, author, date_published, status)
VALUES
(1, 'SQL Basics', 'Introduction to SQL language', 'Ahmed', '2024-05-01', 'published'),
(2, 'Databases', 'Understanding relational databases', 'Sara', '2024-05-10', 'draft');
SELECT * FROM articles;
DELETE FROM articles
WHERE id = 2;
SELECT titre
FROM Article
ORDER BY date_pub DESC
