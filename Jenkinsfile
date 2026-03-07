pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'sujan',
                    url: 'https://github.com/sujanvijay/frontend_dep_docker.git'
            }
        }

        stage('Install') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
