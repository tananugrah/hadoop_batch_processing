#!/bin/bash

#print service time
date

#virtualenv is now active
source /home/hadoop_batch_processing/venv/bin/activate

#running etl service
python3  /home/hadoop_batch_processing/app.py

filetime=$(date +"%Y%m%d")
echo "[INFO] Mapreduce is Running ....."
#running mapreduce on local
python3 /home/hadoop_batch_processing/mapReduce.py /home/hadoop_batch_processing/local/dim_orders_$filetime.csv > /home/hadoop_batch_processing/output/ordertotal_output_local_map.txt
#running mapreduce hadoop
python3 /home/hadoop_batch_processing/mapReduce.py -r hadoop hdfs:///digitalskola/project/dim_orders_$filetime.csv > /home/hadoop_batch_processing/output/orderctotal_output_hadoop_map.txt

echo "[INFO] Mapreduce is Done ....."