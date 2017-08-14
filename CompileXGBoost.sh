%%local
#!/bin/bash 
sudo apt-get update
sudo apt-get install -y maven git build-essentials maven cmake python-setuptools
sudo pip install xgboost
git clone --recursive https://github.com/dmlc/xgboost

cd xgboost


#find * -name tracker.py -type f -print0 | xargs -0 sed -i '' "s/port=9091/port=33000/g"
make -j4

cd jvm-packages


mvn -DskipTests=true package
mkdir -p /databricks/jars/
cp xgboost4j-spark/target/xgboost4j-spark-0.7-jar-with-dependencies.jar /databricks/jars/xgboost4j-spark-0.7-with-dependencies.jar
""", true)