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
        sh 'echo Delete old containers'
        sh '/usr/local/bin/docker rm gunicorn-nginx-kubernetes_master_nginx_1 --force'
        sh '/usr/local/bin/docker rm gunicorn-nginx-kubernetes_master_flask-api_1 --force'
        sh 'echo Delete old images'
        sh '/usr/local/bin/docker rmi gunicorn-nginx-kubernetes_master_nginx'
        sh '/usr/local/bin/docker rmi gunicorn-nginx-kubernetes_master_flask-api'
        sh 'echo Build docker-compose file'
        sh '/usr/local/bin/docker-compose -f docker-compose.dev.yml up -d --build'
      }
    }

    stage('Push image to Docker registry local') {
      steps {
        sh 'echo Tag before push'
        sh '/usr/local/bin/docker image tag gunicorn-nginx-kubernetes_master_nginx:latest localhost:5000/gunicorn-nginx-kubernetes_master_nginx'
        sh '/usr/local/bin/docker image tag gunicorn-nginx-kubernetes_master_flask-api:latest localhost:5000/gunicorn-nginx-kubernetes_master_flask-api'
        sh '/usr/local/bin/docker push localhost:5000/gunicorn-nginx-kubernetes_master_nginx'
        sh '/usr/local/bin/docker push localhost:5000/gunicorn-nginx-kubernetes_master_flask-api'
      }
    }

  }
}