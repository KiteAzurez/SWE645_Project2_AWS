**This project is an extension of Project 1: Making a Website & Student Survey using AWS S3 & EC2.**

---

## Project 2: Containerizing web application using Docker container technology and deploying using open source container orchestration with a CI/CD pipeline.

How to set this up from scratch (Text, Youtube Video down below):


1. Set up for ec2 instance
	- select launch instance, 2 instances, ubuntu AMI , t3 large, 30 gigabyte storage, allow SSH HTTP HTTPS, launch instance
	- make sure you put in IAM lab role, go to security add 8080 port , ensure all other ports are open. Outbound rules connect from anywhere
	- connect to first instance for Kubernetes cluster setup.
	
	
2. Have install Rancher to manage your Kubernetes Cluster 
	- install sudo apt-get updates
	- install docker 
	- create docker image on docker hub
	- test to see if you can pull docker image and run container.  Go to docker website using http://youraddresshere.com:portnumber
	- go to https://www.rancher.com/quick-start
	- follow instructions to quick start rancher
	- create deployment & service (make sure selector: name: xxxx  in service and deployment match up).
	- add security rule to include your high port number from service tab for nodeport/load balancer.
	
	
3. Jenkins setup for pipeline
	- sudo apt-get updates
	- sudo apt-get jdk
	- install jenkins
	- open public DNS for jenkins http://youraddresshere.com:8080
	- follow instructions on website to set up (hit recommended plugins install)
	- click new item, pipeline, use git repository for pipeline pulling
	- create Jenkinsfile in git repository for scripts
	- back in command line, mkdir .kube
	- make config file
	- may need to do export KUBECONFIG=/var/lib/jenkins/.kube/config
	- also may need to do sudo ufw 8080  |  sudo ufw enable for fire wall enabling, after that go to this link and try first solution:
	- https://stackoverflow.com/questions/59701689/ec2-instance-connect-there-was-a-problem-setting-up-the-instance-connection
	- after installing all plugins, go to credentials in dashboard ---> manage jenkins
	- credentials --> click on gloabl credentials
	- add your docker username/password (docker username for ssh connections need only username NOT email).
	- in your Jenkinsfile, make sure you set your DOCKERHUB_PASS = id_of_credential
	- if you ever want to call your DOCKERHUB_PASS only, you need to do DOCKERHUB_PASS_PSW.
	- run pipeline. You may need to edit your $BUILD_TIMESTAMP as if you do dockeruser/dockerrepo:$BUILD_TIMESTAMP it will throw an error
	- done!
	
---

## Links to websites/ sources
**NOTE NONE OF THESE LINKS WILL WORK UNLESS AWS iLAB ACCOUNT IS RUNNING, PLEASE CONTACT ME IF YOU WANT TO SEE IT RUNNING**
1. Youtube link how to set up : https://www.youtube.com/watch?v=HD2rfgF1CUs&feature=youtu.be
2. Rancher hub : https://ec2-54-197-112-183.compute-1.amazonaws.com/
3. Student form website: http://ec2-54-197-112-183.compute-1.amazonaws.com:31102/
4. Docker hub image: https://hub.docker.com/repository/docker/kcochra7/nginx8080/general
5. Jenkins pipline does not have an Elastic IP. Please contact if you want me to run it and take a look at it. U:admin P:jenkins 

---
## Things Learned.
A lot of stuff I did google to see what is the issue with connectin my kubernetes cluster.  I think a lot of the issues might be due to the fire wall
IAM lab role has, but most stuff I did get through. I eventually did ask my wonderful professor for help and he helped me with much needed
advice.  Things I learned is the ask for help earlier if I am stuck, less time to stress about it!

Also K8 deployment file must match matchLabels: apps: k8-service and then make sure your k8-service is actually named k8-service.
