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
        sh '''
        pip install -r requirements.txt
        pytest
        '''
      }
    }
    stage('Lint') {
      steps {
        sh '''
        pip install -r requirements.txt
        black
        '''
      }
    }
  }
}