pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
  }
  stages {
    stage('cleanup') {
      steps {
        sh 'docker system prune -af '
        sh 'whoami'
        sh 'ls -al'
        sh 'docker build --target web -t othom/othomdev:1 .'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh 'docker push "othom/othomdev:1"'
      }
    }
  }
}
