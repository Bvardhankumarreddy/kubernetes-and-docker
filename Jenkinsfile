pipeline{
    agent any
    environment{
        DOCKERHUB_CREDS = 'docker-credentials'
        DOCKER_IMAGE = 'bhopathivardhan1/jenkinslearning'
        IMAGE_TAG = 'latest'
    }
    stages{
        stage("Clone Repository"){
            steps{
                echo "Cloning the GitHub repository..."
                git branch: 'main', url: ' https://github.com/Bvardhankumarreddy/kubernetes-and-docker.git'
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "Successfully cloned the Repo"
                }
                failure{
                    echo "Failed to clone the repo"
                }
            }
        }
        stage('Build the docker Image'){
            steps{
               script{
                echo "Building the Docker Image....."
                sh "docker build -t ${DOCKER_IMAGE}:${IMAGE_TAG} ."
               }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    echo "Logging into Docker Hub..."
                    withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }
                }
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    sh "docker push ${DOCKER_IMAGE}:${IMAGE_TAG}"
                }
            }
        }

        stage('Cleanup') {
            steps {
                echo "Cleaning up local Docker images..."
                sh "docker rmi ${DOCKER_IMAGE}:${IMAGE_TAG} || true"
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
