pipeline {

    environment {
        registry = "localhost:5000"
        dockerImage = ""
    }

    agent any

    stages {

        stage('Checkout from Github') {
            steps {
                git 'https://github.com/KhoaNguyenDang121292/Flask-Gunicorn-Nginx-Kubernetes.git'
            }
        }

        stage('Build Image from Github source') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry("") {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy App') {
            steps {
                script {
                    kubernetesDeploy(configs: "Kubernetes/deployment-dev.yaml", kubeconfigId: "mykubeconfig")
                }
            }
        }

    }

}