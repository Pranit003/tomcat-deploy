pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('tomcat-sample-app')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker rm -f tomcat-app || true'
                    sh 'docker run -d -p 8080:8080 --name tomcat-app tomcat-sample-app'
                }
            }
        }
    }
}
