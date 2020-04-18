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

    // stage('Create EC2 Instance') {
    //   steps {
    //     ansiblePlaybook playbook: 'main.yaml', inventory: 'inventory'
    //   }
    // }

    // stage('AWS Credentials') {
    //   steps {
    //     withCredentials([[
    //       $class: 'AmazonWebServicesCredentialsBinding',
    //       credentialsId: 'aws-bgd',
    //       accessKeyVariable: 'AWS_ACCESS_KEY_ID',
    //       secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
    //     ]]) {
    //       sh """
    //         mkdir -p ~/.aws
    //         echo "[default]" > ~/.aws/credentials
    //         echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >> ~/.aws/credentials
    //         echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> ~/.aws/credentials
    //         echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >> ~/.boto
    //         echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> ~/.boto
    //       """
    //     }
    //   }
    // }

  }
}