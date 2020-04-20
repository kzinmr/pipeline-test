pipeline {
  environment {
    registry = "kzinmr/simple-flask-api"
    registryCredential = "dockerhub"
    dockerImage = ''
    ansibleCredential = "my_aws_key"
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
          dockerImage = docker.build registry + ":v$BUILD_NUMBER"
        }
      }
    }
    stage('Push image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove unused docker image') {
      steps {
        sh "docker rmi $registry:v$BUILD_NUMBER"
      }
    }

    stage('Deploy a container based on the image') {
      steps {
        sh 'cat deploy.yml | sed -e "s/IMAGE_VERSION_TO_BE_REPLACED/v$BUILD_NUMBER/" > _deploy.yml'
        ansiblePlaybook credentialsId: ansibleCredential, disableHostKeyChecking: true, inventory: 'hosts', playbook: '_deploy.yml'
      }
    }

  }
}