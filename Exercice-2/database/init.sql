CREATE DATABASE IF NOT EXISTS docker_doc;
CREATE DATABASE IF NOT EXISTS docker_doc_dev;

USE docker_doc;

CREATE TABLE IF NOT EXISTS article (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    body TEXT
);

USE docker_doc_dev;

CREATE TABLE  IF NOT EXISTS article (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    body TEXT
);

INSERT INTO article (title, body)
SELECT 'Docker overview', 'Docker is an open platform for developing, shipping, and running applications.'
WHERE NOT EXISTS (SELECT 1 FROM article WHERE title = 'Docker overview');

INSERT INTO article (title, body)
SELECT 'What is a container?', 'Imagine you’re developing a killer web app that has three main components - a React frontend, a Python API, and a PostgreSQL database. If you wanted to work on this project, you’d have to install Node, Python, and PostgreSQL.'
WHERE NOT EXISTS (SELECT 1 FROM article WHERE title = 'What is a container?');

GRANT ALL PRIVILEGES ON docker_doc.* TO 'db_client'@'%';
GRANT ALL PRIVILEGES ON docker_doc_dev.* TO 'db_client'@'%';
FLUSH PRIVILEGES;
```
