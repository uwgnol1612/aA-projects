DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users(
id INTEGER PRIMARY KEY,
fname VARCHAR(255) NOT NULL,
lname VARCHAR(255) NOT NULL
);
 


CREATE TABLE questions(
id INTEGER PRIMARY KEY,
title VARCHAR(255),
body TEXT,
author_id INTEGER,

FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows(
id INTEGER PRIMARY KEY,
question_id INTEGER,
author_id INTEGER,

FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
question_id INTEGER,
parent_reply_id INTEGER,
author_id INTEGER,
body TEXT, 

FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (author_id) REFERENCES users(id),
FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,     

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO 
    users(fname, lname)
VALUES
    ('Long', 'McFarlin'),
    ('Jonathan', 'Johnson'),
    ('Trevor', 'Uptain');

INSERT INTO 
    questions(title, body, author_id)
VALUES 
    ('class', 'What is class in Ruby?', (SELECT users.id FROM users WHERE fname = 'Trevor' AND lname = 'Uptain')),
    ('coding', 'What is coding?', (SELECT users.id FROM users WHERE fname = 'Jonathan' AND lname = 'Johnson')),
    ('cat', 'What is your favorite breed?', (SELECT users.id FROM users WHERE fname = 'Long' AND lname = 'McFarlin'));

INSERT INTO 
    question_follows(author_id, question_id)
VALUES 
    (1, 3),
    (2, 2),
    (3, 1),
    (1, 2),
    (2, 1),
    (3, 2);

INSERT INTO
    replies(question_id, parent_reply_id, author_id, body)
VALUES 
    (1, NULL, 3, 'A class is a blueprint from which objects are created'),
    (1, 1, 2, 'The object is also called as an instance of a class'),
    (2, NULL, 2, 'Coding is what makes it possible for us to create computer software, apps and websites'),
    (2, 3, 3, 'That''s why we are here!'),
    (2, 4, 1, 'But coding is hard...');


INSERT INTO
    question_likes(question_id, user_id)
VALUES
    (2,1),
    (1,2),
    (1,1),
    (2,3),
    (3,1),
    (1,3);






