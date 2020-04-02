pipeline {
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/KhoaNguyenDang121292/Flask-Gunicorn-Nginx-Kubernetes.git'
      }
    }

    stage('Build image') {
      steps{
        bash '''#!/bin/bash
                echo "Hello"
        '''
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
  environment {
    registry = 'localhost:5000'
    dockerImage = ''
  }
}