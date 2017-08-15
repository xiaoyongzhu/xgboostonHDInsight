#!/bin/bash 

#Install the required packages 
sudo apt-get update
sudo apt-get install -y maven git build-essentials maven cmake python-setuptools
#sudo pip install xgboost

#clone XGBoost repo and build it
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost/jvm-packages
mvn -DskipTests=true package


#put the compiled packge to shared storage
hadoop fs -put xgboost4j-spark/target/xgboost4j-spark-0.7-jar-with-dependencies.jar /
cp xgboost4j-spark/target/xgboost4j-spark-0.7-jar-with-dependencies.jar /databricks/jars/xgboost4j-spark-0.7-with-dependencies.jar

#put the sample data to shared storage
hadoop fs -put xgboost/demo/data/agaricus.txt* /