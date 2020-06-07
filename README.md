# Performance Test Framework
A **Docker** solution to **J**Meter + **I**nfluxDB + **G**rafana performance testing suite.


## How it works in a nutshell
JMeter runs the load test, the results of the test are stored in InfluxDB, and Grafana reads the results from InfluxDB and visualizes them into graphs and dashboards. Docker eliminates all manual setup steps and packages everything together.


## How to install it with install scripts
- On the VM where this setup needs to be installed, create an install.sh and copy the contents of install.sh. 
- Ensure the u02 directory is replaced with the correct install directory in the install.sh.
- Provide execute permissions for this script (chmod 755 install.sh)
- Execute the install.sh which would then ask for GIT credentials to pull the repo to the VM and start the required dockers 
- Note: Change the GIT repo details in install.sh and deploy.sh if the repo is cloned to a different location other than ADSS QA project


## How to use it
- Navigate to the test folder of the repo by running `cd <repo>/jmeter/test`
- Edit the user.properties file, change the webUrl property's value to the URL of your web app or whatever web server you want to put load on
- Update telegraf.conf present at `cd <repo>/telegraf/` for appropriate metrics to be collected 
- Run `docker-compose up` to start the load test and `docker-compose down` to stop the test
- Open hostname:3000 to see the Grafana web interface. Click into the default dashboard or create your own! 
- For any changes made on any of the components, a rebuild of the component can be done using `docker-compose build --no-cache <componentName eg. telegraf>` 

## How to configure it
To run your own JMeter test plan:
- copy the test plan into `<repo>/jmeter/test`
- edit docker-compose.yml and replace the value of the JMETER_TEST environment variable with the file name of your test plan
- run `docker-compose up -d` again to execute your test plan


## Pre-Requisites on VM before installing this framework
Before being able to run the setup on a linux VM, following pre-requisite installations are needed on the VM:
- docker
- docker-compose
- curl & wget
- GIT

## Additional Info
- telegraf uses the conf file on host to start 
- influxDB writes data to aqperf/influxdb/data folder on the host so that the data is persistent post a test run
- jmeter writes the logs to logs folder within aqperf/jmeter on the host
- jmeter's JVM Max HEAP size is configured using the environment variable set in docker-compose file. If further info is needed - read https://developers.redhat.com/blog/2017/03/14/java-inside-docker/
- Grafana installation source: https://github.com/serputko/performance-testing-framework

## Memory Requirements on the VM where this is installed
To be documented -- noticed that the <repo>_jmeter doesn't come up reporting insufficient memory for JRE on a t2.micro EC2 VM from AWS



