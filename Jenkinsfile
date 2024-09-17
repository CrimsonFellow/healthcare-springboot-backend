pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/CrimsonFellow/healthcare-springboot-backend.git'
            }
        }
        stage('Build') {
            steps {
                dir('healthcare-app') { // Change into the healthcare-app directory
                    bat 'mvn clean package'
                }
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'healthcare-app/target/*.jar', fingerprint: true
            }
        }
    }
}

