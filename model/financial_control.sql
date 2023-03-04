DROP DATABASE IF EXISTS financial_control;
-- Cria o banco de dados usando UTF-8 e buscas case-insensitive.
CREATE DATABASE financial_control CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados de trabalho.
USE financial_control;

-- Cria a tabela 'user'.
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(127) NOT NULL,
    telephone VARCHAR(20),
    income DECIMAL NOT NULL,
    gender ENUM('fem', 'masc', 'prefiro não informar') DEFAULT 'prefiro não informar',
    status ENUM('on', 'off', 'del') DEFAULT 'on'
);

-- Cria a tabela 'spending'.
CREATE TABLE spending (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255),    
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    value DECIMAL NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES user (id)
);

INSERT INTO user (name, email, password, income, gender, telephone)
VALUES
('Thiago Bomfim', 'thiago@bomfim.com', '123', 5000, 'masc', '21984635412'),
('Ana Beatriz', 'ana@beatriz.com', '456',  4000, 'fem', '21976312348'),
('Larissa Meirelles', 'larissa@meirelles.com', '789', 6000, 'fem', '21994628632'),
('Alan Nataniel', 'alan@nataniel.com', '147', 5500, 'masc', '21989453214'),
('Mariana Medeiros', 'mariana@medeiros.com', '258', 5000, 'fem', '21965784512'),
('Nayane Cristina', 'nayane@cristina.com', '369', 5800, 'fem', '21963129725');


INSERT INTO spending (user_id, name, category, value, description) VALUES 
(1, 'Academia', 'Saúde', 70, ''),
(1, 'Farmácia', 'Saúde', 200, 'Comprei alguns cosméticos, quase não me sobra dinheiro, tudo muito caro.'),
(2, 'Rolê sábado', 'Lazer', 170, 'Consegui sair para o rolê nesse final de semana sem gastar muito.'),
(2, 'Casa do Biscoito', 'Alimentação', 50,'Comprei alguns biscoitos na Casa do Biscoito.'),
(3, 'Cinema quinta', 'Despesas pessoais', 270,'Assisti um filme novo e comprei algumas roupas no shopping.'),
(3, 'Guanabara', 'Alimentação', 200,'Fiz compra no mercado, e comprei coisas que estavam faltando em casa.');

