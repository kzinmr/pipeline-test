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
        python -m pip install -r requirements.txt
        python -m pytest
        '''
      }
    }
    stage('Lint') {
      steps {
        sh '''
        python -m pip install -r requirements.txt
        python -m black
        '''
      }
    }
  }
}