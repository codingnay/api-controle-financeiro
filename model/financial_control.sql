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
    address VARCHAR(255),
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
    value VARCHAR(255) NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES user (id)
);

INSERT INTO user (name, email, password, income, gender, telephone)
VALUES
('Camila Ferreira', 'camila@alves.com', '123', 5000, 'Rua Vinte e Três', 'fem', '21985216395'),
('Bruna Correa', 'bruna@correa.com', '456',  4000, 'Rua Cinquenta e Oito','fem', '21947512536'),
('Felipe de Souza', 'felipe@souza.com', '789', 6000,'Rua Cinco e Sete', 'masc', '21986495388'),
('Luna Alves', 'luna@alves.com', '147', 5500, 'Rua Sessenta e Quatro','fem', '21925336492');



INSERT INTO spending (user_id, name, category, value, description) VALUES 
(1, 'Academia', 'Saúde', 750, 'Paguei 6 meses de academia'),
(1, 'Farmácia', 'Saúde', 200, 'Comprei alguns cosméticos, quase não me sobra dinheiro, tudo muito caro.'),
(2, 'Rolê sábado', 'Lazer', 170, 'Consegui sair para o rolê nesse final de semana sem gastar muito.'),
(2, 'Casa do Biscoito', 'Alimentação', 50,'Comprei alguns biscoitos na Casa do Biscoito.'),
(3, 'Cinema quinta', 'Despesas pessoais', 270,'Assisti um filme novo e comprei algumas roupas no shopping.'),
(3, 'Guanabara', 'Alimentação', 200,'Fiz compra no mercado, e comprei coisas que estavam faltando em casa.');

