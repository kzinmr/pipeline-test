pipeline {
  environment {
    registry = "kzinmr/simple-flask-api"
    registryCredential = "dockerhub"
  }
  agent any
  stages {
    stage('build') {
      steps {
        sh 'python -m pip install -r requirements.txt'
      }
    }
    stage('Test') {
      steps {
        sh 'python -m pytest .'
      }
    }
    stage('Lint') {
      steps {
        sh 'python -m flake8 .'
      }
    }

    stage('Build image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}