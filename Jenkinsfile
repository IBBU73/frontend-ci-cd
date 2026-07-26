pipeline {
    agent any 
    
    stages {
        stage('checkeout'){
            steps {
                git branch :'main',
                ''
            }
        }
        stage('docker build'){
            steps {
                sh 'docker build -t reacr-app:v1 .'
            }
        }
        stage('docker rm') {
            steps {
                sh 'docker rm -f react-container || true'
        }
        stage('run new container'){
            steps {
                sh 'docker run -d -p 8000:4100 --name react-container react-app:v1'
            
            }
        }        
        post {
            success {
                echo 'deployed success'
            }
            failure {
                echo 'deployment failed'
            }
        }
    }
}