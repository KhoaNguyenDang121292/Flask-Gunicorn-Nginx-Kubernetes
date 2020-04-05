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
        sh '/usr/local/bin/kubectl delete services flask-api --ignore-not-found=true'
        sh '/usr/local/bin/kubectl delete deployments flask-api --ignore-not-found=true'
        sh '/usr/local/bin/docker rmi localhost:5000/flask_api:latest'
        sh 'cd Flask'
        sh '/usr/local/bin/docker build --tag localhost:5000/flask_api --file Flask/Dockerfile .'
        sh 'cd ..'
      }
    }

    stage('Push image to Docker registry local') {
      steps {
        sh 'echo Push image into Docker registry'
        sh '/usr/local/bin/docker push localhost:5000/flask_api:latest'
      }
    }

    stage('Run in k8s') {
      steps {
        sh '/usr/local/bin/kubectl apply -f Kubernetes/flask-api-deployment.yml --ignore-not-found=true'
        sh '/usr/local/bin/kubectl apply -f Kubernetes/flask-api-service.yml --ignore-not-found=true'
        sh '/usr/local/bin/kubectl apply -f Kubernetes/minikube-ingress.yml --ignore-not-found=true'
      }
    }

  }
}