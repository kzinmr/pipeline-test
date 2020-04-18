pipeline {
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
    stage('Docker') {
      steps {
        sh """
        docker build -t kzinmr/simple-flask-api .
        docker push kzinmr/simple-flask-api:v1 
        """
      }
    }
  }
}