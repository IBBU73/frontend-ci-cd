pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/IBBU73/frontend-ci-cd.git'
            }
        }
        stage('install') {
            steps {
                sh 'npm install'
            }
        }
        stage('build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('test') {
            steps {
                sh 'npm test ----watchAll=false'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t react-app:v1 .'
            }
        }

        stage('Remove Old Container') {
            steps {
                sh 'docker rm -f react-container || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 8000:4100 --name react-container react-app:v1'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful'
        }
        failure {
            echo 'Deployment Failed'
        }
    }
} 
