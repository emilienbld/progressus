pipeline{
  agent any
  stages {
    stage("Supprimer le workspace"){
      steps {
        deleteDir()
      }
    }
    stage("Checkout SCM"){
      steps {
        sh 'git clone https://github.com/emilienbld/progressus.git'
      }
    }

    stage("Build image docker"){
      steps {
        script{
          sh 'docker build -t myimage_nginx .'
          sh 'docker tag -t myimage_nginx jenkins:myimage_nginx'
        }
      }
    }

    stage("Déploiement application"){
      steps {
        script{
          sh 'docker rm image mynginx'
          sh 'docker rm -f $(docker ps -a)'
          sh 'docker run -d --name monapp --hostname monapp -p 8099:80 myimage_nginx'
        }
      }
    }
    
  }
}
