pipeline {
    agent any
    environment {
        // Set the SSH credentials ID you created in Jenkins
        SSH_CREDENTIALS_ID = 'ec2-ssh-key'
        EC2_IP = 'your-ec2-ip'
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git branch: 'main', url: 'https://github.com/CrimsonFellow/healthcare-springboot-backend.git'
            }
        }
        stage('Build') {
            steps {
                // Build the backend and frontend Docker images
                script {
                    sh 'docker-compose down --remove-orphans'
                    sh 'docker-compose up --build -d'
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                // SSH into EC2 and pull the latest Docker images
                sshagent(credentials: [SSH_CREDENTIALS_ID]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ec2-user@${EC2_IP} << EOF
                    cd /path/to/your/project
                    git pull origin main
                    docker-compose down --remove-orphans
                    docker-compose up --build -d
                    exit
                    EOF
                    """
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}



