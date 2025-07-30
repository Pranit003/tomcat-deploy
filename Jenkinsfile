pipeline {
    agent any

    environment {
        IMAGE_NAME = 'tomcat-sample-app'
        CONTAINER_NAME = 'tomcat-app'
        PORT_MAPPING = '8080:8080'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    sh "docker run -d -p ${PORT_MAPPING} --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }
}


