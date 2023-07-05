pipeline {
  agent any 
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/vishwanath0303/spring-petclinic-jenkins-pipeline.git'
      }
    }
   // stage('Compile') {
      // steps {
      // bat 'mvn compile' //only compilation of the code
     //  }
   // }
    stage('mvn build') {
      steps {
        sh '''
        mvn clean install
        ls
        pwd
        ''' 
        //if the code is compiled, we test and package it in its distributable format; run IT and store in local repository
      }
    }
           stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t vkulkarni0303/spring .'
                }
            }
    }
            stage('Deploy'){
            steps {
                sh "docker stop spring | true"
                sh "docker rm spring | true"
                sh "docker run --name spring -d -p 9004:8080 vkulkarni0303/spring "
            }
        }
}
}
