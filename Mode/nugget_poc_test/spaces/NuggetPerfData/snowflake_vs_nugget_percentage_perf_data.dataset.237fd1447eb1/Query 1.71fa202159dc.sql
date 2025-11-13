WITH sf_metrics AS (
  SELECT 
    queryType,
    AVG(queryTimeTaken) as avg_query_time_sf,
    AVG(timeTakenDatamanager) as avg_datamanager_time_sf,
    AVG(tsBackendApiTime) as avg_ts_backend_api_time_sf
  FROM "nugget_poc_test"."nuggetperfdata"."snowflake_vs_nugget_perf_data"
  WHERE dataSource = 'SF'
  GROUP BY queryType
),
old_ws_metrics AS (
  SELECT 
    queryType,
    AVG(queryTimeTaken) as avg_query_time_old_ws,
    AVG(timeTakenDatamanager) as avg_datamanager_time_old_ws,
    AVG(tsBackendApiTime) as avg_ts_backend_api_time_old_ws
  FROM "nugget_poc_test"."nuggetperfdata"."snowflake_vs_nugget_perf_data"
  WHERE dataSource = 'Old WS'
  GROUP BY queryType
),
new_ws_metrics AS (
  SELECT 
    queryType,
    AVG(queryTimeTaken) as avg_query_time_new_ws,
    AVG(timeTakenDatamanager) as avg_datamanager_time_new_ws,
    AVG(tsBackendApiTime) as avg_ts_backend_api_time_new_ws
  FROM "nugget_poc_test"."nuggetperfdata"."snowflake_vs_nugget_perf_data"
  WHERE dataSource = 'New WS'
  GROUP BY queryType
)
SELECT 
  sf.queryType,
  
  -- Average query times
  ROUND(sf.avg_query_time_sf, 2) as sf_avg_query_time,
  ROUND(ow.avg_query_time_old_ws, 2) as old_ws_avg_query_time,
  ROUND(nw.avg_query_time_new_ws, 2) as new_ws_avg_query_time,
  
  -- Percentage differences for query time
  ROUND(((sf.avg_query_time_sf - ow.avg_query_time_old_ws) / sf.avg_query_time_sf * 100), 2) as sf_vs_old_ws_query_pct_diff,
  ROUND(((sf.avg_query_time_sf - nw.avg_query_time_new_ws) / sf.avg_query_time_sf * 100), 2) as sf_vs_new_ws_query_pct_diff,
  ROUND(((ow.avg_query_time_old_ws - nw.avg_query_time_new_ws) / ow.avg_query_time_old_ws * 100), 2) as old_vs_new_ws_query_pct_diff,
  
  -- Percentage differences for datamanager time
  ROUND(((sf.avg_datamanager_time_sf - ow.avg_datamanager_time_old_ws) / sf.avg_datamanager_time_sf * 100), 2) as sf_vs_old_ws_datamanager_pct_diff,
  ROUND(((sf.avg_datamanager_time_sf - nw.avg_datamanager_time_new_ws) / sf.avg_datamanager_time_sf * 100), 2) as sf_vs_new_ws_datamanager_pct_diff,
  ROUND(((ow.avg_datamanager_time_old_ws - nw.avg_datamanager_time_new_ws) / ow.avg_datamanager_time_old_ws * 100), 2) as old_vs_new_ws_datamanager_pct_diff,
  
  -- Percentage differences for backend_api time
  ROUND(((sf.avg_ts_backend_api_time_sf - ow.avg_ts_backend_api_time_old_ws) / sf.avg_ts_backend_api_time_sf * 100), 2) as sf_vs_old_ws_backend_api_pct_diff,
  ROUND(((sf.avg_ts_backend_api_time_sf - nw.avg_ts_backend_api_time_new_ws) / sf.avg_ts_backend_api_time_sf * 100), 2) as sf_vs_new_ws_backend_api_pct_diff,
  ROUND(((ow.avg_ts_backend_api_time_old_ws - nw.avg_ts_backend_api_time_new_ws) / ow.avg_ts_backend_api_time_old_ws * 100), 2) as old_vs_new_ws_backend_api_pct_diff

FROM sf_metrics sf
LEFT JOIN old_ws_metrics ow ON sf.queryType = ow.queryType
LEFT JOIN new_ws_metrics nw ON sf.queryType = nw.queryType
ORDER BY sf.queryType;