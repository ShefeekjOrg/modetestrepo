
  
  SELECT * FROM nugget_poc_test.ts_info.tables 
  where table_name like '%gb%'
  order by dataset_name;
  
    SELECT collection_name, sum(table_bytes_used)
 FROM nugget_poc_test.ts_info.tables
 group by collection_name;
  
  
  SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_1 limit 100;
  

  SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_1 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_12 as b
  on a.id =b.id;
  
  
  SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_20GB_dataset
  limit 1000000;
  
  
    SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_20GB_dataset as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_12 as b
  on a.id =b.id;
  
  
  SELECT sum(item_count) FROM nugget_poc_test.nuggetpoctest.nugget_poc_20GB_dataset;
  
   SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_12 as b
  on a.id =b.id;
  
  
  
   SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset limit 100;
   
   
   SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_12 as b
  on a.id =b.id;
  
  
     SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_2 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_12 as b
  on a.id =b.id;
  
   
     SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_2 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_3 as b
  on a.id =b.id
  where a.city='Dublin';
  
  
   SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_2 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_3 as b
  on a.id =b.id
  where a.city='Dublin';
  
     SELECT count( distinct a.id) FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_2 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_3 as b
  on a.id =b.id
  where a.city='Dublin';
  
   SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_6
   limit 100;
   
    SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_2 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_3 as b
  on a.id =b.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_10GB_dataset_4 as c
  on a.id =c.id
  where a.city='Dublin';
  
  
  explain analyze SELECT * FROM nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_1;
  
  
  
  SELECT a.country, a.payment_method, sum(b.price_usd)
  FROM nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_1 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_2 as b
  on a.id = b.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_4 as c
  on a.id = c.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_5 as d
  on a.id = d.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_test_parquet_6 as e
  on a.id = e.id
  group by a.country, a.payment_method;
  
  
  
  
  
    select * from nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_2
    
  SELECT a.*
  FROM nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_2 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_2 as b
  on a.id = b.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_3 as c
  on a.id = c.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_4 as d
  on a.id = d.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_5 as e
  on a.id = e.id;
  
  
      
  SELECT a.country, a.payment_method, sum(b.price_usd)
  FROM nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_1 as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_2 as b
  on a.id = b.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_1 as c
  on a.id = c.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_2 as d
  on a.id = d.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_3 as e
  on a.id = e.id
  group by a.country, a.payment_method;
  
select  a.country, a.payment_method, sum(a.price_usd) from nugget_poc_test.nuggetpoctest.nugget_poc_20gb_dataset a
group by a.country, a.payment_method;

 SELECT a.country, a.payment_method, sum(b.price_usd)
  FROM nugget_poc_test.nuggetpoctest.nugget_poc_20gb_dataset as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_1 as b
  on a.id = b.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_1 as c
  on a.id = c.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_2 as d
  on a.id = d.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_3 as e
  on a.id = e.id
  group by a.country, a.payment_method;



SELECT *
  FROM nugget_poc_test.nuggetpoctest.nugget_poc_20gb_dataset as a 
  join nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_1 as b
  on a.id = b.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_1 as c
  on a.id = c.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_2 as d
  on a.id = d.id
  join nugget_poc_test.nuggetpoctest.nugget_poc_1gb_dataset_3 as e
  on a.id = e.id
  group by a.country, a.payment_method;
  
  
    select a.country, a.payment_method, sum(a.price_usd) 
  from nugget_poc_test.nuggetpoctest.nugget_poc_10gb_dataset_1 as a
  group by a.country, a.payment_method;
  
  select count(1) from nugget_poc_test.nuggetpoctest.nugget_poc_20gb_dataset_1;
  
  
  SELECT CAST((2/2) AS VARCHAR)
  
  /* Viz id : 806c7142-4113-475a-a6ab-5190de8de0df */
/* Query 0 */
SELECT 
  "ta_1"."shipping_method" AS "ca_1", 
  COALESCE(sum("ta_1"."price_usd"), 0) AS "ca_2"
FROM "nugget_poc_test"."nuggetpoctest"."nugget_poc_20gb_dataset" AS "ta_1"
GROUP BY "ca_1"