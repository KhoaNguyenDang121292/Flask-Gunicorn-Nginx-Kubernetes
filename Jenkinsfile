pipeline {
  agent any
  triggers {
    cron('H/15 * * * *')
  }
  stages {
    stage('Checkout source') {
      steps {
        git(url: 'https://github.com/KhoaNguyenDang121292/Flask-Gunicorn-Nginx-Kubernetes.git', branch: 'master')
      }
    }

    stage('Build image') {
      steps {
        sh 'eval $(minikube docker-env)'
        sh 'kubectl delete services flask-api'
        sh 'kubectl delete deployments flask-api'
        sh 'docker rmi localhost:5000/flask_api:latest'
        sh 'cd Flask'
        sh 'docker build --tag localhost:5000/flask_api .'
        sh 'cd ..'
      }
    }

    stage('Push image to Docker registry local') {
      steps {
        sh 'echo Push image into Docker registry'
        sh 'docker push localhost:5000/flask_api:latest'
      }
    }

    stage('Run in k8s') {
      steps {
        sh 'kubectl apply -f Kubernetes/flask-api-deployment.yml'
        sh 'kubectl apply -f Kubernetes/flask-api-service.yml'
        sh 'kubectl apply -f Kubernetes/minikube-ingress.yml'
      }
    }

  }
}