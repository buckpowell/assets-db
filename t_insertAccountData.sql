CREATE TRIGGER t_insertAccountData AFTER INSERT ON user 
FOR EACH ROW BEGIN
INSERT INTO user_data (asset_id) VALUES (new.id);
END