DROP TABLE cattoys;
DROP TABLE cats;
DROP TABLE toys;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255), 
    color VARCHAR(255),
    breed VARCHAR(255)

);


CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    price INTEGER,
    color VARCHAR(255),
    name VARCHAR(255)

);

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,
    FOREIGN KEY (toy_id) REFERENCES toys(id),
    FOREIGN KEY (cat_id) REFERENCES cats(id)
);


INSERT INTO
    cats (name, color, breed)
VALUES
    ('Pumpkin', 'orange', 'Birman'),
    ('Jasmine', 'white', 'American-short-hair'),  
    ('Ace', 'black', 'Maine-coon'),
    ('Leo', 'grey', 'Persian'),
    ('Lolita', 'white', 'Ragdoll');

  
INSERT INTO
    toys(price,color,name)
VALUES
    (100,'BLUE','fancy ball'),
    (1,'RED','generic fancy ball'),
    (1000,'BLACK','string'),
    (25,'YELLOW','box'),
    (35,'GREEN','toy snake');
    

INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    (1, 5),
    (2, 4),
    (5, 2),
    (4, 1),
    (3, 3);


    

SELECT 
    toys.name 
FROM 
    toys 
JOIN
    cattoys ON toys.id = cattoys.toy_id 
JOIN 
    cats ON cats.id = cattoys.cat_id 
WHERE
    cats.id = 2

-----------------------------------------

SELECT 
    toys.name, 
    cats.name
FROM 
    toys 
JOIN
    cattoys ON toys.id = cattoys.toy_id 
JOIN 
    cats ON cats.id = cattoys.cat_id 
WHERE 
    toys.color = 'GREEN' AND cats.color = 'white'




  
