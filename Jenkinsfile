pipeline{
  agent any
  environment{
    IMG_NAME = 'jenkins'
    DOCKER_REPO = 'myimage_nginx'
  }
  
  stages{
    stage('clean up'){
      steps{
        deleteDir()
      }
    }

    stage('Checkout SCM'){
      steps{
        git (
          branch: 'main',
          url: 'https://github.com/emilienbld/progressus.git'
        )
      }
    }
    stage('Build'){
      steps{
        script {
          sh "docker build -t ${IMG_NAME} ."
          sh "docker tag ${IMG_NAME} ${DOCKER_REPO}:${IMG_NAME}"
        }
      }
    }

    stage('deploiement conteneur'){
      steps{
        script {
          sh "docker stop monapp || true"
          sh "docker rm monapp || true"
          sh "docker run -d --name monapp --hostname monapp -p 8585:80 ${IMG_NAME}"
        }
      }
    }

  }
}
