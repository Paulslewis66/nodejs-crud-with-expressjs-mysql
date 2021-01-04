pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/Paulslewis66/nodejs-crud-with-expressjs-mysql.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("paulslewis66/nodejs-app")
                }
            }
        }

      stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker", url: "" ]) {
          sh  'docker push paulslewis66/nodejs-app'
            }     
          }
        }  

stage('Deploy sql') {
      steps {
        script {
          kubernetesDeploy(configs: "deploy-sql.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

stage('Deploy sql-pv') {
      steps {
        script {
          kubernetesDeploy(configs: "deploy-sql-pv.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }


    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "deploy.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }
}

