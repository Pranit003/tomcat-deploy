
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'tomcat-sample-app'
        CONTAINER_NAME = 'tomcat-app'
        PORT_MAPPING = '9191:8090' // Changed from 9090 to 9191 to avoid conflict
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm // ✅ Pulls source code from GitHub repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}") // ✅ Builds image from Dockerfile
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // ✅ Remove existing container with same name
                    sh "docker rm -f ${CONTAINER_NAME} || true"

                    // ✅ Kill any process using port 9191 (precaution)
                    sh "fuser -k 9191/tcp || true"

                    // ✅ Run container with updated port mapping
                    sh "docker run -d -p ${PORT_MAPPING} --name ${CONTAINER_NAME} ${IMAGE_NAME}"

                    // ✅ Optional check: verify container is running
                    sh "docker ps | grep ${CONTAINER_NAME}"
                }
            }
        }
    }
}



