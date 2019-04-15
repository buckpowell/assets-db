CREATE trigger t_updated_at before UPDATE on user 
for each row 
set new.updated_at = NOW()