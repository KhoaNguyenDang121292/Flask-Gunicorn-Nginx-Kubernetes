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
        sh 'echo Build docker-compose file'
        sh '/usr/local/bin/docker-compose -f docker-compose.dev.yml up -d --build'
      }
    }

  }
}