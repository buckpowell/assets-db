CREATE trigger t_created_at before INSERT on user
 for each row 
 set new.created_at = NOW()