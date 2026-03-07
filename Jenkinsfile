pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        IMAGE_NAME = "sujanvijay/frontendapp"
        CONTAINER_NAME = "frontend-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'sujan',
                    url: 'https://github.com/sujanvijay/frontend_dep_docker.git'
            }
        }

        stage('Build Maven Package') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f $CONTAINER_NAME || true
                docker run -d -p 8001:8080 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }

    }
}
