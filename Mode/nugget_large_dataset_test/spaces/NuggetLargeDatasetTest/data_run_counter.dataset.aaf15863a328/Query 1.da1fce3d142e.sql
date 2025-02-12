BEGIN;
update data_run_counter set counter = counter + 1, ct = GETDATE();
select counter, ct from data_run_counter;
COMMIT;