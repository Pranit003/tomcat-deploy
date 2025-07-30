pipeline {
    agent any

    environment {
        IMAGE_NAME = 'tomcat-sample-app'
        CONTAINER_NAME = 'tomcat-app'
        PORT_MAPPING = '9090:8090' // Host port 9090 maps to container's internal port 8090
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm // Checks out the project source code from GitHub
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}") // Builds Docker image from the Dockerfile
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stops and removes any existing container with same name (prevents conflict)
                    sh "docker rm -f ${CONTAINER_NAME} || true"

                    // Runs container with correct port mapping
                    sh "docker run -d -p ${PORT_MAPPING} --name ${CONTAINER_NAME} ${IMAGE_NAME}"

                    // Optional: Confirm the container is running
                    sh "docker ps | grep ${CONTAINER_NAME}"
                }
            }
        }
    }
}



