pipeline {
  agent {
    docker any
  }
  stages {
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
    stage('Test') {
      steps {
        sh 'pytest'
      }
    }
    stage('Lint') {
      steps {
        sh 'black'
      }
    }
    stage('Docker') {
      steps {
        sh """
        docker build .
        docker push .
        """
      }
    }
  }
}