CREATE TABLE IF NOT EXISTS test (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users(
    id int(10) NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id)
)

INSERT INTO test (name) VALUES
('Toto'),
('Jack'),
('Titi');

INSERT INTO users (username, password) VALUES
('jcramirez', '123');
