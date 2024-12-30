pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo "Cloning the repository..."
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/Ahmed61911/phpJenkinsProject']]
                )
            }
        }

        stage('Build') {
            steps {
                echo "Building the application..."
                bat 'composer install'
            }
        }

        stage('Dockerization') {
            steps {
                echo "Building the Docker image..."
                script {
                    bat 'docker build -t ahmed61911/dev-ops-project .'
                }
            }
        }

        stage('Push') {
            steps {
                echo "Pushing the Docker image to the registry..."
                script {
                    withCredentials([string(credentialsId: 'DockerHubPassword', variable: 'DockerHubPwd')]) {
                        bat 'docker login -u ahmed61911 -p ${DockerHubPwd}'
                        bat 'docker push ahmed61911/dev-ops-project'
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up workspace..."
            cleanWs()
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}
