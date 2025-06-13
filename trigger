-- Trigger de Remoção – BEFORE DELETECREATE TABLE deleted_clients_history (
CREATE TABLE deleted_clients_history (
    idClient INT,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    cpf CHAR(11),
    address VARCHAR(255),
    deleted_at DATETIME
);

DELIMITER $$

CREATE TRIGGER before_delete_client
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    INSERT INTO deleted_clients_history (
        idClient, Fname, Minit, Lname, cpf, address, deleted_at
    )
    VALUES (
        OLD.idClient, OLD.Fname, OLD.Minit, OLD.Lname, OLD.cpf, OLD.address, NOW()
    );
END $$

DELIMITER ;

-- Trigger de Atualização – BEFORE UPDATE
ALTER TABLE employees ADD COLUMN baseSalary FLOAT DEFAULT 0;

CREATE TABLE salary_update_log (
    idLog INT AUTO_INCREMENT PRIMARY KEY,
    idEmployee INT,
    oldSalary FLOAT,
    newSalary FLOAT,
    updated_at DATETIME
);

DELIMITER $$

CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.baseSalary <> NEW.baseSalary THEN
        INSERT INTO salary_update_log (
            idEmployee, oldSalary, newSalary, updated_at
        ) VALUES (
            OLD.idEmployee, OLD.baseSalary, NEW.baseSalary, NOW()
        );
    END IF;
END $$

DELIMITER ;


