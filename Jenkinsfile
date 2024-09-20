pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
        stage('Build Backend') {
            steps {
                // Run Maven build to generate the JAR file
                bat 'cd backend && mvn clean package -DskipTests'
            }
        }
        stage('Build and Deploy Docker Containers') {
            steps {
                script {
                    // Build and run Docker containers
                    bat '''
                        docker-compose down --remove-orphans
                        docker-compose up --build -d
                    '''
                }
            }
        }
        stage('Test') {
            steps {
                // Placeholder for testing steps
                echo 'Run tests here'
            }
        }
        stage('Deploy') {
            steps {
                // Placeholder for deployment steps
                echo 'Deploy to production here'
            }
        }
    }
    post {
        always {
            // Cleanup after build.
            bat 'docker-compose down --remove-orphans'
        }
    }
}



