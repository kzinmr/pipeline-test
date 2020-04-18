pipeline {
  environment {
    registry = "kzinmr/simple-flask-api"
    registryCredential = "dockerhub"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
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
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}