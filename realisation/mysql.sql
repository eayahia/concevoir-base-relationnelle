drop database if exists Ralisation_blog_db;
create database Ralisation_blog_db;
use Ralisation_blog_db;
CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_birth date not null
    
)COMMENT = 'Table of users';

CREATE TABLE category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL
    
)COMMENT = 'Table of category';

CREATE TABLE Posts (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    publish_date DATE NOT NULL,
    statu ENUM('published', 'draft'), 
    id_user INT,
    id_category INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_category) REFERENCES category(id_category)
    
)COMMENT = 'Table of artlicles';

CREATE TABLE comments (
    id_comment INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    publish_date DATE,
    id_user INT,
    id_post INT, 
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_post) REFERENCES Posts(id_post)
    
)COMMENT = 'Table de commentaire';


CREATE INDEX idx_email ON users (email);
CREATE INDEX idx_user ON Posts (id_user);
CREATE INDEX idx_article ON comments (id_post);

INSERT INTO users (user_name, email, date_birth) VALUES
('badr Din', 'Badarbadar@gmail.com', '2003-11-06'),
('Yahia', 'yahialee1@gmail.com', '2000-05-20'),
('Tarik', 'tarik171@gmail.com', '1986-11-08');

INSERT INTO category (category_name) VALUES
('Technologie'),
('Santé'),
('Voyage');

INSERT INTO Posts (title, content, publish_date, id_user) VALUES
('Premier Article', 'Ceci est le contenu du premier article.', '2024-01-10', 1),
('Deuxieme Article', 'Ceci est le contenu du deuxieme article.', '2024-02-15', 2),
('Troisieme Article', 'Ceci est le contenu du troisieme article.', '2024-03-20', 1);

INSERT INTO comments (content, publish_date, id_user, id_post) VALUES
('Perfect article!', '2025-04-11', 1, 1),
('Merci !.', '2026-01-01', 2, 2),
('bon article', '2024-11-21', 3, 3);