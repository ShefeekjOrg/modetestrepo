select * FROM "nugget_poc_test"."nuggetperfdata"."snowflake_vs_nugget_perf_data" AS "ta_1"
where
--visualizationId = '9ce86b86-d6a1-4143-9914-a77d2da0e384'
testType = 'Backend' and
 queryType = 'Q1-10GB:1 DS'
 and dataSource = 'New WS'
order by totalWorkers;


select * FROM "nugget_poc_test"."nuggetperfdata"."nugget_publish_performance_old_vs_new" AS "ta_1"