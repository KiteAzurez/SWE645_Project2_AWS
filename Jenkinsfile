pipeline {
    agent any
    environment {
        DOCKERHUB_PASS = credentials('docker-pass')
    }
    stages{
        stage("Building the Student Survey Image"){
        steps{
            script {
                checkout scm
		echo "Hello my password $DOCKERHUB_PASS_PSW"
                sh "echo $BUILD_TIMESTAMP"
                sh 'docker login -u kcochra7 -p $DOCKERHUB_PASS_PSW'
		echo "my build time_stamp is weird??? kcochra7/nginx8080:$BUILD_TIMESTAMP"
                def customImage = docker.build("kcochra7/nginx8080:$BUILD_TIMESTAMP")
            }
        }
    }
    stage("Pushing Image to Dockerhub") {
        steps {
            script {
                sh "docker push kcochra7/nginx8080:$BUILD_TIMESTAMP"
            }
        }
    }
    stage("Deploying to Rancher as single pod") {
        steps {
	    sh "whoami"
	    sh "kubectl get nodes"
            sh "kubectl set image deployment/k8-deployment nginx8080=kcochra7/nginx8080:$BUILD_TIMESTAMP -n default"
       		 }
 	   }
	}
}
