pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
    stage('Test') {
      steps {
        sh 'pip install -r requirements.txt'
        sh 'pytest'
      }
    }
    stage('Lint') {
      steps {
        sh 'pip install -r requirements.txt'
        sh 'black'
      }
    }
  }
}