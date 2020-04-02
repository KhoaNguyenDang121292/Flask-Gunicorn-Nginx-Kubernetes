pipeline {
  agent any
  stages {
    stage('Checkout source') {
      steps {
        git(url: 'https://github.com/KhoaNguyenDang121292/Flask-Gunicorn-Nginx-Kubernetes.git', branch: 'master')
      }
    }

    stage('Build image') {
      steps {
        sh '/usr/local/bin/docker image tag flask-api:latest localhost:5000/flask-api'
        sh '/usr/local/bin/docker push localhost:5000/flask-api'
      }
    }

  }
}