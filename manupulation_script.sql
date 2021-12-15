-- Manupulation queries

-- INSERT Statements
-- INSERT INTO address (id, street, city, state, country, zipcode) VALUES (4,"702 6th", "Lincon", "Texas", "USA", "78948");
-- INSERT INTO branch (id, name, code, status, address_id, manager_id) VALUES (4, "Pillar Bank", "BB-04", "open", 1, 3);

-- UPDATE Statements
-- UPDATE branch SET status = "close" WHERE id = 4;
-- update manager set status = "active" where id = 2;

-- DELETE Statements
-- delete from address where id = 4;

-- SELECT Statements
-- select username, status from manager;

-- JOIN Statements
-- select * from user join (address) on user.address_id = address.id;
-- select * from branch join (manager) on branch.manager_id = manager.id;

-- Summary Statements
-- select sum(balance) from user;
-- select sum(amount) from transaction;

-- Multi-table Statements
-- select user.*, branch.* from user, branch where user.branch_id = branch.id AND branch.id = 1;

-- Choice Query
-- select user.id,user.name, user.username, user.password, user.balance, user.status ,branch.name as Branch, address.city, address.country, address.zipcode from user join (branch, address) on user.branch_id = branch.id AND user.address_id = address.id;
