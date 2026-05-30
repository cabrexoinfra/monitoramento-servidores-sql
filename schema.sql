CREATE TABLE users(
id SERIAL PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
sistema_operacional VARCHAR(10) NOT NULL,
cidade VARCHAR(20) NOT NULL,
carga_horaria INT NOT NULL,
ip_servidor VARCHAR(30) NOT NULL,
status_servidor VARCHAR(40) NOT NULL
);

CREATE TABLE detalhes(
id SERIAL PRIMARY KEY,
cliente_id INT,
cargo VARCHAR(30) NOT NULL,
salario DECIMAL(7,2) NOT NULL,
data_admissao DATE NOT NULL,
turno VARCHAR(15) NOT NULL,
setor VARCHAR (20) NOT NULL
);


ALTER TABLE detalhes
ADD CONSTRAINT Fk_cliente
FOREIGN KEY (cliente_id) REFERENCES users(id);
