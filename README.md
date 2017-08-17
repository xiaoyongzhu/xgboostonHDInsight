# xgboostonHDInsight
 
 
### XGBoost
XGBoost is an optimized distributed gradient boosting library designed to be highly efficient, flexible and portable. It implements machine learning algorithms under the Gradient Boosting framework. XGBoost provides a parallel tree boosting (also known as GBDT, GBM) that solve many data science problems in a fast and accurate way. The same code runs on major distributed environment (Hadoop, SGE, MPI) and can solve problems beyond billions of examples.

It is not designed as a generic Machine Learning framework; it is designed as a library very specialized in boosting tree algorithm, and is widely used from production to experimental projects.

For more details on XGBoost, please go to XGBoost [GitHub page](https://github.com/dmlc/xgboost).

### How to use this notebook
This notebook basically provides an E2E workflow from building XGBoost jars, deploying the jars to Azure Storage, to running Boosting Tree algorithm to HDInsight.

### Building XGBoost from source code
The following code snippet 

- installs the required libraries for building XGBoost
- builds XGBoost using Maven
- put the compiled jars to the default storage account of the HDInsight cluster
- put the sample data to the default storage account of the HDInsight cluster

The cell below is using the %%sh magic which will execute the code below as bash scripts in the head node.

You might see something like this when building xgboost. This is expected and the final test should pass.

    Tracker started, with env={DMLC_NUM_SERVER=0, DMLC_TRACKER_URI=10.0.0.15, DMLC_TRACKER_PORT=9091, DMLC_NUM_WORKER=4}
    17/08/14 22:41:34 ERROR Executor: Exception in task 3.0 in stage 0.0 (TID 3)
    java.lang.RuntimeException: Worker exception.
            at ml.dmlc.xgboost4j.scala.spark.RabitTrackerRobustnessSuite$$anonfun$1$$anonfun$2.apply(RabitTrackerRobustnessSuite.scala:72)
            at ml.dmlc.xgboost4j.scala.spark.RabitTrackerRobustnessSuite$$anonfun$1$$anonfun$2.apply(RabitTrackerRobustnessSuite.scala:66)
            at org.apache.spark.rdd.RDD$$anonfun$mapPartitions$1$$anonfun$apply$23.apply(RDD.scala:796)

### Start a Spark session
After putting the jars and the files to the Azure Storage, which is shared across all the HDInsight nodes, the next step is to start a Spark session and call the XGBoost libraries. 

In the configure cell below, first we need to load those jar files to the Spark session, so we can use XGBoost APIs in this Jupyter Notebook.

We also need to exclude a few spark jars because there are some conflicts between Livy (which is the REST API used on HDInsight to execute Spark code), and XGBoost.


  
### Import Packages
We then import the XGBoost packages and start a Spark application.

Fore more details, please refer to the attached Jupyter Notebook.

 
