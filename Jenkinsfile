pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'tomcat-sample-app'
        CONTAINER_NAME = 'tomcat-app'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Builds the image using the Docker Pipeline plugin
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Removes any existing container with the same name
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    
                    // Runs the container with port mapping
                    sh "docker run -d -p 8080:8080 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}

