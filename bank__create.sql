-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-13 14:15:17.768

-- tables
-- Table: address
CREATE TABLE address (
    id int NOT NULL,
    street varchar(225) NOT NULL,
    city varchar(225) NOT NULL,
    state varchar(225) NOT NULL,
    country varchar(225) NOT NULL,
    zipcode varchar(225) NOT NULL,
    CONSTRAINT address_pk PRIMARY KEY (id)
);

-- Table: branch
CREATE TABLE branch (
    id int NOT NULL,
    name varchar(225) NOT NULL,
    code varchar(225) NOT NULL,
    status varchar(100) NOT NULL,
    address_id int NOT NULL,
    manager_id int NOT NULL,
    CONSTRAINT branch_pk PRIMARY KEY (id)
);

-- Table: manager
CREATE TABLE manager (
    id int NOT NULL,
    username varchar(225) NOT NULL,
    password varchar(225) NOT NULL,
    status varchar(100) NOT NULL,
    address_id int NOT NULL,
    CONSTRAINT manager_pk PRIMARY KEY (id)
);

-- Table: transaction
CREATE TABLE transaction (
    id int NOT NULL,
    amount int NOT NULL,
    status varchar(100) NOT NULL,
    timestamp timestamp NOT NULL,
    branch_id int NOT NULL,
    sender_id int NOT NULL,
    reciever_id int NOT NULL,
    CONSTRAINT transaction_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE user (
    id int NOT NULL,
    name varchar(225) NOT NULL,
    username varchar(225) NOT NULL,
    password varchar(225) NOT NULL,
    balance int NOT NULL,
    status varchar(100) NOT NULL,
    address_id int NOT NULL,
    branch_id int NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: branch_address (table: branch)
ALTER TABLE branch ADD CONSTRAINT branch_address FOREIGN KEY branch_address (address_id)
    REFERENCES address (id);

-- Reference: branch_manager (table: branch)
ALTER TABLE branch ADD CONSTRAINT branch_manager FOREIGN KEY branch_manager (manager_id)
    REFERENCES manager (id);

-- Reference: manager_address (table: manager)
ALTER TABLE manager ADD CONSTRAINT manager_address FOREIGN KEY manager_address (address_id)
    REFERENCES address (id);

-- Reference: transaction_branch (table: transaction)
ALTER TABLE transaction ADD CONSTRAINT transaction_branch FOREIGN KEY transaction_branch (branch_id)
    REFERENCES branch (id);

-- Reference: transaction_reciever (table: transaction)
ALTER TABLE transaction ADD CONSTRAINT transaction_reciever FOREIGN KEY transaction_reciever (reciever_id)
    REFERENCES user (id);

-- Reference: transaction_sender (table: transaction)
ALTER TABLE transaction ADD CONSTRAINT transaction_sender FOREIGN KEY transaction_sender (sender_id)
    REFERENCES user (id);

-- Reference: user_address (table: user)
ALTER TABLE user ADD CONSTRAINT user_address FOREIGN KEY user_address (address_id)
    REFERENCES address (id);

-- Reference: user_branch (table: user)
ALTER TABLE user ADD CONSTRAINT user_branch FOREIGN KEY user_branch (branch_id)
    REFERENCES branch (id);

-- End of file.

